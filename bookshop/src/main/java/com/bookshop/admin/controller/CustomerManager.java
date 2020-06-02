package com.bookshop.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.dao.CustomerDAO;
import com.bookshop.entity.Customer;

@Controller
public class CustomerManager {
	@Autowired
	CustomerDAO dao;
	
	@Autowired
	ServletContext app;
	
	
	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		Customer entity= new Customer();
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") String id) {
		Customer entity= dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list", dao.findAll());
		
		return "admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/create")
	//Vì xài redirect nên Message trả về dạng tham số
	//--> truyền model là RedirectAttribute để trả về tham số
	public String create(RedirectAttributes model,
			@ModelAttribute("entity") Customer entity, /*lấy model entity từ _form.jsp*/
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (file.isEmpty()) {
			entity.setPhoto("neko.jpg");
		}
		else {
			entity.setPhoto(file.getOriginalFilename());
			String path=app.getRealPath("/static/avatar/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		dao.create(entity);
		model.addAttribute("message", "Add customer successfully !");
		//Không để "admin/customer/index" vì dữ liệu thêm xong vẫn còn nằm trên form
		//Ngta F5 là insert tiếp
		//Muốn insert xong thì trang sẽ trống
		//Thì redirect về index
		return "redirect:/admin/customer/index";
	}
	
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model,
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path=app.getRealPath("/static/avatar/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("message", "Update customer successfully !");
		return "redirect:/admin/customer/edit/" + entity.getId();
	}
	
	@RequestMapping(value={"/admin/customer/delete", "/admin/customer/delete/{id}"}) 
	public String delete(RedirectAttributes model,
			//Không cần phải có tham số vẫn chạy được 
			//--> required=false
			@RequestParam(value="id", required=false) String id1,
			@PathVariable(value="id", required=false) String id2) {
		if(id1 !=null) {
			dao.deleteById(id1);
		}
		else {
			dao.deleteById(id2);
		}
		model.addAttribute("message", "Update customer successfully !");
		return "redirect:/admin/customer/index";
	}
}

