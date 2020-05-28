package com.bookshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookshop.service.CartService;

@Controller
public class ShoppingCartController {
	@Autowired
	CartService cart;
	
	@ResponseBody
	@RequestMapping(value = "/cart/update/{id}/{quantity}", method = RequestMethod.GET)
	public Object[] update
	(@PathVariable("id") Integer id,
	 @PathVariable("quantity") Integer quantity) {
		System.out.println(id + quantity);
		cart.update(id,quantity);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@ResponseBody
	@RequestMapping("/cart/add/{id}") 
	public Object[] add(@PathVariable("id") Integer id) {
		cart.add(id);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
	@RequestMapping("/cart/view")
	public String view() {
		return "cart/view";
	}
	
	@ResponseBody
	@RequestMapping("/cart/clear")
	public void clear() {
		cart.clear();
	}
	
	@ResponseBody
	@RequestMapping("/cart/remove/{id}")
	public Object[] remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		Object[] info = {cart.getCount(), cart.getAmount()};
		return info;
	}
	
}
