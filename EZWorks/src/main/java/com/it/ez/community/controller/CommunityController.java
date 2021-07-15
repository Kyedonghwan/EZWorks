package com.it.ez.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger 
		= LoggerFactory.getLogger(CommunityController.class);
	
	@GetMapping("/communityMain")
	public void community() {
		logger.info("커뮤니티 메인 페이지");
	}
	
	@GetMapping("/communityOne")
	public void selectCommunity() {
		logger.info("커뮤니티 개별 페이지");
	}
	
	@RequestMapping("/communityWrite")
	public String writeCommunity() {
		logger.info("커뮤니티 글쓰기 페이지");
		
		return "community/communityWrite";
		
	}
	
	
}