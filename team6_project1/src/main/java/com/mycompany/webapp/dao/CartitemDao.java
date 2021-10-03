package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Cartitem;

@Mapper
public interface CartitemDao {
	List<Cartitem> selectAllByMid(String mid);
	Cartitem selectOne(@Param("mid") String mid,@Param("pcode")  String pcode,@Param("pcolor")  String pcolor,@Param("psize")  String psize);
	void deleteitem(@Param("mid") String mid,@Param("pcode") String pcode,@Param("pcolor") String pcolor,@Param("psize") String psize);
	void insertitem(Cartitem cartitem);
}