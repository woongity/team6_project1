package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderitemDao;
import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.dto.OrderitemJoinProductJoinOrder;

@Service
public class OrderitemService {
	@Resource
	private OrderitemDao orderitemDao;
	
	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderinfoByMid(String mid){
		return orderitemDao.selectOrderitemJoinProductJoinOrderinfoByMid(mid);
	}
	
	public void insertOrderitem(Orderitem orderitem) {
		orderitemDao.insertOrderitem(orderitem);
	}

}
