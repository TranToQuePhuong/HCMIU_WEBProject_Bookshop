package com.bookshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.dao.CategoryDAO;
import com.bookshop.dao.ProductDAO;
import com.bookshop.entity.Category;
import com.bookshop.entity.Product;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	@RequestMapping("product/list-by-category/{cid}")
	public String listByCategory(Model model,
			@PathVariable("cid") Integer categoryId) {
		List<Product> list=pdao.findByCategoryId(categoryId);
		model.addAttribute("list",list);
		return "product/list";
	}
	
	@RequestMapping("product/list-by-keywords")
	public String listByKeywords(Model model,
			@RequestParam("keywords") String keywords) {
		List<Product> list=pdao.findByKeywords(keywords);
		model.addAttribute("list",list);
		return "product/list";
	}
	
	

}
