package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartitemDao;
import com.mycompany.webapp.dto.Cartitem;

@Service
public class CartService {
	private static final Logger logger = LoggerFactory.getLogger(CartService.class);
	
	@Resource
	private CartitemDao cartitemDao;
	
	public List<Cartitem> selectAllByMid(String mid){
		return cartitemDao.selectAllByMid(mid);
	}
	public Cartitem selecOne(String mid,String pcode, String pcolor, String psize){
		return cartitemDao.selectOne(mid,pcode,pcolor,psize);
	}
	public void deleteitem(String mid, String pcode, String pcolor, String psize) {
		cartitemDao.deleteitem(mid, pcode,pcolor,psize);
	}
	public void insertitem(Cartitem cartitem) {
		cartitemDao.insertitem(cartitem);
	}
}
