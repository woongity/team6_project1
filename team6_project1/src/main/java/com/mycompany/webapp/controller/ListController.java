package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.CartbagDto;
import com.mycompany.webapp.dto.OrderDto;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.CartbagService;
import com.mycompany.webapp.service.ListviewService;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Resource ListviewService listviewService;
	@Resource CartbagService cartService;
	@RequestMapping("/listView")
	public String content(Model model) {
		logger.info("시작");
		List<Product> list = listviewService.selectAll();
		for(Product product:list) {
			logger.info(product.toString());
		}
		model.addAttribute("productJsonArray",list);
		return "listView";
	}
	
	@PostMapping("/put")
	public String putIntoCart(String pid, String color, String size, int quantity,int price) {
		CartbagDto cartbagDto = new CartbagDto();
		// 유저가 한명임으로 mid = 1이라고 넣는다.
		cartbagDto.setMid("1");
		cartbagDto.setPid(pid);
		cartbagDto.setPquantity(quantity);
		cartService.insertItem(cartbagDto);
		return "redirect:/listView";
	}
}