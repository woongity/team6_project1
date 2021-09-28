package com.mycompany.webapp.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.CartbagDto;
import com.mycompany.webapp.dto.OrderDto;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.CartbagService;
import com.mycompany.webapp.service.ListviewService;
import com.mycompany.webapp.service.OrderViewService;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	@Resource ListviewService listviewService;
	@Resource OrderViewService orderViewService;
	@Resource CartbagService cartService;
	@RequestMapping("/listView")
	public String content() {
		return "";
	}
	@PostMapping("/put")
	public String putIntoCart(String pid, String color, String size, int quantity,int price) {
		CartbagDto cartbagDto = new CartbagDto();
		
		OrderDto orderDto = new OrderDto(10,"1",pid,quantity,100,'1');
		
		// 유저가 한명임으로 mid = 1이라고 넣는다.
		cartbagDto.setMid("1");
		cartbagDto.setPid("100");
		cartbagDto.setPquantity(quantity);
		Product product = new Product();
		orderViewService.insertOrder(orderDto);
//		
		
		return "redirect:/listView";
	}
}