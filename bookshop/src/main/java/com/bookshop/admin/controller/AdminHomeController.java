package com.bookshop.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeController {
	//Đặt tên Mapping khác với bên giao diện thường để k bị báo lỗi
	@RequestMapping("/admin/home/index")
	public String index() {
		return "admin/home/index";
	}
}
