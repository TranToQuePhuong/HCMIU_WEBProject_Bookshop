package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Order;
import com.bookshop.entity.OrderDetail;

public interface OrderDAO {
	Order findById(int id);

	List<Order> findAll();

	Order create(Order entity);

	void update(Order entity);

	Order deleteById(int id);

	void create(Order order, List<OrderDetail> details);

}
