package com.it.ez.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.ez.community.model.CommunityService;
import com.it.ez.community.model.CommunityVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger 
		= LoggerFactory.getLogger(CommunityController.class);
	
	private final CommunityService communityService;
	
	@GetMapping("/communityMain")
	public void community() {
		logger.info("커뮤니티 메인 페이지");
	}
	
	@GetMapping("/communityNew")
	public void newCommunity() {
		logger.info("커뮤니티 개설 페이지");
	}
	
	@PostMapping("/communityNew")
	public String newCommunity_post(@ModelAttribute CommunityVO vo, Model model) {
		logger.info("커뮤니티 개설 처리, 파라미터 communityVo={}", vo);
		
		int cnt = communityService.insertCommunity(vo);
		logger.info("커뮤니티 개설 처리결과, cnt={}", cnt);
		
		String msg="커뮤니티 개설 실패!", url="/community/communityNew";
		if(cnt>0) {
			msg="커뮤니티가 개설되었습니다.";
			url="/community/communityMain";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
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
