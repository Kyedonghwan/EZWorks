package com.it.ez.posting.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpPostingViewVO {
	private String empName;
	private String empImg;
	private int deptNo;
	private int posNo;
	private int postingNo;
	private String postingTitle;
	private int boardNo;
	private int empNo;
	private String postingContent;
	private int postingIsPublic;
	private int postingIsNotice;
	private int postingIsTemp;
	private int postingLikes;
	private Timestamp postingRegdate;
}
