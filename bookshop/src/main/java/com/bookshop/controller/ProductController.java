package com.bookshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.dao.ProductDAO;
import com.bookshop.entity.Product;
import com.bookshop.service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	CookieService cookie;

	@RequestMapping("product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("product/list-by-keywords")
	public String listByKeywords(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
	}
	
	@RequestMapping("product/list-by-special/{id}")
	public String listBySpecial(Model model, @PathVariable("id") Integer id) {
		List<Product> list = pdao.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list";
	}

	@RequestMapping("product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product prod = pdao.findById(id);
		model.addAttribute("prod", prod);
		
		// Increase viewed count
		prod.setViewCount(prod.getViewCount() + 1);
		pdao.update(prod);
		
		// Similar products
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("list", list);
		
		
		// Favorite products
		Cookie favo = cookie.read("favo");
		if(favo != null) {
			String ids = favo.getValue();
			List<Product> favo_list = pdao.findByIds(ids);
			model.addAttribute("favo",favo_list);
			
			
		}
		
		// Viewd products
		Cookie viewed=cookie.read("viewed");
		String value = id.toString();
		if(viewed != null) {
			value = viewed.getValue();
			value += "," + id.toString();
		}
		// create cookie expired in 30 days
		cookie.create("viewed", value, 30);
		List<Product> viewed_list = pdao.findByIds(value);
		model.addAttribute("viewed", viewed_list);
			
		
		
		return "product/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "product/add-to-favo/{id}", method = RequestMethod.GET)
	//, produces = "application/json;charset=utf-8" --> Neu muon tra ve boolean
	public String addToFavorite(Model model, @PathVariable("id") Integer id) {
		Cookie favo=cookie.read("favo");
		String value= id.toString();
		if(favo!=null) {
			value= favo.getValue();
			if(!value.contains(id.toString())) {
				value += "," + id.toString();
			}
			else {
				System.out.println("False");
				return "0";
			}
		}
		cookie.create("favo", value, 30);
		return "1";
	}

}
