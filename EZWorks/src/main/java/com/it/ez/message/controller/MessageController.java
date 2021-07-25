package com.it.ez.message.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.ez.message.common.ConstUtil;
import com.it.ez.message.common.PaginationInfo;
import com.it.ez.message.common.SearchVo;
import com.it.ez.message.model.MessageReceiveVO;
import com.it.ez.message.model.MessageSendListVO;
import com.it.ez.message.model.MessageSendVO;
import com.it.ez.message.model.MessageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/message")
@RequiredArgsConstructor
public class MessageController {
	private static final Logger logger=LoggerFactory.getLogger(MessageController.class);
	
	private final MessageService messageService;
	
	
	@GetMapping("/messageWrite")
	public void write() {
		logger.info("쪽지 보내기");
	}
	
	@PostMapping("/messageWrite")
	public String write_post(@ModelAttribute MessageSendVO vo,HttpSession session, Model model) {
		int userNo=(int) session.getAttribute("userNo");
		
		vo.setUserNo(userNo);
		logger.info("쪽지 보내기, 파라미터 vo={}",vo);
		
		int cnt=messageService.insertMessage(vo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		String msg="쪽지 보내기 실패!", url="/message/messageWrite";
		if(cnt>0) {
			model.addAttribute("msg", "쪽지 보내기 성공");
			model.addAttribute("url", "/message/messageSent");
		}
		return "common/message";
		
	}
	
	@PostMapping("/adminWrite")
	public String adminWrite(@ModelAttribute MessageReceiveVO vo,int messageNo, Model model) {
		vo.setMessageNo(messageNo);
		logger.info("답변하기 vo={}",vo);
		
		int cnt=messageService.insertReceiveMessage(vo);
		
		String msg="답변 등록 실패!", url="/message/adminWrite";
		if(cnt>0) {
			model.addAttribute("msg", "답변 등록 성공");
			model.addAttribute("url", "/message/adminDetail?messageNo="+vo.getMessageNo());
		}
		return "common/message";
	}
	
	@RequestMapping("/messageSent")
	public String sentAll(HttpSession session,@ModelAttribute SearchVo searchVo, Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지함, userNo={}, searchVo={}",userNo, searchVo);
		
		//페이징 처리 관련
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserNo(userNo);
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		List<MessageSendVO> list=messageService.sentAll(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.sentCount(searchVo);
		logger.info("보낸 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		return "message/messageSent";
	}
	
	@RequestMapping("/messageInbox")
	public String receiveAll(HttpSession session,@ModelAttribute SearchVo searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("받은 쪽지함, userNo={}, searchVo={}",userNo, searchVo);
		
		//페이징 처리 관련
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserNo(userNo);
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		List<MessageReceiveVO> list=messageService.receiveAll(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.receiveCount(searchVo);
		logger.info("보낸 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "message/messageInbox";
	}
	
	@RequestMapping("/deleteMessage")
	public String deleteChat(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceiveMessage(messageNo);
		cnt=messageService.deleteMessage(messageNo);
		logger.info("쪽지 삭제 결과 cnt={}",cnt);
		
		String url="/message/messageSent";
		if(cnt>0) {
			return "redirect:/message/messageSent";
		}else {
			model.addAttribute("msg", "쪽지 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/deleteReceive")
	public String deleteReceive(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceiveMessage(messageNo);
		logger.info("답변 삭제 결과 cnt={}",cnt);
		
		String url="/message/adminDetail?messageNo="+messageNo;
		if(cnt>0) {
			return "redirect:/message/adminDetail?messageNo="+messageNo;
		}else {
			model.addAttribute("msg", "답변 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/adminDelete")
	public String adminDelete(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceiveMessage(messageNo);
		cnt=messageService.deleteMessage(messageNo);
		logger.info("삭제 결과 cnt={}",cnt);
		
		String url="/message/adminEdit";
		if(cnt>0) {
			return "redirect:/message/adminInbox";
		}else {
			model.addAttribute("msg", "쪽지 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute MessageSendListVO sListVo,Model model) {
		logger.info("선택한 쪽지 삭제, 파라미터 mrListVo={}",sListVo);
		
		List<MessageSendVO> list=sListVo.getSMessage();
		for(int i=0;i<list.size();i++) {
			MessageSendVO vo=list.get(i);
			int messageNo=vo.getMessageNo();
			
			logger.info("i={}, messageNo={}", i, messageNo);
		}
		
		String msg="선택한 쪽지 삭제 중 에러 발생!", url="/message/adminInbox";
		int cnt=messageService.deleteMessageMulti(list);
		if(cnt>0) {
			msg="선택한 쪽지 삭제 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/messageMenu")
	public String countMessage(HttpSession session,@ModelAttribute SearchVo searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지, 받은 쪽지 수, userNo={}, searchVo={}",userNo,searchVo);
		searchVo.setUserNo(userNo);
		
		int sentCount=messageService.sentCount(searchVo);
		logger.info("보낸 쪽지 수 sentCount={}",sentCount);
		
		int receiveCount=messageService.receiveCount(searchVo);
		logger.info("받은 쪽지 수 receiveCount={}",receiveCount);
		
		model.addAttribute("sentCount", sentCount);
		model.addAttribute("receiveCount", receiveCount);
		
		return "message/messageMenu/messageMenu";
	}
	
	@RequestMapping("/messageDetail")
	public String sentDetail(int messageNo,Model model) {
		logger.info("쪽지 상세보기 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "message/messageDetail";
	}
	
	@RequestMapping("/adminDetail")
	public String adminDetail(int messageNo,Model model) {
		logger.info("관리자 쪽지 상세보기 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "message/adminDetail";
	}
	
	@GetMapping("/messageEdit")
	public String sentEdit(int messageNo,Model model) {
		logger.info("보낸 쪽지 수정 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		return "message/messageEdit";
	}
	
	@GetMapping("/adminEdit")
	public String adminEdit(int messageNo,Model model) {
		logger.info("답변 수정 messageNo={}",messageNo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "message/adminEdit";
	}
	
	@PostMapping("/messageEdit")
	public String sentEdit_post(@ModelAttribute MessageSendVO vo,Model model) {
		logger.info("쪽지 수정, vo={}",vo);
		
		int cnt=messageService.editMessage(vo);
		logger.info("쪽지 수정 결과 cnt={}",cnt);
		
		String msg="쪽지 수정 실패!", url="/message/messageEdit";
		if(cnt>0) {
			model.addAttribute("msg", "쪽지 수정 성공");
			model.addAttribute("url", "/message/messageDetail?messageNo="+vo.getMessageNo());
		}
		return "common/message";
	}
	
	@PostMapping("/adminEdit")
	public String adminEdit_post(@ModelAttribute MessageReceiveVO vo,Model model) {
		logger.info("답변 수정, vo={}",vo);
		
		int cnt=messageService.editReceiveMessage(vo);
		logger.info("답변 수정 결과 cnt={}",cnt);
		
		String msg="답변 수정 실패!", url="/message/adminEdit";
		if(cnt>0) {
			model.addAttribute("msg", "답변 수정 성공");
			model.addAttribute("url", "/message/adminDetail?messageNo="+vo.getMessageNo());
		}
		return "common/message";
	}
	
	@RequestMapping("/adminInbox")
	public String adminInbox(@ModelAttribute SearchVo searchVo,Model model) {
		logger.info("관리자 쪽지함, searchVo={}",searchVo);
		
		//날짜
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			searchVo.setEndDay(str);
			searchVo.setStartDay(str);
		}
		
		//페이징 처리 관련
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		List<MessageSendVO> list=messageService.receiveMessage(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.totalReceive(searchVo);
		logger.info("관리자 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		return "/message/adminInbox";
	}
}
