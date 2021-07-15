package com.it.ez.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@RequestMapping("/index")
	public void showboard() {
		
	}
}