package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallback;

import com.mycompany.webapp.controller.EventController;
import com.mycompany.webapp.dao.CouponDao;
import com.mycompany.webapp.dao.EventDao;
import com.mycompany.webapp.dto.Coupon;

@Service
public class CouponService {	
	private static final Logger logger = LoggerFactory.getLogger(CouponService.class);

	@Resource
	private CouponDao couponDao;
	@Resource 
	private EventDao eventDao;
	
	public List<Coupon> selectByMid(String mid) {
		return couponDao.selectByMid(mid);
	}

	@Transactional
	public boolean insertCoupon(Coupon coupon) {
		
		String mid = coupon.getMid();
		logger.info("insert coupon 쿠폰");
		try {
			int leftStock = eventDao.selectCount("1");
			eventDao.decrementCount();
			couponDao.insertCoupon(coupon);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean isDuplicated(String mid) {
		if (!couponDao.selectByMid(mid).isEmpty()) {
			// 쿠폰 중복 발급을 확인하는 코드
			return true;
		} else {
			return false;
		}
	}
	
	public int selectCouponCount(String mid) {
		return couponDao.selectCouponCount(mid);
	}
}
