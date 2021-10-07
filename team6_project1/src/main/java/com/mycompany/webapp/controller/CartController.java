package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.aspect.LoginChecking;
import com.mycompany.webapp.aspect.LoginChecking401;
import com.mycompany.webapp.dto.Cartitem;
import com.mycompany.webapp.dto.CartitemJoinAllProduct;
import com.mycompany.webapp.dto.ListProduct;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.service.CartitemService;
import com.mycompany.webapp.service.ListviewService;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Resource
	CartitemService cartService;
	@Resource
	ListviewService productService;
	
	@LoginChecking
	@GetMapping("/list")
	public String list(Principal principal, Model model) {
		logger.info("Run cart/list");
		
		List<Cartitem> cartitems = cartService.selectAllByMid(principal.getName());
		
		List<CartitemJoinAllProduct> items = new ArrayList<CartitemJoinAllProduct>();
		
		HashMap<String,ListProduct> productMap = new HashMap<>();
		
		for(Cartitem citem : cartitems) {
			
//			============== 카트에 띄우기 위해 필요한 정보(CartitemJoinProduct Dto 참고
			
			Product product = productService.selectOne(citem.getPcode(), citem.getPcolor(), citem.getPsize());
			items.add(new CartitemJoinAllProduct(citem.getMid(),citem.getPcode(),citem.getPcolor(),citem.getPsize(),
											  citem.getPquantity(), product.getPname(), product.getPimage1(), product.getPimage2(), product.getPimage3(),product.getPcolorimage(),
											  product.getPprice(), product.getPbrand(), product.getPstock()));
			
//			============== 카트에 담겨있는 상품의 코드를 기준으로 코드가 같은 상품을 전부 담은 상품 리스트
			
			List<Product> pcode_product = productService.selectByPcode(citem.getPcode());
			ListProduct listProduct;
			for(Product p : pcode_product) {
				if(!productMap.containsKey(p.getPcode())) {
					listProduct = new ListProduct(new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new TreeSet<>(),new HashMap<String,Integer>());
					listProduct.setPcode(p.getPcode());
					listProduct.setPname(p.getPname());
					listProduct.setPprice(p.getPprice());
					listProduct.setPbrand(p.getPbrand());
				}
				else {
					listProduct = productMap.get(p.getPcode());
				}
				listProduct.getPcolorTreeSet().add(p.getPcolor());
				listProduct.getPsizeTreeSet().add(p.getPsize());
				listProduct.getPimage1TreeSet().add(p.getPimage1());
				listProduct.getPimage2TreeSet().add(p.getPimage2());
				listProduct.getPimage3TreeSet().add(p.getPimage3());
				listProduct.getPcolorimageTreeSet().add(p.getPcolorimage());
				listProduct.getPstock().put(p.getPcolor()+p.getPsize(), p.getPstock());
				
				productMap.put(p.getPcode(), listProduct);
			}
		}
		
		model.addAttribute("cartitems",items);
		model.addAttribute("productMap",productMap);	//<pcode,ListProduct> 형태의 hashmap
		
		return "order/shoppingbag";
	}
	
	@LoginChecking401
	@RequestMapping("/option")
	public String option(String pcode,String origin_pcolor,String origin_psize, String new_pcolor, String new_psize, String new_pquantity) {
		logger.info("Run cart/option");
		//기존 카트 아이템 코드, 컬러, 사이즈를 받고 기존 카트 아이템 삭제, 
		//새로운 카트 아이템 insert
		//에서 기존 상품 update로 변경
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
//		cartService.deleteItem(mid, pcode, origin_pcolor, origin_psize);
//		cartService.insertItem(new Cartitem(mid,pcode,new_pcolor,new_psize,Integer.parseInt(new_pquantity)));
		cartService.updateOption(mid,pcode, origin_pcolor, origin_psize, new_pcolor, new_psize, new_pquantity);
		
		return "redirect:/cart/list";
	}
	
	@LoginChecking401
	@RequestMapping("/deleteitem")
	public String deleteitem(String pcode,String pcolor, String psize) {
		logger.info("Run cart/delete");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		
		cartService.deleteItem(mid, pcode, pcolor, psize);
		
		return "redirect:/cart/list";
	}
	
	@LoginChecking401
	@RequestMapping("/count")
	@ResponseBody
	public String count() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String mid = authentication.getName();
		int itemCount = cartService.selectCount(mid);
		return String.valueOf(itemCount);
	}
}