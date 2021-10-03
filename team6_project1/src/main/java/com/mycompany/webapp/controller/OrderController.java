package com.mycompany.webapp.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderViewInfo;
import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.service.CartitemService;
import com.mycompany.webapp.service.MemberService;
import com.mycompany.webapp.service.OrderService;
import com.mycompany.webapp.service.OrderitemService;
import com.mycompany.webapp.service.ProductService;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private MemberService memberService;
	@Resource 
	private OrderService orderService;
	@Resource
	private OrderitemService orderitemService;
	@Resource 
	private CartitemService cartitemService;
	@Resource
	private ProductService productService;
	
	@RequestMapping("/shoppingbag") //은솔이랑 합치면 지울 것
	public String shoppingbag() {
		logger.info("Run order/shoppingbag");
		return "order/shoppingbag";
	}
	
	@PostMapping("/orderInfo")
	@ResponseBody
	public String orderPage(Model model, String orderProduct, HttpServletResponse response) throws Exception {
		logger.info("Run order/orderPage");
		
		//주문 상품이 없는 상태로 결제하기를 누를 경우 예외처리
		if(orderProduct == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('주문 상품을 선택해주세요.'); history.go(-1);</script>");
            out.flush();
		}
		logger.info(orderProduct);
		
		//장바구니에서 선택한 상품 데이터를 상품 주문 페이지로 전달
		model.addAttribute("orderProducts", orderProduct);
		logger.info("1");
		
		//최종 결제 금액 및 수량
		int totalQuantity = 0;
		int totalPrice = 0;
		logger.info("2");
		
		//JSON 파싱 과정
		JSONArray jsonArray = new JSONArray(orderProduct);
		logger.info("3");
		
		for(int i=0; i<jsonArray.length(); i++) {
			JSONObject obj = jsonArray.getJSONObject(i);
			totalQuantity += obj.getInt("pquantity");
			totalPrice += obj.getInt("pprice");
		}

		model.addAttribute("totalQuantity", totalQuantity);
		model.addAttribute("totalPrice", totalPrice);
		
		//주문자 정보(Member Table)에서 가져와서 주문자 정보와 배송지 정보로 전달
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
		//1. 주문자 정보 : mname, mtel, memail
		List<Member> orderMember = memberService.selectByMid(mid);
		model.addAttribute("orderMember", orderMember);
		
		//2. 배송지 정보 : maddress, mname, mtel
		List<Member> deliveryMember = memberService.selectByMid(mid);
		model.addAttribute("deliveryMember", deliveryMember);
		
		return "order/orderPage";
	}
	
	@GetMapping("/orderPage")
	public String orderPage() {
		return "order/orderPage";
	}
	
	@RequestMapping(value="/orderComplete", method= {RequestMethod.POST})
	@ResponseBody
	public String orderComplete(OrderViewInfo orderViewInfo, String orderProduct) {
		logger.info("Run order/orderComplete");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		long oidTime = System.currentTimeMillis();
		String oid = mid + oidTime;
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		Date date = new Date();
		date.setTime(oidTime);
		String otime = simpleDateFormat.format(date);
				
		//사용자가 작성한 주문 데이터(Order Table)를 DB에 저장
		Order dbOrder = new Order(oid, mid, otime, orderViewInfo.getOname(), orderViewInfo.getOtel(), orderViewInfo.getOaddress(), orderViewInfo.getOcomment(), orderViewInfo.getOpaymentmethod(), '1');
		orderService.insertOrder(dbOrder);
		
		//주문상품 데이터(Orderitem Table)를 DB에 저장
		JSONArray jsonArray = new JSONArray(orderProduct);

		for(int i=0; i<jsonArray.length(); i++) {
			JSONObject obj = jsonArray.getJSONObject(i);
			Orderitem orderitem = new Orderitem(oid, obj.getString("pcode"), obj.getString("pcolor"), obj.getString("psize"), obj.getInt("pquantity"));
			orderitemService.insertOrderitem(orderitem);
			
			//주문 완료 상품의 상품(Product) 재고 수정
			int pstock = productService.selectPquantity(obj.getString("pcode"), obj.getString("pcolor"), obj.getString("psize"));
			int pquantity = pstock - obj.getInt("pquantity");
			productService.updatePstock(obj.getString("pcode"), obj.getString("pcolor"), obj.getString("psize"), pquantity);

			//주문 완료 상품의 장바구니(Cartitem) 데이터 삭제
			cartitemService.deleteCartitem(mid, obj.getString("pcode"), obj.getString("pcolor"), obj.getString("psize"));
		}
		
		return "order/orderComplete";
	}
	
	@RequestMapping("/orderHistory")
	public String orderHistory() {
		logger.info("Run order/orderHistory");
		return "order/orderHistory";
	}
	

}  
