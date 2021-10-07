package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.ListProduct;
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
	
	public HashMap<String, ListProduct> selectAll(){
		HashMap<String,ListProduct> hashMap = new HashMap<String, ListProduct>();
		List<Product> productList = productDao.selectAll();
		for(Product product:productList) {
			String pcode = product.getPcode();
			ListProduct listProduct;
			if(!hashMap.containsKey(pcode)) {
				listProduct = new ListProduct(new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new HashMap<String,Integer>());
			}
			else {
				listProduct = hashMap.get(pcode);
			}
			listProduct.setPbrand(product.getPbrand());
			listProduct.setPcode(product.getPcode());
			listProduct.setPname(product.getPname());
			listProduct.getPcolorTreeSet().add(product.getPcolor());
			listProduct.getPsizeTreeSet().add(product.getPsize());
			listProduct.getPimage1TreeSet().add(product.getPimage1());
			listProduct.getPimage2TreeSet().add(product.getPimage2());
			listProduct.getPimage3TreeSet().add(product.getPimage3());
			listProduct.getPcolorimageTreeSet().add(product.getPcolorimage());
			listProduct.setPprice(product.getPprice());
			listProduct.setPbrand(product.getPbrand());
			listProduct.getPstock().put(product.getPcolor()+product.getPsize(), product.getPstock());
			hashMap.put(pcode, listProduct);
		}
		return hashMap;
	}
	
	public int selectPquantity(String pcode, String pcolor, String psize) {
		return productDao.selectPquantity(pcode, pcolor, psize);
	}
	
	public void updatePstock(String pcode, String pcolor, String psize, int pquantity) {
		productDao.updatePstock(pcode, pcolor, psize, pquantity);
	}

}