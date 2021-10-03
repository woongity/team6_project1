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
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Coupon;
import com.mycompany.webapp.service.CouponReleaseRedisService;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	// ExecutorService 객체 생성
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	private static int count;

	@Resource 
	private CouponReleaseRedisService couponReleaseService;
	@RequestMapping("/eventpage")
	public String content() {
		logger.info("Run /eventpage");
		return "eventpage";
	}

	@RequestMapping(value = "/joinEvent", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String joinEvent(Principal principal) throws Exception {
		// 시간 측정 코드(x)
		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				// 시간 측정 코드(o)
				// Service 객체 호출 코드
				logger.info(Thread.currentThread().getName() + " : 이벤트 처리");
				// 최대 3명까지 접근할수 있도록 한다.
				EventController.count++;

				if (EventController.count > 3) {
					return 0;
				} else {
					// 현재 로그인 한 계정 아이디
					String mid = principal.getName();
					// 쿠폰 코드
					String cCode = mid + Long.toString(System.currentTimeMillis());
					//쿠폰 이름
					String cName = "coupon123";
					//쿠폰 사용여부
					char cStatus = '0';
					//쿠폰 할인율
					int cRate = 10;
					Coupon coupon = new Coupon(cCode,mid,cName,cRate,cStatus);
					logger.info("cName : "+cName);
					logger.info("cCode : " + cCode);
					
					// 쿠폰을 redis에 저장함. 저장할때 Service에서 사용자, 쿠폰이름으로 공통된 쿠폰이 존재하는 지 확인
					if(couponReleaseService.insertCoupon(coupon)) {
						logger.info("저장에 성공하였습니다");
						// redis에 저장함 mid - coupon code 형태로
						logger.info(couponReleaseService.getCouponCode(mid,cName));
						// 저장 성공
					}else {
						logger.info("저장에 실패하였습니다");
						// 저장 실패
					}
					return 1;
				}
			}
		};

		Future<Integer> future = executorService.submit(task);

		// 이벤트 처리가 완료될 때까지 대기
		int result = future.get();

		JSONObject jsonObject = new JSONObject();
		if (result == 1) {
			jsonObject.put("result", "success");
		} else {
			jsonObject.put("result", "fail");
		}
		return jsonObject.toString();
	}
}
