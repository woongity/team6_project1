package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("/shoppingbag")
	public String shoppingbag() {
		logger.info("Run order/shoppingbag");
		return "order/shoppingbag";
	}
	
	@RequestMapping("/orderPage")
	public String orderPage() {
		logger.info("Run order/orderPage");
		return "order/orderPage";
	}
	
	@RequestMapping("/orderComplete")
	public String orderComplete() {
		logger.info("Run order/orderComplete");
		return "order/orderComplete";
	}
	
	@RequestMapping("/orderHistory")
	public String orderHistory() {
		logger.info("Run order/orderHistory");
		return "order/orderHistory";
	}
	

}  
