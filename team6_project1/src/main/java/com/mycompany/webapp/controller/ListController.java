package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.aspect.LoginChecking;
import com.mycompany.webapp.dto.Cartitem;
import com.mycompany.webapp.dto.ListProduct;
import com.mycompany.webapp.service.CartitemService;
import com.mycompany.webapp.service.ListviewService;

@Controller
@RequestMapping("list")
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Resource ListviewService listviewService;
	@Resource CartitemService cartService;
	
	@RequestMapping("/view")
	public String content(Model model) {
		logger.info("시작");
		HashMap<String,ListProduct> hashmap = listviewService.selectAll();
		List<ListProduct> list = new ArrayList<ListProduct>();
		for(String key:hashmap.keySet()) {
			// logger.info(hashmap.get(key).toString());
			list.add(hashmap.get(key));
		}
		model.addAttribute("productArray",list);
		return "home";
	}
	
	@LoginChecking
	@PostMapping("/put")
	public String putIntoCart(String pcode, String color, String size, int quantity,int price) {
		logger.info("실행");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		logger.info(mid);
		Cartitem cartitemDto = new Cartitem(mid, pcode, color, size, quantity);
		Cartitem dbCartitem = cartService.selectItem(cartitemDto);
		// 카드에 동일한 코드를 가진 제품이 있다면 
		int maxQuantity = listviewService.selectPquantity(pcode, color, size);
		if(dbCartitem!=null) {
			cartitemDto.setPquantity(quantity+dbCartitem.getPquantity());
			if(cartitemDto.getPquantity()>maxQuantity) {
				return "redirect:/list/view";
			}
			cartService.updateItem(cartitemDto);
		}else {
			if(cartitemDto.getPquantity()>maxQuantity) {
				cartitemDto.setPquantity(maxQuantity);
			}
			cartService.insertItem(cartitemDto);
		}
		return "redirect:/list/view";
	}
	
	/*
	 * @PostMapping(value = "/isPuttable", produces =
	 * "application/json; charset=UTF-8")
	 * 
	 * @ResponseBody public String isPuttable(String pcode, String pColor, String
	 * pSize,int quantity) { logger.info("isputable"); JSONObject jsonObject = new
	 * JSONObject(); int pstock = listviewService.selectPquantity(pcode, pColor,
	 * pSize); if (pstock < quantity) { jsonObject.put("result", "fail"); } else {
	 * jsonObject.put("result", "success"); } String json = jsonObject.toString();
	 * return json; }
	 */
}