package com.nexmore.web.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	  @RequestMapping(value = "/", method = RequestMethod.GET) public String
	  home(Locale locale, Model model) {
	  logger.info("Welcome home! The client locale is {}.", locale);
	  
	  
	  return "public:common/login.tiles"; }

	
	/*
	 * @GetMapping("/") public String index(HttpServletRequest request) {
	 * logger.debug("###INDEX PAGE###"); String rtnPage = "index"; String ipAddress
	 * = request.getHeader("X-FORWARDED-FOR"); if (ipAddress == null) { ipAddress =
	 * request.getRemoteAddr(); } logger.info(ipAddress + " : " + rtnPage); return
	 * "public:home/rtnPage.tiles"; }
	 */

}
