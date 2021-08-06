package com.it.ez.attendance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.ez.attendance.common.AttendanceMonthCalculator;
import com.it.ez.attendance.common.AttendanceUtil;
import com.it.ez.attendance.model.AttendanceMainViewVO;
import com.it.ez.attendance.model.AttendanceService;
import com.it.ez.attendance.model.AttendanceVO;
import com.it.ez.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/attendance")
@RequiredArgsConstructor
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private final AttendanceMonthCalculator attendanceMonthCalculator;
	private final AttendanceService attendanceService;
	
	@RequestMapping("/attendanceMain")
	public String attendanceMain(HttpSession session, Model model, @RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month, @RequestParam(required = false) Integer date)  {
		////로그인 됐을 시

		EmpVO empVo = (EmpVO) session.getAttribute("empVo"); 
		int empNo = empVo.getEmpNo();

		//주 반복을 위한
		if(year==null) {
			LocalDate now = LocalDate.now();
			year = now.getYear();
			month = now.getMonthValue();
			date = now.getDayOfMonth();
			
		}
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);
		logger.info("nowYear={} nowMonth={} nowdayofMonth={}", year, month, date);

		String startingDate = year+"-"+month+"-"+date;
		String endingDate = year+"-"+month+"-"+(date+1);
		logger.info("startingDate = {}, endingDate={}", startingDate, endingDate);
		int isAttended = attendanceService.isAttended(startingDate, endingDate, empNo);
		logger.info("여기 들어와야함");
		logger.info("isAttended={}", isAttended);
		model.addAttribute("isAttended", isAttended);
		int isEnded = attendanceService.isEnded(startingDate, endingDate, empNo);
		model.addAttribute("isEnded", isEnded);

		List<List<Date>> daysList = attendanceMonthCalculator.getDaysList(year, month);
		List<List<AttendanceMainViewVO>> daysListWithDetail = attendanceService.getDaysListFullDetail(year, month, empNo);
		model.addAttribute("daysList", daysList);
		model.addAttribute("daysListWithDetail", daysListWithDetail);

		/*
		 * for(int i=0;i<daysListWithDetail.size();i++) { List<AttendanceMainViewVO>
		 * temp = daysListWithDetail.get(i); for(int j=0;j<temp.size();j++) {
		 * AttendanceMainViewVO tempVo = temp.get(j); List<AttendanceVO> tempoVo =
		 * tempVo.getAttendanceVosInADay(); Date start = null; Date end = null;
		 * for(AttendanceVO tttt: tempoVo) { if(tttt.getAttendanceStatus().equals("퇴근"))
		 * { end = tttt.getAttendanceRecordedTime(); }else
		 * if(tttt.getAttendanceStatus().equals("출근")) { start =
		 * tttt.getAttendanceRecordedTime(); } long diff =
		 * end.getTime()-start.getTime(); int diffHour = (int) (diff/3600000); int
		 * diffMinute = (int) ((diff - diffHour)/60000); int diffSecond = (int)
		 * ((diff-diffHour-diffMinute)/1000);
		 * 
		 * }
		 * 
		 * } }
		 */
		logger.info("daysList.size={}", daysList.size());
		logger.info("daysList={}", daysList);
		
		
		
		return "attendance/attendanceMain";
	}
	
	@ResponseBody
	@RequestMapping("/attendanceByMonth")
	public List<List<AttendanceMainViewVO>> attendanceByMonth(HttpSession session ,@RequestParam(required = false) Integer year, @RequestParam(required = false) Integer month, @RequestParam(required = false) Integer date){
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("year={}, month={}, date={}", year, month, date);
		List<List<AttendanceMainViewVO>> daysListWithDetail = attendanceService.getDaysListFullDetail(year, month, empNo);
		return daysListWithDetail;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/date_detail") public
	 */
	@ResponseBody
	@RequestMapping("/week_detail")
	public List<AttendanceVO> getWeekDetail(@RequestParam int year, @RequestParam int month, @RequestParam int date, HttpSession session){
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("year={}, month={}, date={}", year, month, date);
		String startingDate = year+"/"+month+"/"+date;
		String endingDate = year+"/"+month+"/"+(date+1);
		Map<String, Object> map = new HashMap<>();
		map.put("startingDate", startingDate);
		map.put("endingDate", endingDate);
		map.put("empNo", empNo);
		List<AttendanceVO> detailList = attendanceService.selectByDate(map);
		return detailList;
	}
	
	@ResponseBody
	@PostMapping("/insert_workIn")
	public AttendanceVO insertWorkIn(HttpSession session, HttpServletRequest request, @RequestParam String record, @RequestParam String attendanceStatus) throws ParseException {
		logger.info("출근 ajax");
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("파라미터, record={}, attendanceStatus={}", record, attendanceStatus);
		Date attendanceRecordedTime = sdf.parse(record);
		
		AttendanceVO vo = new AttendanceVO();
		vo.setEmpNo(empNo);
		String ipAddress = AttendanceUtil.getClientIp(request);
		vo.setIpAddress(ipAddress);
		vo.setAttendanceRecordedTime(attendanceRecordedTime);
		vo.setAttendanceStatus(attendanceStatus);
		logger.info("attendanceVo = {}", vo);
		int cnt = attendanceService.insertAttendance(vo);
		
		return vo;
	}
	
	@ResponseBody
	@PostMapping("/insert_workOut")
	public AttendanceVO insertWorkOut(HttpSession session, HttpServletRequest request, @RequestParam String record, @RequestParam String attendanceStatus) throws ParseException {
		logger.info("퇴근 ajax");
		EmpVO empVo = (EmpVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("파라미터, record={}, attendanceStatus={}", record, attendanceStatus);
		Date attendanceRecordedTime = sdf.parse(record);
		
		AttendanceVO vo = new AttendanceVO();
		vo.setEmpNo(empNo);
		String ipAddress = AttendanceUtil.getClientIp(request);
		vo.setIpAddress(ipAddress);
		vo.setAttendanceRecordedTime(attendanceRecordedTime);
		vo.setAttendanceStatus(attendanceStatus);
		logger.info("attendanceVo = {}", vo);
		int cnt = attendanceService.insertAttendance(vo);
		
		return vo;
	}
	
}
