package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartbagDao;
import com.mycompany.webapp.dto.CartbagDto;

@Service
public class CartbagService {
	private static final Logger logger = LoggerFactory.getLogger(CartbagService.class);
	
	@Resource
	private CartbagDao cartbagdao;
	
	public List<CartbagDto> selectByMid(String mid){
		return cartbagdao.selectByMid(mid);
	}
	public void deleteByMidnPid(String pid) {
		cartbagdao.deleteByMidnPid(pid);
	}
	public void update(CartbagDto cartbag) {
		cartbagdao.update(cartbag);
	}
	public void insertItem(CartbagDto cartbag) {
		logger.info("실행");
		cartbagdao.insertItem(cartbag);
	}
}
