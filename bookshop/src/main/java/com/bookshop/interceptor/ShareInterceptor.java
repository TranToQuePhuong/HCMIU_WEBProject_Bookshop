package com.bookshop.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bookshop.dao.CategoryDAO;
import com.bookshop.entity.Category;

@Component
public class ShareInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	CategoryDAO dao;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		List<Category> list = dao.findAll();
		modelAndView.addObject("cates", list);
	}
}
