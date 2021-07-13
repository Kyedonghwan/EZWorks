package com.it.ez.calendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalController {
	private static final Logger logger = LoggerFactory.getLogger(CalController.class);
	
	
	@RequestMapping("/calendar/test")
	public void Calendar() {
		logger.info("캘린더 화면 보여주기");
	}
}
