package com.it.ez.attendance.model;

import java.util.List;
import java.util.Map;

public interface AttendanceService {
	public static final String STATUS_WORK_IN = "출근";
	public static final String STATUS_WORK_OUT = "퇴근";
	public static final String STATUS_BUSINESS_AWAY = "외근";
	public static final String STATUS_HALF_DAYOFF = "반차";
	public static final String STATUS_BUSINESS_TRIP = "출장";
	
	public List<AttendanceVO> selectByDate(Map<String, Object> map);
	public int insertAttendance(AttendanceVO vo);
	public List<List<AttendanceMainViewVO>> getDaysListFullDetail(int year, int month, int empNo);
	public int isAttended(String startingDate, String endingDate, int empNo);
	public int isEnded(String startingDate, String endingDate, int empNo);

}
