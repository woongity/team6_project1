package com.mycompany.webapp.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.mycompany.webapp.dto.OrderDto;

@Mapper
public interface OrderDao {
	List<OrderDto> selectByMid(String mid);
	void insertOrder(OrderDto orderDto); 
	
}
