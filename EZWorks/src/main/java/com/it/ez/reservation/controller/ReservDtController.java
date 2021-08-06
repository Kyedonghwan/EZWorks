package com.it.ez.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.reservDt.model.ReservDtService;
import com.it.ez.reservDt.model.ReservDtVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReservDtController {
	private static final Logger logger = LoggerFactory.getLogger(ReservDtController.class);
	
	private final ReservDtService reservDtService;
	
	@GetMapping("/reservation/reservDtCategory")
	public String showReservDt(@RequestParam int rvdNo, Model model) {
		logger.info("예약 상세 카테고리 보여주기");
		
		ReservDtVO vo = reservDtService.showReservDt(rvdNo);
		logger.info("예약 상세 카테고리 보여주기 결과, vo={}",vo);
		
		model.addAttribute("vo", vo);
		
		return "reservation/reservDtCategory";
	}
}
