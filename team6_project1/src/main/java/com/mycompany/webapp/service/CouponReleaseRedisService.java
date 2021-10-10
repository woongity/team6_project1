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
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dto.Coupon;

@Service
public class CouponReleaseRedisService {
	private static final Logger logger = LoggerFactory.getLogger(CouponReleaseRedisService.class);
	@Autowired
	RedisTemplate<String, Object> redisTemplate;

	@Resource(name = "redisTemplate")
	private ValueOperations<String, Object> valueOps;

	@Resource(name = "redisTemplate")
	private SetOperations<String, String> setOps;

	@Resource(name = "redisTemplate")
	private ListOperations<String, Object> listOps;

	@Resource(name = "redisTemplate")
	private ZSetOperations<String, String> zSetOps;

	@Resource(name = "redisTemplate")
	private HashOperations<String, String, String> hashOps;

	
	
//	public boolean insertCoupon(Coupon coupon) {
//		String mid = coupon.getMid();
//		
//			valueOps.set(mid, coupon);
//			return true;
//		} else {
//			return false;
//		}
//	}
	// 중복된 데이터가 있다면 false
	// 중복된 데이터가 있다면 true
	public boolean isDuplicated(String mid,String ecode) {
		if (redisTemplate.hasKey(mid)) {
			if(valueOps.get(mid).equals(ecode)) {
				return true;
			}
			else return false;
		}else return false;
	}
	@Transactional
	public void inputCoupon(String mid, String ecode) {
		valueOps.set(mid, ecode);
		decrementCouponCount();
	}
	public int getLeftCouponCount() {
		return (int) valueOps.get("leftCouponCount");
	}

	public Coupon getCoupon(String mid) {
		return (Coupon) valueOps.get(mid);
	}

	public void setCouponCount(int quantity) {
		valueOps.set("leftCouponCount", quantity);
	}

	public void decrementCouponCount() {
		valueOps.decrement("leftCouponCount");
	}

	public void incrementCouponCount() {
		valueOps.increment("leftCouponCount");
	}
}
