package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Cartitem;

@Mapper
public interface CartitemDao {
	void insertItem(Cartitem cartbag);
}