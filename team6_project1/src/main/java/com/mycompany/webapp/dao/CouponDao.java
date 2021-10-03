package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Coupon;

public interface CouponDao {
	List<Coupon> selectByMid(String mid);
}
