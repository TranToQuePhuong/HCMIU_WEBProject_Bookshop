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

import com.bookshop.dao.ProductDAO;
import com.bookshop.entity.Product;

@Controller
public class ProductManager {
	@Autowired
	ProductDAO dao;
	
	@Autowired
	ServletContext app;
	
	
	@RequestMapping("/admin/product/index")
	public String index(Model model) {
		Product entity= new Product();
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Integer id) {
		Product entity= dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list", dao.findAll());
		
		return "admin/product/index";
	}
	
	@RequestMapping("/admin/product/create")
	//Vì xài redirect nên Message trả về dạng tham số
	//--> truyền model là RedirectAttribute để trả về tham số
	public String create(RedirectAttributes model,
			@ModelAttribute("entity") Product entity, /*lấy model entity từ _form.jsp*/
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if (file.isEmpty()) {
			entity.setImage("neko.jpg");
		}
		else {
			entity.setImage(file.getOriginalFilename());
			String path=app.getRealPath("/static/avatar/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.create(entity);
		model.addAttribute("message", "Add product successfully !");
		//Không để "admin/product/index" vì dữ liệu thêm xong vẫn còn nằm trên form
		//Ngta F5 là insert tiếp
		//Muốn insert xong thì trang sẽ trống
		//Thì redirect về index
		return "redirect:/admin/product/index";
	}
	
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model,
			@ModelAttribute("entity") Product entity,
			@RequestParam("image_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path=app.getRealPath("/static/avatar/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("message", "Update product successfully !");
		return "redirect:/admin/product/edit/" + entity.getId();
	}
	
	@RequestMapping(value={"/admin/product/delete", "/admin/product/delete/{id}"}) 
	public String delete(RedirectAttributes model,
			//Không cần phải có tham số vẫn chạy được 
			//--> required=false
			@RequestParam(value="id", required=false) Integer id1,
			@PathVariable(value="id", required=false) Integer id2) {
		if(id1 !=null) {
			dao.deleteById(id1);
		}
		else {
			dao.deleteById(id2);
		}
		model.addAttribute("message", "Update product successfully !");
		return "redirect:/admin/product/index";
	}
}

