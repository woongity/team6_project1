package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderitemJoinProductJoinOrder;


@Mapper
public interface OrderitemDao {
	List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductByMid(String mid);
}
