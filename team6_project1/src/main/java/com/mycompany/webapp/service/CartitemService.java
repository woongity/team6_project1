package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.CartitemDao;
import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Cartitem;
import com.mycompany.webapp.dto.CartitemJoinProduct;
import com.mycompany.webapp.exception.OutOfStockExceptionHandler;

@Service
public class CartitemService {
	private static final Logger logger = LoggerFactory.getLogger(CartitemService.class);
	
	@Resource
	private CartitemDao cartitemDao;
	@Resource
	private ProductDao productDao;
	
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
	public Cartitem selectOne(String mid,String pcode, String pcolor, String psize){
		return cartitemDao.selectOne(mid,pcode,pcolor,psize);
	}
	
	@Transactional
	public ArrayList<CartitemJoinProduct> selectCartitemJoinProductByPcodePcolorPsize(String mid, ArrayList<String> pcode, ArrayList<String> pcolor, ArrayList<String> psize) {
		ArrayList<CartitemJoinProduct> returnCartitemJoinProduct = new ArrayList<CartitemJoinProduct>();
		
		List<CartitemJoinProduct> cartitemJoinProduct = cartitemDao.selectCartitemJoinProductByPcodePcolorPsize(mid, pcode, pcolor, psize);
		for(CartitemJoinProduct cp : cartitemJoinProduct) {
			if(cp.getPquantity() > productDao.selectPquantity(cp.getPcode(), cp.getPcolor(), cp.getPsize())) {
				throw new OutOfStockExceptionHandler(cp.getPname() + " 제품의 재고가 부족합니다.");
			} else {
				returnCartitemJoinProduct.add(cp);
			}
		}
		
		return returnCartitemJoinProduct;
	}
	
	public int selectCount(String mid) {
		return cartitemDao.selectCount(mid);
    }

}
