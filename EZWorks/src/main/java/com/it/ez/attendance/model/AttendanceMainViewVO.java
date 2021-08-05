package com.it.ez.attendance.model;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceMainViewVO {
	private Date forCalendar;
	private List<AttendanceVO> attendanceVosInADay;
}
