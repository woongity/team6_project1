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
public class OrderViewService {
	private static final Logger logger = LoggerFactory.getLogger(OrderViewService.class);	
	
	@Resource 
	private OrderDao orderDao;
	@Resource
	private OrderitemDao orderitemDao;
	
	public List<Order> selectByMid(String mid){
		return orderDao.selectByMid(mid);
	}
	public List<OrderitemJoinProduct> selectOrderitemJoinProductByOid(String oid){
		return orderitemDao.selectOrderitemJoinProductByOid(oid);
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

	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderByOid(String mid){
		return orderitemDao.selectOrderitemJoinProductByMid(mid);
	}
	
	public void insertOrder(Order order) {
		orderDao.insertOrder(order);
	}
}
