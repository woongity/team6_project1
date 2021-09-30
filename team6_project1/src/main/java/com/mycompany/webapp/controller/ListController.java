package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Cartitem;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.CartitemService;
import com.mycompany.webapp.service.ListviewService;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Resource ListviewService listviewService;
	@Resource CartitemService cartService;
	
	@RequestMapping("/listView")
	public String content(Model model) {
		logger.info("시작");
		List<Product> list = listviewService.selectAll();
		for(Product product:list) {
			logger.info(product.toString());
		}
		model.addAttribute("producArray",list);
		return "/home";
	}
	
	@PostMapping("/put")
	public String putIntoCart(String pcode, String color, String size, int quantity,int price) {
		logger.info("실행");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		Cartitem cartbagDto = new Cartitem(mid, pcode, color, size, quantity);
		cartService.insertItem(cartbagDto);
		return "redirect:/listView";
	}
}