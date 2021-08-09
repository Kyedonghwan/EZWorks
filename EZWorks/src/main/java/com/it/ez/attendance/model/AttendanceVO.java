package com.it.ez.attendance.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceVO {
	private int attendanceNo;
	private int empNo;
	private String attendanceStatus;
	private Date attendanceRecordedTime;
	private String ipAddress;
}
