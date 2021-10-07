package com.mycompany.webapp.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.CartitemDao;
import com.mycompany.webapp.dao.OrderDao;
import com.mycompany.webapp.dao.OrderitemDao;
import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Orderitem;
import com.mycompany.webapp.exception.OutOfStockExceptionHandler;



@Service
public class OrderService {
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);	
	
	@Resource 
	private OrderDao orderDao;
	@Resource
	private OrderitemDao orderitemDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private CartitemDao cartitemDao;

	@Transactional
	public void insertOrder(String mid, Order order, ArrayList<String> pcode, ArrayList<String> pcolor, ArrayList<String> psize, ArrayList<Integer> oquantity) {

		//주문내역 DB에 저장
		orderDao.insertOrder(order);
		
		for(int i=0; i<pcode.size(); i++) {
			int pstock = productDao.selectPquantity(pcode.get(i), pcolor.get(i), psize.get(i));
			if(oquantity.get(i) > pstock) {
				throw new OutOfStockExceptionHandler("주문하신 제품의 재고가 부족합니다.");
			} else {
				//주문 상품 데이터(Orderitem) DB에 저장
				Orderitem orderitem = new Orderitem(order.getOid(), pcode.get(i), pcolor.get(i), psize.get(i), oquantity.get(i));
				orderitemDao.insertOrderitem(orderitem);
				
				//Product 테이블의 재고 수정
				productDao.updatePstock(pcode.get(i), pcolor.get(i), psize.get(i), (-1)*oquantity.get(i));
				
				//주문 상품 카트에서 삭제
				cartitemDao.deleteItem(mid, pcode.get(i), pcolor.get(i), psize.get(i));
			}
		}
			
	}
	
	public List<Order> selectByMid(String mid){
		return orderDao.selectByMid(mid);
	}
	public List<String> selectOidByMid(String mid){
		return orderDao.selectOidByMid(mid);
	}
	
	public List<Orderitem> selectByOid(String oid){
		return orderDao.selectByOid(oid);
	}
	
	public Order selectOneByOid(String oid){
		return orderDao.selectOneByOid(oid);
	}
	
	public void update(String oid) {
		orderDao.update(oid);
	}
}
