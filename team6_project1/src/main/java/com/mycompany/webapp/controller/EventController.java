package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Coupon;
import com.mycompany.webapp.exception.NotAuthenticatedUserException;
import com.mycompany.webapp.service.CouponReleaseRedisService;
import com.mycompany.webapp.service.CouponService;

@Controller
@RequestMapping("/event1")
public class EventController {

	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	// ExecutorService 객체 생성
	private ExecutorService executorService = Executors.newFixedThreadPool(1);

	@Resource
	private ApplicationEventPublisher applicationEventPublisher;

	@Resource
	private CouponService couponService;
	
	@Resource
	private CouponReleaseRedisService redisCouponReleaseService;

	@RequestMapping("/page")
	public String content(Principal principal) {
		if (principal == null) {
			throw new NotAuthenticatedUserException();
		}
		
		logger.info("Run /eventpage1");
		return "event/eventpage1";
	}

	@RequestMapping(value = "/join", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String joinEvent(Principal principal) throws Exception {

		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				logger.info(Thread.currentThread().getName() + " : 이벤트 처리");

				// 발급 가능 쿠폰 수량 초과
				if (redisCouponReleaseService.getLeftCouponCount() < 1) {
					return 0;
				} else {
					// 현재 로그인 한 계정 아이디
					
					String mid = principal.getName();
					// 쿠폰 코드
					String cCode = mid + Long.toString(System.currentTimeMillis());
					// 쿠폰 이름
					String cName = "coupon123";
					// 쿠폰 사용여부
					char cStatus = '0';
					// 쿠폰 할인율
					int cRate = 10;
					String ccontent = "known coupon";
					String expiredate = "2020-09-21";
					String ecode = "1";
					// 이벤트 코드
					// 쿠폰 발급 일자
					String cReleaseDate = "2020/08/02";
					Coupon coupon = new Coupon(cCode, mid, cName, cRate, ccontent, cReleaseDate, expiredate, ecode, cStatus);

					// 같은 mid와 같은 이벤트 이름 발급된 으로 중복된 쿠폰이 없다면
					if (!redisCouponReleaseService.isDuplicated(mid,ecode)) {
						// 유저id, 이벤트 코드로 쿠폰 저장 
						redisCouponReleaseService.inputCoupon(mid, ecode);
						// oracle DB 영속화 
						couponService.insertCoupon(coupon);
						logger.info("저장에 성공하였습니다");
//						logger.info(redisCouponReleaseService.getCoupon(mid).toString());
						return 1;
					} else {
						// 저장 실패
						logger.info("이미 발급받은 유저입니다");
						return 2;
					}
				}
			}
		};

		// 시간 체크용 코드
		long start = System.currentTimeMillis();
		Future<Integer> future = executorService.submit(task);
		// 이벤트 처리가 완료될 때까지 대기

		// 쿠폰을 redis에 저장함. 저장할때 Service에서 mid를 키로 가지는 값이 있는지 확인
		int result = future.get();
		// 시간 체크용 코드
		long end = System.currentTimeMillis();

		JSONObject jsonObject = new JSONObject();
		if (result == 1) {
			jsonObject.put("result", "success");
		} else if (result == 2) {
			jsonObject.put("result", "duplicated");
		} else {
			jsonObject.put("result", "outOfStock");
		}
		logger.info((end - start) + "밀리초가 소요되었습니다");
		return jsonObject.toString();
	}
}
