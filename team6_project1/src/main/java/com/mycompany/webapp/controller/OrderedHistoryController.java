package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.OrderProductJoinDto;
import com.mycompany.webapp.service.OrderViewService;

@Controller
public class OrderedHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(OrderedHistoryController.class);
	@Resource private OrderViewService orderviewService;
	@RequestMapping("/orderedHistory")
	public String orderedHistory(Model model) {
		// TODO : login 정보를 session에 저장을 하는것도 괜찮지 않을까?
		String mid = "1";
		List<OrderProductJoinDto> list = orderviewService.selectOrderJoinProductByMid(mid);
		for(OrderProductJoinDto dto:list) {
			logger.info(dto.toString());
		}
		model.addAttribute("orderedHistory", list);
		return "order/orderHistory";
	}
}
