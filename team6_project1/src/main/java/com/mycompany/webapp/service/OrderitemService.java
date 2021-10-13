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

	public void insertOrderitem(Orderitem orderitem) {
		orderitemDao.insertOrderitem(orderitem);
	}

	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderinfoByMid(String mid) {
		return orderitemDao.selectOrderitemJoinProductJoinOrderinfoByMid(mid);
	}
	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderinfoByMidDate(String mid,String fromtime,String totime) {
		return orderitemDao.selectOrderitemJoinProductJoinOrderinfoByMidDate(mid,fromtime,totime);
	}
}
