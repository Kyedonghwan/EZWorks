package com.it.ez.approval.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.ez.approval.model.ApprovalLineVO;
import com.it.ez.approval.model.ApprovalService;
import com.it.ez.approval.model.ApprovalVO;
import com.it.ez.approval.model.BrowseVO;
import com.it.ez.approval.model.ReceptionVO;
import com.it.ez.approval.model.ReferenceVO;
import com.it.ez.emp.model.EmpService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/approval")
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService approvalService;
	
	@GetMapping("/main")
	public void main(Model model){
		List<Map<String,Object>> list1 = approvalService.selectWaitApproval(1);
		
		model.addAttribute("list1",list1); //결재 대기 리스트 추출
		
	}
	
	@GetMapping("/wait")
	public void waitApproval(Model model) {
		List<Map<String,Object>> list = approvalService.selectWaitApproval(1);
		
		model.addAttribute("list",list);
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int approvalNo,@RequestParam int formNo,Model model) {
		
		List<Map<String,Object>> stampList= approvalService.selectStamp(approvalNo);
		Map<String,Object> map=approvalService.selectWaitApprovalVO(approvalNo);
		
		model.addAttribute("stampList",stampList);
		model.addAttribute("vo",map);
		model.addAttribute("approval",approvalService.selectApprovalByNo(approvalNo));
		model.addAttribute("reference",approvalService.selectReference(approvalNo));
		model.addAttribute("browse",approvalService.selectBrowse(approvalNo));
		model.addAttribute("reception",approvalService.selectReception(approvalNo));
		model.addAttribute("myEmpNo",1);
		ApprovalLineVO alvo= new ApprovalLineVO();
		alvo.setEmpNo(1);
		alvo.setApprovalNo(approvalNo);
		model.addAttribute("approvalLineOrder",approvalService.selectApprovalLineOrder(alvo));
		if(formNo==3) {
			return "approval/form3Detail";
		}
		return "";
	}
	
	@Transactional
	@PostMapping("/cancel")
	public String cancel(@RequestParam int approvalNo) {
		int cnt=approvalService.updateApprovalCancel(approvalNo);
		ApprovalLineVO alvo = new ApprovalLineVO();
		alvo.setEmpNo(1);
		alvo.setApprovalNo(approvalNo);
		cnt=approvalService.updateApprovalLineCancel(alvo);
		return "redirect:/approval/wait";
	}
	
	@Transactional
	@PostMapping("/agree")
	public String agree(@ModelAttribute ApprovalLineVO vo,@RequestParam String nextApproval) {
		vo.setEmpNo(1);
		int cnt=0;
		if(approvalService.isCompleteApproval(vo.getApprovalNo())>0) {
			cnt=approvalService.updateCurrentStateComplete(vo.getApprovalNo());
		}
		cnt = approvalService.updateApproval(vo.getApprovalNo());
		cnt = approvalService.updateApprovalLine(vo);
		if(nextApproval.equals("N")) {
			return "redirect:/approval/wait";
		}else {
			return "";
		}
		
	}
	
	@Transactional
	@PostMapping("/disagree")
	public String disagree(@ModelAttribute ApprovalLineVO vo,@RequestParam String nextApproval) {
		vo.setEmpNo(1);
		
		int cnt=approvalService.updateCurrentStateDisagree(vo.getApprovalNo());
		cnt = approvalService.updateApproval(vo.getApprovalNo());
		cnt = approvalService.updateApprovalLine(vo);
		cnt=approvalService.updateApprovalLineDisagree(vo);
		
		if(nextApproval.equals("N")) {
			return "redirect:/approval/wait";
		}else {
			return "";
		}
		
	}
	
	@GetMapping("/complete")
	public void complete(Model model) {
		List<Map<String,Object>> list = null;
		list = approvalService.selectCompleteApproval(1);
		model.addAttribute("list",list);
		
	}
	
	@PostMapping("/insert")
	@Transactional
	public String insert(@ModelAttribute ApprovalVO approvalVo,@RequestParam String alEmpNo,
			@RequestParam String alDeptNo,@RequestParam String alOrderNo,@RequestParam String referenceEmpNo,
			@RequestParam String referenceDeptNo,@RequestParam String browseEmpNo,@RequestParam String receptionEmpNo) {
		
		approvalVo.setEmpNo(1);
		approvalVo.setDeptNo(101);
		System.out.println(approvalVo);
		approvalService.insertApproval(approvalVo);
		int approvalNo=approvalVo.getApprovalNo();
		if(alEmpNo!=null && !alEmpNo.isEmpty()) {
			List<ApprovalLineVO> list = new ArrayList<ApprovalLineVO>();
			
			String[] alEmpNoArr =alEmpNo.split(",");
			String[] alDeptNoArr = alDeptNo.split(",");
			String[] alOrderNoArr = alOrderNo.split(",");
			
			int size = alEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ApprovalLineVO vo = new ApprovalLineVO();
				vo.setApprovalNo(approvalNo);
				vo.setAlOrder(Integer.parseInt(alOrderNoArr[i]));
				vo.setEmpNo(Integer.parseInt(alEmpNoArr[i]));
				vo.setDeptNo(Integer.parseInt(alDeptNoArr[i]));
				vo.setIsReceptedApproval("N");
				list.add(vo);
			}
			
			approvalService.insertApprovalLine(list);
		}
		
		if(referenceEmpNo!=null && !referenceEmpNo.isEmpty()) {
			List<ReferenceVO> list2= new ArrayList<ReferenceVO>();
			String[] refEmpNoArr = referenceEmpNo.split(",");
			String[] refDeptNoArr = referenceDeptNo.split(",");
			
			int size=refEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ReferenceVO vo = new ReferenceVO();
				vo.setApprovalNo(approvalNo);
				vo.setDeptNo(Integer.parseInt(refDeptNoArr[i]));
				vo.setEmpNo(Integer.parseInt(refEmpNoArr[i]));
				list2.add(vo);
			}
			
			approvalService.insertReference(list2);
		}
		
		if(browseEmpNo!=null && !browseEmpNo.isEmpty()) {
			List<BrowseVO> list3= new ArrayList<BrowseVO>();
			String[] browEmpNoArr = browseEmpNo.split(",");
			
			int size=browEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				BrowseVO vo = new BrowseVO();
				vo.setApprovalNo(approvalNo);
				vo.setEmpNo(Integer.parseInt(browEmpNoArr[i]));
				list3.add(vo);
			}
			
			approvalService.insertBrowse(list3);
		}
		
		if(receptionEmpNo!=null && !receptionEmpNo.isEmpty()) {
			List<ReceptionVO> list4= new ArrayList<ReceptionVO>();
			String[] receptEmpNoArr = receptionEmpNo.split(",");
			
			int size=receptEmpNoArr.length;
			
			for(int i=0;i<size;i++) {
				ReceptionVO vo = new ReceptionVO();
				vo.setApprovalNo(approvalNo);
				vo.setEmpNo(Integer.parseInt(receptEmpNoArr[i]));
				vo.setIsRecepted("N");
				list4.add(vo);
			}
			
			approvalService.insertReception(list4);
		}
		
		
		return "redirect:/approval/main";
	}
	
	@GetMapping("/reference")	
	@Transactional
	public String reference(Model model) {
		model.addAttribute("reference",approvalService.selectReferenceByEmpNo(1));
		model.addAttribute("browse",approvalService.selectBrowseByEmpNo(1));
		model.addAttribute("union",approvalService.selectUnionRef(1));
		return "approval/reference";
	}
	
	@GetMapping("/draft")
	public String draft(Model model) {
		model.addAttribute("all",approvalService.selectDraftAll(1));
		model.addAttribute("continues",approvalService.selectDraftContinue(1));
		model.addAttribute("agree",approvalService.selectDraftAgree(1));
		model.addAttribute("disagree",approvalService.selectDraftDisagree(1));
		return "approval/draft";
	}
	
	@GetMapping("/temp")
	public String temp(Model model) {
		model.addAttribute("tempList",approvalService.selectTempList(1));
		return "approval/temp";
	}
	
	@GetMapping("/cancelDraft")
	public String cancelDraft(@RequestParam int approvalNo) {
		int cnt=approvalService.deleteApproval(approvalNo);
		return "redirect:/approval/draft";
		
	}
	
}
