package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Orderitem;

@Mapper
public interface OrderitemDao {
	public void insertOrderitem(Orderitem orderitem);
}
