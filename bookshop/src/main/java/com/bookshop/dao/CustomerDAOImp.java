package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.entity.Customer;

@Transactional
@Repository
public class CustomerDAOImp implements CustomerDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public Customer create(Customer entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public Customer deleteById(String id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Customer findEntity = findById(id);
		session.delete(findEntity);
		return findEntity;
	}

	@Override
	public List<Customer> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Customer";
		Session session = factory.getCurrentSession();
		// contact to Customer table in database
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	@Override
	public Customer findById(String id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Customer findEntity = session.find(Customer.class, id);
		return findEntity;
	}

	@Override
	public void update(Customer entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);

	}
}
