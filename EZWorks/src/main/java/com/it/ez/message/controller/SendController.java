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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.message.common.ConstUtil;
import com.it.ez.message.common.PaginationInfo;
import com.it.ez.message.common.SearchVO;
import com.it.ez.message.model.MessageService;
import com.it.ez.message.model.MessageVO;
import com.it.ez.message.model.SendService;
import com.it.ez.message.model.SendVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/message")
public class SendController {
	private static final Logger logger = LoggerFactory.getLogger(SendController.class);
	
	private final SendService sendService;
	
	@GetMapping("/sendWrite")
	public String write() {
		//1
		logger.info("write 화면 보여주기");

		//2
		//3
		return "message/sendWrite";
	}
	
	@PostMapping("/sendWrite")
	public String write_post(@ModelAttribute SendVO vo, Model model) {
		//1
		logger.info("쪽지 등록 처리, 파라미터 vo={}",vo);
		
		//2
		String msg="쪽지 등록 실패",url="/message/sendWrite";
		int cnt = sendService.insertMessage(vo);
		logger.info("write 등록 결과, cnt={}",cnt);
		if(cnt>0) {
			msg="쪽지 등록 완료";
			url="/message/sendList";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	

	
	@RequestMapping("/sendList")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("쪽지 목록 페이지, 파라미터 searchVo={}", searchVo);
		
		//페이징 처리
		//[1] PaginationInfo 객체 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2] SearchVo에 paging관련 변수값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
		
		//2
		List<MessageVO> list=sendService.selectAll(searchVo);
		logger.info("쪽지 전체 조회 결과, list.size={}", list.size());
		
		int totalRecord=sendService.selectTotalRecord(searchVo);
		logger.info("totalRecord="+totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "message/sendList";
	}
	
	
	@GetMapping("/senddetail")
	public String detail(@RequestParam(defaultValue = "0") int no, Model model) {
		//1
		logger.info("상세 화면 보여주기, 파라미터 no={}",no);
		if(no==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "message/sendList");
			
			return "common/message";
		}
		
		//2
		SendVO vo2 = sendService.selectByNo(no);
		logger.info("detail 화면 결과, vo2={}",vo2);
		
		//3
		model.addAttribute("vo2", vo2);
		
		return "message/senddetail";
	}
	
}