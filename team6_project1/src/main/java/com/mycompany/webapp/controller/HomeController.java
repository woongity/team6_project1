package com.mycompany.webapp.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String content() {
		logger.info("Run /home");
		return "home";
	}

	@RequestMapping("/error/403")
	public String error403() {
		logger.info("실행");
		return "error/403";
	}
}
