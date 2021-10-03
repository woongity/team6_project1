package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartitemDao;
import com.mycompany.webapp.dto.Cartitem;

@Service
public class CartitemService {
	private static final Logger logger = LoggerFactory.getLogger(CartitemService.class);
	
	@Resource
	private CartitemDao cartitemDao;
	
	public void insertItem(Cartitem cartitem) {
		logger.info("insert item");
		cartitemDao.insertItem(cartitem);
	}
	public void updateItem(Cartitem cartitem) {
		logger.info("실행");
		cartitemDao.updateItem(cartitem);
	}
	
	public Cartitem selectItem(Cartitem cartitem) {
		return cartitemDao.selectItem(cartitem);
	}
	
	public void deleteItem(String mid, String pcode, String pcolor, String psize) {
		cartitemDao.deleteItem(mid, pcode,pcolor,psize);
	}
	
	public List<Cartitem> selectAllByMid(String mid){
		return cartitemDao.selectAllByMid(mid);
	}
	public Cartitem selecOne(String mid,String pcode, String pcolor, String psize){
		return cartitemDao.selectOne(mid,pcode,pcolor,psize);
	}

}
