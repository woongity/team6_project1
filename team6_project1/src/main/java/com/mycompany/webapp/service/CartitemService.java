package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartitemDao;
import com.mycompany.webapp.dto.CartitemJoinProduct;

@Service
public class CartitemService {
	@Resource
	private CartitemDao cartitemDao;
	
	public void deleteCartitem(String mid, String pcode, String pcolor, String psize) {
		cartitemDao.deleteCartitem(mid, pcode, pcolor, psize);
	}
	
	public List<CartitemJoinProduct> selectCartitemJoinProductByPcodePcolorPsize(String mid, ArrayList<String> pcode, ArrayList<String> pcolor, ArrayList<String> psize) {
		return cartitemDao.selectCartitemJoinProductByPcodePcolorPsize(mid, pcode, pcolor, psize);
	}

}
