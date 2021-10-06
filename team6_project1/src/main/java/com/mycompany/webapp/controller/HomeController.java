package com.mycompany.webapp.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String main() {
		logger.info("Run /main");
		return "main";
	}

	@RequestMapping("/error/403")
	public String error403() {
		logger.info("error/403");
		return "error/403";
	}

	@RequestMapping("/error/500")
	public String error500() {
		logger.info("error/500");
		return "error/500";
	}
	
	   @RequestMapping("/getname")
	   @ResponseBody
	   public String count() {
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      String mid = authentication.getName();
	      return mid;
	   }
}
