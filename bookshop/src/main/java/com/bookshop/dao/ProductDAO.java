package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Product;

public interface ProductDAO {
	Product findById(int id);
	List<Product> findAll();
	Product create(Product entity);
	void update(Product entity);
	Product deleteById(int id);
	List<Product> findByCategoryId(Integer categoryId);
	List<Product> findByKeywords(String keywords);
	

}
