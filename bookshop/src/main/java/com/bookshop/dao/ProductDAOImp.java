package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookshop.entity.Product;

@Transactional
@Repository
public class ProductDAOImp implements ProductDAO {

	@Autowired
	SessionFactory factory;

	@Override
	public Product create(Product entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public Product deleteById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Product findEntity = findById(id);
		session.delete(findEntity);
		return findEntity;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		// contact to Product table in database
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public Product findById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		Product findEntity = session.find(Product.class, id);
		return findEntity;
	}

	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.update(entity);

	}
}