package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderDao;
import com.mycompany.webapp.dto.OrderDto;
import com.mycompany.webapp.dto.OrderProductJoinDto;


@Service
public class OrderViewService {
	@Resource 
	private OrderDao orderdao;
	private static final Logger logger = LoggerFactory.getLogger(OrderViewService.class);	
	public List<OrderDto> selectByMid(String mid){
		return orderdao.selectByMid(mid);
	}
	public void insertOrder(OrderDto orderdto) {
		orderdao.insertOrder(orderdto);
	}

	public List<OrderProductJoinDto> selectOrderJoinProductByMid(String mid) {
		return orderdao.selectOrderJoinProductByMid(mid);
	}
}
