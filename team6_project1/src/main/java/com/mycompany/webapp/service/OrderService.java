package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderDao;
import com.mycompany.webapp.dto.Order;

@Service
public class OrderService {
	@Resource
	private OrderDao orderDao;
	
	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}
}
