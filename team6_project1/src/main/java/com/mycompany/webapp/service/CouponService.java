package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CouponDao;
import com.mycompany.webapp.dto.Coupon;

@Service
public class CouponService {
	@Resource
	private CouponDao couponDao;
	
	public List<Coupon> selectByMid(String mid) {
		return couponDao.selectByMid(mid);
	}
}
