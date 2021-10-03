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
	private CartitemDao cartbagdao;
	
	public void insertItem(Cartitem cartitem) {
		logger.info("insert item");
		cartbagdao.insertItem(cartitem);
	}
	public void updateItem(Cartitem cartitem) {
		logger.info("실행");
		cartbagdao.updateItem(cartitem);
	}
	
	public Cartitem selectItem(Cartitem cartitem) {
		return cartbagdao.selectItem(cartitem);
	}
}
