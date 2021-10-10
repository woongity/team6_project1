package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Cartitem;

@Mapper
public interface CartitemDao {
	List<Cartitem> selectAllByMid(String mid);
	Cartitem selectOne(@Param("mid") String mid,@Param("pcode")  String pcode,@Param("pcolor")  String pcolor,@Param("psize")  String psize);
	void deleteItem(@Param("mid") String mid, @Param("pcode") String pcode, @Param("pcolor") String pcolor, @Param("psize") String psize);
	void insertItem(Cartitem cartitem);
	void updateItem(Cartitem cartitem);
	void updateOption(@Param("mid") String mid,@Param("pcode") String pcode,@Param("pcolor") String pcolor,@Param("psize")  String psize,@Param("new_pcolor")  String new_pcolor,@Param("new_psize")  String new_psize,@Param("new_pquantity") String new_pquantity);
	Cartitem selectItem(Cartitem cartitem);
	int selectCount(String mid);
}