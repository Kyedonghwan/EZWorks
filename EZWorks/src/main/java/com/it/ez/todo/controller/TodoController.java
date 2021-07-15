package com.it.ez.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TodoController {
	private static final Logger logger
	=LoggerFactory.getLogger(TodoController.class);
	
	@RequestMapping("/todo/testtodo")
	public void todo() {
		logger.info("todo페이지다 진짜");
	}
}
