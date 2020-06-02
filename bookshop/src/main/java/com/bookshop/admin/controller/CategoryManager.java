package com.bookshop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookshop.dao.CategoryDAO;
import com.bookshop.entity.Category;

@Controller
public class CategoryManager {
	@Autowired
	CategoryDAO dao;
	
	
	@RequestMapping("/admin/category/index")
	public String index(Model model) {
		Category entity= new Category();
		model.addAttribute("entity",entity);
		model.addAttribute("list",dao.findAll());
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Integer id) {
		Category entity= dao.findById(id);
		model.addAttribute("entity",entity);
		model.addAttribute("list", dao.findAll());
		
		return "admin/category/index";
	}
	
	@RequestMapping("/admin/category/create")
	//Vì xài redirect nên Message trả về dạng tham số
	//--> truyền model là RedirectAttribute để trả về tham số
	public String create(RedirectAttributes model,
			@ModelAttribute("entity") Category entity /*lấy model entity từ _form.jsp*/) {
		dao.create(entity);
		model.addAttribute("message", "Add category successfully !");
		//Không để "admin/category/index" vì dữ liệu thêm xong vẫn còn nằm trên form
		//Ngta F5 là insert tiếp
		//Muốn insert xong thì trang sẽ trống
		//Thì redirect về index
		return "redirect:/admin/category/index";
	}
	
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model,
			@ModelAttribute("entity") Category entity) {
		dao.update(entity);
		model.addAttribute("message", "Update category successfully !");
		return "redirect:/admin/category/edit/" + entity.getId();
	}
	
	@RequestMapping(value={"/admin/category/delete", "/admin/category/delete/{id}"}) 
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
		model.addAttribute("message", "Update category successfully !");
		return "redirect:/admin/category/index";
	}
}
