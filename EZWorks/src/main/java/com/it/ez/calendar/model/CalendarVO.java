package com.it.ez.calendar.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CalendarVO {
	private int schNo;
	private String schTitle;
	private String schStart;
	private String schEnd;
	private String schStartTime;
	private String schEndTime;
	private Character schAll;
	private String schAttend;
	private String schExtAttend;
	private String schPlace;
	private String schContent;
	private String schColor;
	private String schCate;
	private int empNo;
}
