package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.lang.Nullable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.aspect.LoginChecking;
import com.mycompany.webapp.aspect.LoginChecking401;
import com.mycompany.webapp.dto.Coupon;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.OrderitemJoinProductJoinOrder;
import com.mycompany.webapp.exception.NotAuthenticatedUserException;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderitemService;

@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Resource private OrderitemService orderitemService;
	@Resource private MemberService memberService;
	@Resource private CouponService couponService;
	
	@LoginChecking
	@RequestMapping("/mypage")
	public String orderedHistory(Model model, Principal principal,@RequestParam @Nullable String fromtime,@RequestParam @Nullable String totime) {
		// mid를 가지고 order을 가져옴. order에서 가져온 oid를 통해서 orderitem을 가져옴. orderitem들에서 pcode를 통해서 product를 가져옴. 
		// 따라서 orderitem이랑 product랑 join함. 그리고 
		// order 테이블과 product 테이블을 엮는다. pcode를 기준으로.
		String mid = principal.getName();
		logger.warn(fromtime + " "+ totime);
		List<OrderitemJoinProductJoinOrder> list;
		if(fromtime==null || totime==null) {
			list = orderitemService.selectOrderitemJoinProductJoinOrderinfoByMid(mid);	
		}
		else {
			list = orderitemService.selectOrderitemJoinProductJoinOrderinfoByMidDate(mid, fromtime, totime);
		}
		
 		model.addAttribute("orderedList", list);
//		=================================================================================
//		이 후는 mypage화면에 추가로 필요한 data들
		
		Member member = memberService.selectByMid(mid);
		model.addAttribute("member", member);
		model.addAttribute("fromtime",fromtime);
		model.addAttribute("totime",totime);
		
		List<Coupon> couponlist = couponService.selectByMid(mid);
		model.addAttribute("couponlist", couponlist);
		
 		return "mypage";
	}
	
	@LoginChecking401
	@RequestMapping("/couponCount")
	@ResponseBody
	public String count() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		int couponCount = couponService.selectCouponCount(mid);
		return String.valueOf(couponCount);
	}
}