package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderitemJoinProduct;
import com.mycompany.webapp.exception.NotAuthenticatedUserException;
import com.mycompany.webapp.service.OrderViewService;

@Controller
public class OrderedHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(OrderedHistoryController.class);
	@Resource private OrderViewService orderviewService;
	
	@RequestMapping("/orderedHistory")
	public String orderedHistory(Model model,Principal principal) {
		// mid를 가지고 order을 가져옴. order에서 가져온 oid를 통해서 orderitem을 가져옴. orderitem들에서 pcode를 통해서 product를 가져옴. 
		// 따라서 orderitem이랑 product랑 join함. 그리고 
		// order 테이블과 product 테이블을 엮는다. pcode를 기준으로.
		//로그인이 안되어있을경우
		if(principal == null) {
			throw new NotAuthenticatedUserException();
		}
		String mid = principal.getName();
		
		List<String> oidList = orderviewService.selectOidByMid(mid);
 		List<OrderitemJoinProduct> oiJoinList = new ArrayList<OrderitemJoinProduct>();
 		for(String oid:oidList) {
 			List<OrderitemJoinProduct> list  = orderviewService.selectOrderitemJoinProductByOid(oid);
 			for(OrderitemJoinProduct product:list) {
 				logger.info(product.toString());
 				oiJoinList.add(product);
 			}
 		}
		model.addAttribute("orderedList", oiJoinList);
 		return "order/orderHistory";
	}
}
