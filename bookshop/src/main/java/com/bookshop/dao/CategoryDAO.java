package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Category;

public interface CategoryDAO {
	Category findById(int id);
	List<Category> findAll();
	Category create(Category newcategory);
	void update(Category upentity);
	Category deleteById(int id);
	
}
