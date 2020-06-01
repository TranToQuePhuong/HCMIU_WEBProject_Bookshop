package com.bookshop.dao;

import java.util.List;

import com.bookshop.entity.Order;
import com.bookshop.entity.OrderDetail;

public interface OrderDetailDAO {
	OrderDetail findById(int id);

	List<OrderDetail> findAll();

	OrderDetail create(OrderDetail newOrderDetail);

	void update(OrderDetail upentity);

	OrderDetail deleteById(int id);

	List<OrderDetail> findByOrder(Order order);

}
