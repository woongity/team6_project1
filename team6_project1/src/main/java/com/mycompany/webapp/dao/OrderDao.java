package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Order;

@Mapper
public interface OrderDao {
	public void insertOrder(Order order);
}
