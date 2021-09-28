package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Product;

@Mapper
public interface ProductDao {
	public List<Product> selectByPno(String pid);
	public List<Product> selectAll();
	public void updateStock(Product product);
}