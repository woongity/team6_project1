package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.ListController;
import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Product;

@Service
public class ListviewService {
	private static final Logger logger = LoggerFactory.getLogger(ListviewService.class);
	@Resource 
	private ProductDao productDao;
	
	public Product selectOne(String pcode,String pcolor, String psize){
		return productDao.selectOne(pcode,pcolor,psize);
	}
	
	public List<Product> selectByPcode(String pcode) {
		return productDao.selectByPcode(pcode);
	}
	
	public List<Product> selectAll(){
		return productDao.selectAll();
	}
	public void updateStock(Product product) {
		productDao.updateStock(product);
	}
	public List<Product> selectByPname(String pname){
		return productDao.selectByPname(pname);
	}
}