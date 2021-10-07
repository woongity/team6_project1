package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/mypage")
	public String orderedHistory(Model model, Principal principal) {
		// mid를 가지고 order을 가져옴. order에서 가져온 oid를 통해서 orderitem을 가져옴. orderitem들에서 pcode를 통해서 product를 가져옴. 
		// 따라서 orderitem이랑 product랑 join함. 그리고 
		// order 테이블과 product 테이블을 엮는다. pcode를 기준으로.
		//로그인이 안되어있을경우
		if(principal == null) {
			throw new NotAuthenticatedUserException();
		}
		String mid = principal.getName();
		
//		List<String> oidList = orderviewService.selectOidByMid(mid);
// 		List<OrderitemJoinProductJoinOrder> oiJoinList = new ArrayList<OrderitemJoinProductJoinOrder>();
// 		for(String oid:oidList) {
// 			List<OrderitemJoinProductJoinOrder> list  = orderviewService.selectOrderitemJoinProductJoinOrderByOid(oid);
// 			for(OrderitemJoinProductJoinOrder product:list) {
// 				logger.info(product.toString());
// 				oiJoinList.add(product);
// 			}
// 		}
		List<OrderitemJoinProductJoinOrder> list  = orderitemService.selectOrderitemJoinProductJoinOrderinfoByMid(mid);

		for(OrderitemJoinProductJoinOrder product:list) {
				// logger.info(product.toString());
				
			}
//		model.addAttribute("orderedList", oiJoinList);
 		model.addAttribute("orderedList", list);
  //		=================================================================================
//		이 후는 mypage화면에 추가로 필요한 data들
		
		Member member = memberService.selectByMid(mid);
		model.addAttribute("member", member);
		
		List<Coupon> couponlist = couponService.selectByMid(mid);
		model.addAttribute("couponlist", couponlist);
		
 		return "mypage";
	}
}