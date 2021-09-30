package com.mycompany.webapp.controller;

import java.util.concurrent.Callable;
import java.util.concurrent.Future;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	// ExecutorService 객체 생성
	private ExecutorService executorService = Executors.newFixedThreadPool(1);
	private static int count;
	@RequestMapping("/eventpage")
	public String content() {
		logger.info("Run /eventpage");
		return "eventpage";
	}

	@RequestMapping(value = "/joinEvent", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String joinEvent() throws Exception{
		// 시간 측정 코드(x)
		Callable<Integer> task = new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				// 시간 측정 코드(o)
				// Service 객체 호출 코드
				logger.info(Thread.currentThread().getName() + ": 이벤트 처리");
				// 최대 3명까지 접근할수 있도록 한다.
				EventController.count++;
				if (EventController.count > 3) {
					return 0;
				} else {
					return 1;
				}
			}
		};

		Future<Integer> future = executorService.submit(task);
		logger.info(Thread.currentThread().getName() + ": 큐에 작업을 저장");
		
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
