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
import com.it.ez.reservation.model.ReservService;
import com.it.ez.reservation.model.ReservVO;
import com.it.ez.reservation.model.ReservationVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ReservController {
	private static final Logger logger = LoggerFactory.getLogger(ReservController.class);
	
	private final ReservService reservService;
	private final ReservDtService reservDtService;
	
	@RequestMapping("/reservMain")
	public void showMain() {
		logger.info("예약메인 보여주기");
	}
	
	@GetMapping("/reservCategory")
	public String showResrvCate(@RequestParam int rvNo, Model model) {
		logger.info("카테고리별 예약화면 보여주기");
		
		ReservVO vo = reservService.selectResrvById(rvNo);
		logger.info("카테고리 별 예약화면 보여주기결과, vo={}",vo);
		List<ReservDtVO> list = reservDtService.selectReservDtById(rvNo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "reservation/reservCategory";
	}
	
	@PostMapping("/reservModal")
	public String insertReserv(@ModelAttribute ReservationVO vo) {
		logger.info("일정 입력하기, 파라미터 vo={}",vo);
		
		int res=reservService.insertReserv(vo);
		logger.info("일정 입력하기 결과, res={}",res);
		
		return "redirect:/reservation/reservMain";
	}
	
	@ResponseBody
	@GetMapping("/listReserv")
	public void listReserv(@RequestParam int rvdCate, Model model) {
		List<ReservDtVO> list = reservService.showReservCate(rvdCate);
		logger.info("예약 카테고리별 리스트 보여주기, list.size()={}",list.size());
		
		model.addAttribute("list", list);
	}
	
	@ResponseBody
	@GetMapping("/listReservation")
	public List<ReservationVO> listReservation(@RequestParam String cateNo) {
		logger.info("예약 리스트 보여주기, 파라미터, cateNo={}",cateNo);
		List<ReservationVO> list = reservService.showReservList(cateNo);
		logger.info("예약 리스트 보여주기, list.size()={}",list.size());
		
		return list;
	}

}
