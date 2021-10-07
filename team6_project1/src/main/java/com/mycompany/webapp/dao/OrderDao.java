package com.mycompany.webapp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Orderitem;

@Mapper
public interface OrderDao {
	List<Order> selectByMid(String mid);
	List<String> selectOidByMid(String mid);
	List<Orderitem> selectByOid(String oid);
	Order selectOneByOid(String oid);
	void update(String oid);
	void insertOrder(Order order);
}
