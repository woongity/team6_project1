package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.aspect.LoginChecking;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("/")
	public String main() {
		logger.info("Run /main");
		return "main";
	}

	@LoginChecking
    @RequestMapping("/getname")
    @ResponseBody
    public String getname() {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String mid = authentication.getName();
       return mid;
    }
}
