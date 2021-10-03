package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProductDao {
	public int selectPquantity(@Param("pcode") String pcode, @Param("pcolor") String pcolor, @Param("psize") String psize);
	public void updatePstock(@Param("pcode") String pcode, @Param("pcolor") String pcolor, @Param("psize") String psize, @Param("pquantity") int pquantity);
}