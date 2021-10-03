package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartitemDao;

@Service
public class CartitemService {
	@Resource
	private CartitemDao cartitemDao;
	
	public void deleteCartitem(String mid, String pcode, String pcolor, String psize) {
		cartitemDao.deleteCartitem(mid, pcode, pcolor, psize);
	}
}
