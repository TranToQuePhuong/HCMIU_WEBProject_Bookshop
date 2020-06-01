package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.entity.Customer;
import com.bookshop.entity.Order;
import com.bookshop.entity.OrderDetail;
import com.bookshop.entity.Product;

@Transactional
@Repository
public class OrderDAOImp implements OrderDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public Order create(Order entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public Order deleteById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Order findEntity = findById(id);
		session.delete(findEntity);
		return findEntity;
	}

	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Order";
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public Order findById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Order findEntity = session.find(Order.class, id);
		return findEntity;
	}

	@Override
	public void update(Order entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public void create(Order order, List<OrderDetail> details) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(order);
		order.setOrderDetails(details);
		for (OrderDetail detail : details) {
			session.save(detail);
		}

	}

	@Override
	public List<Order> findByUser(Customer user) {
		String hql = "FROM Order o WHERE o.customer.id=:uid ORDER BY o.orderDate DESC";
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Order> query = session.createQuery(hql, Order.class);
		query.setParameter("uid", user.getId());
		List<Order> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findItemsByUser(Customer user) {
		// TODO Auto-generated method stub
		String hql = "SELECT DISTINCT d.product " + "FROM OrderDetail d " + "WHERE d.order.customer.id=:uid";
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("uid", user.getId());
		List<Product> list = query.getResultList();
		return list;
	}
}
