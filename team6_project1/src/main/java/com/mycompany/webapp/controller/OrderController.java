package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.dto.OrderitemJoinProduct;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.ListviewService;
import com.mycompany.webapp.service.OrderViewService;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	OrderViewService orderService;
	@Resource
	ListviewService productService;
	
	@RequestMapping("/shoppingbag")
	public String shoppingbag(Model model) {
		
		return "order/shoppingbag";
	}
	
	@RequestMapping("/orderPage")
	public String orderPage() {
		logger.info("Run order/orderPage");
		return "order/orderPage";
	}
	
	//기존 ordercomplete
	@GetMapping("/info")
	public String info(String oid,Principal principal, Model model) {
		logger.info("Run order/info");
		
		List<Orderitem> orders = orderService.selectByOid(oid);
		Order order = orderService.selectOneByOid(oid);
		
		ArrayList<OrderitemJoinProduct> ordereditems = new ArrayList<OrderitemJoinProduct>();
		int totalprice = 0;		//총 주문 비용
		int totalnumber = 0;	//총 주문 삼품 갯수
		
		for(Orderitem orderitem : orders) {
			Product product = productService.selectOne(orderitem.getPcode(), orderitem.getPcolor(),orderitem.getPsize());
			ordereditems.add(new OrderitemJoinProduct(product.getPname(),orderitem.getPquantity(),product.getPimage1(),
													  product.getPbrand(),orderitem.getPcolor(),orderitem.getPsize(),
													  orderitem.getPcode(),orderitem.getOid(),product.getPprice()));
			totalnumber += orderitem.getPquantity();
			totalprice += product.getPprice() * orderitem.getPquantity();
		}
		
		model.addAttribute("order", order);
		model.addAttribute("ordereditems", ordereditems);
		model.addAttribute("totalnumber", totalnumber);
		model.addAttribute("totalprice", totalprice);
		
		return "order/orderComplete";
//		return "order/info";
	}
	
	@PostMapping("delete")
	public String delete(String oid) {
		logger.info("Run order/delete");
		Order order = orderService.selectOneByOid(oid);
		order.setOstatus('0');
		orderService.update(order);
		return "home.jsp";
	}
	
	@RequestMapping("/orderHistory")
	public String orderHistory() {
		logger.info("Run order/orderHistory");
		return "order/orderHistory";
	}
	

}  