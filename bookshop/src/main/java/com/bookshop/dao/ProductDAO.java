package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Product;

public interface ProductDAO {
	Product findById(int id);
	List<Product> findAll();
	Product create(Product newProduct);
	void update(Product upentity);
	Product deleteById(int id);
	
}
