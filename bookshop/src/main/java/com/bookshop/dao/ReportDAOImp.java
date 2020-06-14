package com.bookshop.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop.entity.Order;

@Transactional
@Repository
public class ReportDAOImp implements ReportDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Object[]> inventory() {
		String hql="SELECT p.category.name, "
				+ "SUM(p.quantity), " //số lượng các mặt hàng trong cùng 1 category
				+ "SUM(p.unitPrice*p.quantity), "
				+ "MIN(p.unitPrice), "
				+ "MAX(p.unitPrice), "
				+ "AVG(p.unitPrice) "
				+"FROM Product p "
				+ "GROUP BY p.category.name";
		
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCategory() {
		String hql="SELECT od.product.category.name, "
				+ "SUM(od.quantity), " //số lượng các mặt hàng trong cùng 1 category
				+ "SUM(od.unitPrice*od.quantity), "
				+ "MIN(od.unitPrice), "
				+ "MAX(od.unitPrice), "
				+ "AVG(od.unitPrice) "
				+"FROM OrderDetail od "
				+ "GROUP BY od.product.category.name";
		
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByCustomer() {
		String hql="SELECT od.order.customer.id, "
				+ "SUM(od.quantity), " //số lượng các mặt hàng trong cùng 1 category
				+ "SUM(od.unitPrice*od.quantity), "
				+ "MIN(od.unitPrice), "
				+ "MAX(od.unitPrice), "
				+ "AVG(od.unitPrice) "
				+"FROM OrderDetail od "
				+ "GROUP BY od.order.customer.id ";
				//+ "ORDER BY SUM(od.unitPrice*od.quantity) DESC";
		
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByYear() {
		String hql="SELECT YEAR(od.order.orderDate), "
				+ "SUM(od.quantity), " //số lượng các mặt hàng trong cùng 1 category
				+ "SUM(od.unitPrice*od.quantity), "
				+ "MIN(od.unitPrice), "
				+ "MAX(od.unitPrice), "
				+ "AVG(od.unitPrice) "
				+"FROM OrderDetail od "
				+ "GROUP BY YEAR(od.order.orderDate) "
				+ "ORDER BY YEAR(od.order.orderDate) DESC";
		
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByMonth() {
		String hql="SELECT MONTH(od.order.orderDate), "
				+ "SUM(od.quantity), " //số lượng các mặt hàng trong cùng 1 category
				+ "SUM(od.unitPrice*od.quantity), "
				+ "MIN(od.unitPrice), "
				+ "MAX(od.unitPrice), "
				+ "AVG(od.unitPrice) "
				+"FROM OrderDetail od "
				+ "GROUP BY MONTH(od.order.orderDate) "
				+ "ORDER BY MONTH(od.order.orderDate) DESC";
		
		Session session = factory.getCurrentSession();
		// contact to Order table in database
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;	}
		

}
