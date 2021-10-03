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
import org.springframework.web.bind.annotation.ResponseBody;

//import com.mycompany.webapp.dto.CartbagDto;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.ListviewService;

@Controller
public class ListController {
	private static final Logger logger = LoggerFactory.getLogger(ListController.class);
	
	@Resource ListviewService listviewService;
	@Resource CartService cartService;
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

	@RequestMapping(value="/modalJson")
	@ResponseBody
	public String getSameProducts(String pname) {
		List<Product> list = listviewService.selectByPname(pname);
		JSONArray jsonArray = new JSONArray();
		for(Product product:list) {
			// product의 pid, pname, pstock, pcolor, psize
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("pname", product.getPstock());
			jsonObject.put("pstock", product.getPcolor());
			jsonObject.put("pid", product.getPsize());
			
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
	@PostMapping("/put")
	public String putIntoCart(String pid, String color, String size, int quantity,int price) {
		
		return "redirect:/listView";
	}
}