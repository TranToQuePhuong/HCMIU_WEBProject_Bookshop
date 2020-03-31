package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.bookshop.entity.Order;

@Transactional
public class OrderDAOImp implements OrderDAO{
	
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
}
