package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderDao;
import com.mycompany.webapp.dao.OrderitemDao;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.dto.OrderitemJoinProduct;
import com.mycompany.webapp.dto.OrderitemJoinProductJoinOrder;



@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);	
	
	@Resource 
	private OrderDao orderDao;

	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}
	public List<Order> selectByMid(String mid){
		return orderDao.selectByMid(mid);
	}
	public List<String> selectOidByMid(String mid){
		return orderDao.selectOidByMid(mid);
	}
	
	public List<Orderitem> selectByOid(String oid){
		return orderDao.selectByOid(oid);
	}
	
	public Order selectOneByOid(String oid){
		return orderDao.selectOneByOid(oid);
	}
	
	public void update(Order order) {
		orderDao.update(order);
	}
}
