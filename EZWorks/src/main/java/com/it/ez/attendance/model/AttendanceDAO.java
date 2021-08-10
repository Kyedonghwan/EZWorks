package com.it.ez.attendance.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	public List<AttendanceVO> selectByDate(Map<String, Object> map);
	public int insertAttendance(AttendanceVO vo);
	public int isAttended(String startingDate, String endingDate, int empNo);
	public int isEnded(String startingDate, String endingDate, int empNo);
	public AttendanceVO todayAttendTime(String startingDate, String endingDate, int empNo);
	public AttendanceVO todayEndTime(String startingDate, String endingDate, int empNo);
}
