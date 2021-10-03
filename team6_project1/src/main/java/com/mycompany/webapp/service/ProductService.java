package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Product;

@Service
public class ProductService {
	@Resource
	private ProductDao productDao;
	
	public int selectPquantity(String pcode, String pcolor, String psize) {
		return productDao.selectPquantity(pcode, pcolor, psize);
	}
	
	public void updatePstock(String pcode, String pcolor, String psize, int pquantity) {
		productDao.updatePstock(pcode, pcolor, psize, pquantity);
	}
}
