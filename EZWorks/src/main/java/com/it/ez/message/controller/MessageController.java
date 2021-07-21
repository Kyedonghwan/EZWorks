package com.it.ez.message.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.ez.message.model.MessageService;
import com.it.ez.message.model.MessageVO;
import com.it.herb.guestbook.model.GuestbookVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	private final MessageService messageService;
	
	@GetMapping("/write")
	public String write() {
		//1
		logger.info("write 화면 보여주기");

		//2
		//3
		return "guestbook/write";
	}
	
	@PostMapping("/messagewrite")
	public String write_post(@ModelAttribute MessageVO vo, Model model) {
		//1
		logger.info("쪽지 등록 처리, 파라미터 vo={}",vo);
		
		//2
		String msg="쪽지 등록 실패",url="/guestbook/write";
		int cnt = messageService.insertMessage(vo);
		logger.info("write 등록 결과, cnt={}",cnt);
		if(cnt>0) {
			msg="글이 등록되었습니다.";
			url="/guestbook/list";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@GetMapping("/messagelist")
	public String list(Model model) {
		//1
		logger.info("list 화면 보여주기");
		
		//2
		List<MessageVO> list = messageService.selectAll();
		logger.info("list 화면 결과, list.size={}",list.size());
		
		//3
		model.addAttribute("list", list);
		
		return "guestbook/list";
	}

}