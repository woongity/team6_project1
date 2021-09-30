package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Product;

@Mapper
public interface ProductDao {
	public List<Product> selectByPcode(String pcode);
	public List<Product> selectAll();
	public void updateStock(Product product);
}