package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CartbagDto;

@Mapper
public interface CartbagDao {
	List<CartbagDto> selectByMid(String mid);
	void deleteByMidnPid(String pid);
	void update(CartbagDto cartbag);
	void insertItem(CartbagDto cartbag);
}