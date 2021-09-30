package com.mycompany.webapp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.dto.Order;

@Mapper
public interface OrderDao {
	List<Order> selectByMid(String mid);
	List<String> selectOidByMid(String mid);
}
