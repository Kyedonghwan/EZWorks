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
	private String schContent;
	private String schCateg;
	private String schEventplace;
	private int EMP_NO;
}
