package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Coupon;
import com.mycompany.webapp.exception.NotAuthenticatedUserException;
import com.mycompany.webapp.service.CouponService;
import com.mycompany.webapp.service.EventService;

@Controller
@RequestMapping("/event2")
public class EventController2 {
	private static final Logger logger = LoggerFactory.getLogger(EventController2.class);
	// ExecutorService 객체 생성
	private ExecutorService executorService = Executors.newFixedThreadPool(1);

	@Resource
	private EventService eventService;
	@Resource
	private CouponService couponService;

	@RequestMapping("/page")
	public String content(Principal principal) {
		if (principal == null) {
			throw new NotAuthenticatedUserException();
		}
		logger.info("Run /eventpage2");
		return "event/eventpage2";
	}

	@RequestMapping(value = "/join", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String joinEvent(Principal principal) throws Exception {

		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				// 시간 측정 코드(o)
				// Service 객체 호출 코드
				// 최대 3명까지 접근할수 있도록 한다.
				logger.info(eventService.selectCount("1")+"개의 쿠폰이 남아있습니다");
				if (eventService.selectCount("1") < 1) {
					logger.info("수량 초과");
					return 0;
				} else {
					logger.info("시작");
					// 현재 로그인 한 계정 아이디
					String mid = principal.getName();
					// 쿠폰 코드
					String cCode = mid + Long.toString(System.currentTimeMillis());
					// 쿠폰 이름
					String cName = "신규회원할인";
					// 쿠폰 사용여부
					char cStatus = '0';
					// 쿠폰 할인율
					int cRate = 15;
					String ccontent = "THE HANDSOME에 신규 가입하신 회원님께 드리는 혜택이며, 상품 구매 시 15% 할인이 적용됩니다.";
					String expiredate = "2021-12-31";
					String ecode = "1";
					// 이벤트 코드
					// 쿠폰 발급 일자
					String cReleaseDate = "2021-07-31";
					Coupon coupon = new Coupon(cCode, mid, cName, cRate, ccontent, cReleaseDate, expiredate, ecode,cStatus);

					if (!couponService.isDuplicated(mid)) {
						logger.info("저장 성공");
						couponService.insertCoupon(coupon);
						List<Coupon> list = couponService.selectByMid(mid);
						for (Coupon coupondata : list) {
							logger.info(coupondata.toString());
						}
						return 1;
					} else {
						// 저장 실패
						logger.info("이미 발급받은 유저입니다");
						logger.info("저장에 실패하였습니다");
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
		}else if(result==2) {
			jsonObject.put("result", "duplicated");
		}else {
			jsonObject.put("result", "outOfStock");
		}
		logger.info((end - start) + "밀리초가 소요되었습니다");
		return jsonObject.toString();
	}
}
