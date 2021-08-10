package com.it.ez.reservation.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/reservation/reservModify")
	public void updateDtView(@RequestParam int rvdNo, Model model) {
		ReservDtVO vo = reservDtService.showReservDt(rvdNo);
		
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/reservation/reservModify")
	public String updateReservDt(@ModelAttribute ReservDtVO vo,@RequestParam int rvdCate) {
		logger.info("예약 카테고리 수정, vo={}",vo);
		
		int udRes=reservDtService.updateReservDt(vo);
		logger.info("예약 카테고리 수정 결과, udRes={}",udRes);
		
		return "redirect:/reservation/reservCategory?rvNo="+rvdCate;
	}
	
	@ResponseBody
	@GetMapping("/sidebarList")
	public List<ReservDtVO> listReservCate() {
		List<ReservDtVO> list = reservDtService.selectReservDtAll();
		
		return list;
	}
}
