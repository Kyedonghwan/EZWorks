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
import com.it.ez.reservation.model.reservViewVO;

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
	
	@GetMapping("/reservSetting")
	public void reservSet() {
		logger.info("예약 설정 보여주기");
	}
	
	@GetMapping("/reservEdit")
	public String reservEdit(@RequestParam int no,Model model) {
		logger.info("예약 수정 보여주기, 파라미터 no={}",no);
		reservViewVO vo2 = reservService.selectResrvViewById(no);
		
		ReservationVO vo = reservService.selectReservationById(no);
		logger.info("예약 수정 보여주기 결과, vo={}",vo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		
		return "reservation/reservEdit";
	}
	
	@PostMapping("/reservEdit")
	public String reservEditP(@ModelAttribute ReservationVO vo) {
		int cnt = reservService.updateReservation(vo);
		logger.info("예약 수정 결과, cnt={}",cnt);
		int rvdNo=Integer.parseInt(vo.getCateNo());
		
		return "redirect:/reservation/reservDtCategory?rvdNo="+rvdNo;
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
	
	@GetMapping("/reservMain")
	public String listReservAll(Model model){
		logger.info("내 예약/대여상황 보여주기");
		
		List<reservViewVO> aList = reservService.selectResrvAll();
		logger.info("내 예약/대여상황 보여주기 결과, aList={}",aList.size());
		
		model.addAttribute("aList", aList);
		
		return "reservation/reservMain";
	}
	
	@ResponseBody
	@RequestMapping("/deleteReserv")
	public void delCal(@RequestParam(defaultValue = "0")int no) {
		logger.info("삭제처리 no={}",no);
		
		int result=reservService.deleteResev(no);
		logger.info("삭제처리 결과, result={}",result);
	}
	
	@ResponseBody
	@GetMapping("/resourcesList")
	public List<ReservDtVO> resourcesList(@RequestParam int rvdCate) {
		logger.info("리소스에 넣을거");
		
		List<ReservDtVO> list = reservService.showReservCate(rvdCate);
		
		return list;
	}
}
