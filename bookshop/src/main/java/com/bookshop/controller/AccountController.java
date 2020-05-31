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
	public String login(Model model, 
				@RequestParam("id") String id, 
				@RequestParam("pw") String pw,
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
			//Quay lại trang đã lưu trong "back-url" (nếu có)
			String backUrl = (String)session.getAttribute("back-url");
			if(backUrl !=null) {
				return "redirect:" + backUrl;
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

		String from="bookshopPQD@gmail.com";
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
	
	//hiện cái form forgot ra
	@GetMapping("/account/forgotPassword")
	public String forgotPassword(Model model) {
		return "account/forgotPassword";
	}
	
	@PostMapping("/account/forgotPassword")
	public String forgotPassword(Model model,
			@RequestParam("id") String id, 
			@RequestParam("email") String email) throws MessagingException {
		//Vì truyen bean vao form ở post nên ở đây cũng phải có bean user để đẩy từ form lên
		Customer user = dao.findById(id);
		if(user==null) {
			model.addAttribute("message", "Invalid username");
		}
		else if(!email.equals(user.getEmail())) {
			model.addAttribute("message", "Invalid email address");
		}
		else {
			String from="bookshopPQD@gmail.com";
			String to=user.getEmail();
			String subject="Forgot password";
			String body="Your password is: " + user.getPassword();
			//Sau khi click activate thi doi duong dan /account/register thành /account/activate/{userid} --> tạo url để control đường dẫn
			MailInfo mail= new MailInfo(from, to,subject, body); 
			mailer.send(mail);
			
			model.addAttribute("message", "Your password was sent. Please check inbox of your registered email !");
		}
		
		return "redirect:/account/login";
	}

	
	@GetMapping("/account/changePassword")
	public String changePassword(Model model) {
		return "account/changePassword";
	}

	@PostMapping("/account/changePassword")
	public String changePassword(Model model, 
			@RequestParam("id") String id, 
			@RequestParam("pw") String pw,
			@RequestParam("npw1") String npw1, 
			@RequestParam("npw2") String npw2) throws MessagingException {
		
		if(!npw1.equals(npw2)) {
			model.addAttribute("message","Confirm password is not match!");
		}
		else {
			Customer user = dao.findById(id);
				if(user==null) {
					model.addAttribute("message", "Invalid username");
				}
				else if(!pw.equals(user.getPassword())) {
					model.addAttribute("message", "Invalid Password");
				}
				else {
					user.setPassword(npw1);
					dao.update(user);
					
					model.addAttribute("message","Change password successfully");
			
				}
	
		}
		return "redirect:/account/login";
	}

	@GetMapping("/account/update")
	public String update(Model model) {
		//Vì truyen bean vao form ở post nên ở đây cũng phải có bean user để đẩy từ form lên
		Customer user = (Customer) session.getAttribute("user");
		model.addAttribute("form", user);
		return "account/update";
	}

	@PostMapping("/account/update")
	public String update(Model model, 
			@ModelAttribute("form") Customer user,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			String dir = app.getRealPath("/static/avatar");
			//thư mục ở getRealPath với thêm tên của file gốc
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		dao.update(user);
		//Update ban đầu chỉ mới đổi đc thông tin dưới database 
		//session vẫn chưa đổi 
		//(load trang vẫn lưu thông tin cũ lúc chưa update dù dtb đã đổi)
		//-->phải làm cho update đc cả trong session
		session.setAttribute("user", user);
		model.addAttribute("message", "Update successfully");
		return "account/update";
	}
}
