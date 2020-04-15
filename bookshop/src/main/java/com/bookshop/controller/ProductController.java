package com.bookshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@RequestMapping("product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product prod = pdao.findById(id);
		List<Product> list = pdao.findByCategoryId(prod.getCategory().getId());
		model.addAttribute("prod", prod);
		model.addAttribute("list", list);
		return "product/detail";
	}
	
	@ResponseBody
	@RequestMapping("product/add-to-favo/{id}")
	public boolean addToFavorite(Model model, @PathVariable("id") Integer id) {
		Cookie favo=cookie.read("favo");
		String value= id.toString();
		if(favo!=null) {
			value= favo.getValue();
			if(!value.contains(id.toString())) {
				value += "," + id.toString();
			}
			else return false;
		}
		cookie.create("favo", value, 30);
		
		return true;
	}

}
