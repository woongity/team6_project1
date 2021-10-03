package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderitemJoinProduct;

@Mapper
public interface OrderitemDao {
	List<OrderitemJoinProduct> selectOrderitemJoinProductByOid(String oid);
}