package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Customer;

public interface CustomerDAO {
	Customer findById(String id);
	List<Customer> findAll();
	Customer create(Customer newCustomer);
	void update(Customer upentity);
	Customer deleteById(String id);
	
}
