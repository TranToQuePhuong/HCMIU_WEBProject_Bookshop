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

	@Override
	public List<Product> findByCategoryId(Integer categoryId) {
		// TODO Auto-generated method stub
		String hql = "FROM Product p WHERE p.category.id=:cid";
		Session session = factory.getCurrentSession();
		// contact to Product table in database
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("cid", categoryId);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByKeywords(String keywords) {
		String hql = "FROM Product p"
				+ " WHERE p.name LIKE :kw OR p.category.name LIKE :kw";
		Session session = factory.getCurrentSession();
		// contact to Product table in database
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findByIds(String ids) {
		// TODO Auto-generated method stub
		String hql = "FROM Product p WHERE p.id IN("+ids+")";
		System.out.println(hql);
		Session session = factory.getCurrentSession();
		// contact to Product table in database
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		List<Product> list = query.getResultList();
		return list;
	}

	@Override
	public List<Product> findBySpecial(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p";
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		switch(id) {
		case 0: // new arrivals
			hql = "FROM Product p ORDER BY p.productDate DESC";
			break;
		case 1: // best-selling
			hql = "FROM Product p ORDER BY size(p.orderDetails) DESC";
			break;
		case 2: // Most Viewed
			hql = "FROM Product p ORDER BY p.viewCount DESC";
			break;	 
		case 3: // Sale
			hql = "FROM Product p ORDER BY p.discount DESC";
			break;
		}
		query = session.createQuery(hql,Product.class);
		query.setMaxResults(12); // SELECT TOP 12 DESCENDING 

		List<Product> list = query.getResultList();
		return list;
	}
}
