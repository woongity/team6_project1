package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@RequestMapping("/eventpage")
	public String content() {
		logger.info("Run /eventpage");
		return "eventpage";
	}


}
