package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.dto.OrderitemJoinProductJoinOrder;

@Mapper
public interface OrderitemDao {
	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderinfoByMid(String mid);
	public void insertOrderitem(Orderitem orderitem);
	public List<OrderitemJoinProductJoinOrder> selectOrderitemJoinProductJoinOrderinfoByMidDate(@Param("mid") String mid,@Param("fromtime") String fromtime,@Param("totime") String totime);
}
