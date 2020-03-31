package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Category;

public interface CategoryDAO {
	Category findById(int id);
	List<Category> findAll();
	Category create(Category entity);
	void update(Category entity);
	Category deleteById(int id);
	
}
