package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.dto.Coupon;

@Service
public class CouponReleaseRedisService {
	private static final Logger logger = LoggerFactory.getLogger(CouponReleaseRedisService.class);
	@Autowired
	RedisTemplate<String, Object> redisTemplate;

	@Resource(name="redisTemplate")
	private ValueOperations<String, Object> valueOps;

	@Resource(name="redisTemplate")
	private SetOperations<String, String> setOps;

	@Resource(name="redisTemplate")
	private ListOperations<String, Object> listOps;

	@Resource(name="redisTemplate")
	private ZSetOperations<String, String> zSetOps;

	@Resource(name="redisTemplate")
	private HashOperations<String, String, String> hashOps;
	
	
	// 저장 성공시 return true
	// 저장 실패시 return false
	public boolean insertCoupon(Coupon coupon) {
		String cName = coupon.getCcode();
		String mid = coupon.getMid();
		String cCode = coupon.getCcode();
		if(hashOps.get(mid,cName)==null) {
			hashOps.put(mid, cName, cCode);
			return true;
		}else {
			return false;
		}
	}
	public String getCouponCode(String mid, String cName) {
		return hashOps.get(mid, cName);
	}
}
