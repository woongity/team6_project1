package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderitemDao;
import com.mycompany.webapp.dto.Orderitem;

@Service
public class OrderitemService {
	@Resource
	private OrderitemDao orderitemDao;
	
	public void insertOrderitem(Orderitem orderitem) {
		orderitemDao.insertOrderitem(orderitem);
	}
	
}
