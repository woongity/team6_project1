package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface CartitemDao {
	public void deleteCartitem(@Param("mid") String mid, @Param("pcode") String pcode, @Param("pcolor") String pcolor, @Param("psize") String psize);
}