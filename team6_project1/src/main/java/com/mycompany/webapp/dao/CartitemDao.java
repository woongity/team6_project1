package com.mycompany.webapp.dao;
import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Cartitem;

@Mapper
public interface CartitemDao {
	void insertItem(Cartitem cartitem);
	void updateItem(Cartitem cartitem);
	Cartitem selectItem(Cartitem cartitem);
}