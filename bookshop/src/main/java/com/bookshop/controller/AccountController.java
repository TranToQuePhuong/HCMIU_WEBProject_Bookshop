package com.bookshop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop.dao.CustomerDAO;
import com.bookshop.entity.Customer;
import com.bookshop.service.CookieService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;
	
	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}
	
	@PostMapping("/account/login")
	public String login(Model model,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			//rm=remember me
			@RequestParam(value="rm",defaultValue="false") boolean rm) {
		Customer user= dao.findById(id);
		if(user==null) {
			model.addAttribute("message","Invalid username!");
		}
		else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message","Invalid Password!");
		}
		else if(!user.getActivated()) {
			model.addAttribute("message","Your account is Inactivated!");
		}
		else { //login thanh cong
			model.addAttribute("message", "Login successfully!");
			session.setAttribute("user", user);
			//Ghi nho tai khoan bang cookie
			if(rm==true) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			}
			else {
				cookie.delete("userid");
				cookie.delete("pass");
			}
		}
		return "account/login";
	}
	
}
