package com.it.ez.posting.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardMainPostingVO {
	private int postingNo;
	private String postingTitle;
	private String postingContent;
	private Timestamp postingRegdate;
	private int empNo;
	private int boardNo;
	private String empName;
	private String empImg;
	private int posNo;
	private String boardName;
	private String boardType;
	private int deptNo;
	private String deptName;
	private String posName;
}
