package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.bookshop.entity.OrderDetail;

@Transactional
public class OrderDetailDAOImp implements OrderDetailDAO{
	
	@Autowired
	SessionFactory factory;
	
	@Override
	public OrderDetail create(OrderDetail entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}
	@Override
	public OrderDetail deleteById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		OrderDetail findEntity = findById(id);
		session.delete(findEntity);
		return findEntity;
	}
	@Override
	public List<OrderDetail> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM OrderDetail";
		Session session = factory.getCurrentSession();
		// contact to OrderDetail table in database
		TypedQuery<OrderDetail> query = session.createQuery(hql, OrderDetail.class);
		List<OrderDetail> list = query.getResultList();
		return list;
	}
	@Override
	public OrderDetail findById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		OrderDetail findEntity = session.find(OrderDetail.class, id);
		return findEntity;
	}
	@Override
	public void update(OrderDetail entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);

		
	}
}
