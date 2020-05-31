package com.bookshop.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bookshop.bean.MailInfo;
import com.bookshop.dao.CustomerDAO;
import com.bookshop.entity.Customer;
import com.bookshop.service.CookieService;
import com.bookshop.service.MailService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;
	
	//them vao khi lam viec voi file tren website
	@Autowired
	ServletContext app;
	
	@Autowired
	MailService mailer;
	
	@Autowired
	HttpServletRequest request;

	//Hien Form ra
	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userid");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);
		}
		return "account/login";
	}

	//Xu li nut dang nhap
	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			// rm=remember me
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Invalid Password!");
		} else if (!user.getActivated()) {
			model.addAttribute("message", "Your account is Inactivated!");
		} else { // login thanh cong
			model.addAttribute("message", "Login successfully!");
			session.setAttribute("user", user);
			// Ghi nho tai khoan bang cookie
			if (rm == true) {
				cookie.create("userid", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userid");
				cookie.delete("pass");
			}
		}
		return "account/login";
	}

	@RequestMapping("/account/logout")
	public String logout(Model model) {
		//Dang xuat thi xoa user khoi session
		session.removeAttribute("user");
		return "redirect:/home/index";
	}

	@GetMapping("/account/register")
	public String register(Model model) {
		//Vì truyen bean vao form ở post nên ở đây cũng phải có bean user để đẩy từ form lên
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/register";
	}

	@PostMapping("/account/register")
	//nhan dang ky bang bean Customer user, truyen vao view bang @ModelAttribute "form"
	public String register(Model model, 
			@ModelAttribute("form") Customer user,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException, MessagingException {
		if (file.isEmpty()) {
			//set ảnh mặc định
			user.setPhoto("neko.jpg");
		} else {
			String dir = app.getRealPath("/static/avatar");
			//thư mục ở getRealPath với thêm tên của file gốc
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		user.setActivated(false);
		user.setAdmin(false);
		dao.create(user);
		model.addAttribute("message", "Register successfully");

		String from="queephuong99@gmail.com";
		String to=user.getEmail();
		String subject="Welcome";
		String url= request.getRequestURL().toString().replace("register", "activate/"+user.getId());
		String body="Click <a href='"+url+"'>Activate</a>";
		//Sau khi click activate thi doi duong dan /account/register thành /account/activate/{userid} 
		MailInfo mail= new MailInfo(from, to,subject, body); 
		mailer.send(mail);
		return "account/register";
	}
	
	@GetMapping("/account/activate/{id}")
	public String activate(Model model,
			@PathVariable("id") String id) {
		Customer user=dao.findById(id);
		user.setActivated(true);
		dao.update(user);
		return "redirect:/account/login";
	}

}
