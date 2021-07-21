package com.it.ez.message.controller;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.message.model.Auth;
import com.it.ez.message.model.AuthUser;
import com.it.ez.message.model.JSONResult;
import com.it.ez.message.model.MessageService;
import com.it.ez.message.model.MessageVo;
import com.it.ez.message.model.UserVo;


@Auth
@Controller
@RequestMapping( "/message" )
public class MessageController {
	private static final Logger logger
	=LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("")
	public String message(@AuthUser UserVo authUser, Model model) {
		MessageVo messageVo= new MessageVo();
		messageVo.setEmployeeNo(authUser.getEmployeeNo());
		List<MessageVo> list = 
				messageService.getMessage( messageVo );
		
		model.addAttribute( "list", list );
		
		
		return "message/messageList";
	}
	
	@GetMapping("/write")
	public String view(@RequestParam(value = "messageId", required = true) String messageId,
			Model model) {
		
		MessageVo messageVo = new MessageVo();
		messageVo.setMessageId(messageId);
		MessageVo resVo = messageService.getDetailMessage(messageVo);
		
		
		
		model.addAttribute("sender", resVo.getSender());
		model.addAttribute("message", resVo.getMessage());
		return "message/write";
	}
	
	
	@RequestMapping( value="/deleteMessage", method=RequestMethod.POST)
	public String deleteMessage(@ModelAttribute MessageVo messageVo) {
		int count = messageService.deleteMessage(messageVo);
		return "message/messageList";
	}
	
	
	@ResponseBody
	@RequestMapping( value="/sendMessage", method=RequestMethod.POST )
	public JSONResult sendMessage(@ModelAttribute MessageVo messageVo) {
		int count = messageService.sendMessage(messageVo);
		return JSONResult.success(count);
	}
	
	@ResponseBody
	@RequestMapping( value="/answerMessage", method=RequestMethod.POST )
	public JSONResult answerMessage(@ModelAttribute MessageVo messageVo) {
		
		int count = messageService.answerMessage(messageVo);
		
		return JSONResult.success(count);
	}
}
