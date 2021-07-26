package com.it.ez.posting.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardClassicPostingVO {
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
	private int postingViewCount;
	private String empName;
	private int posNo;
	private String empImg;
	private String posName;
	private int currentStatusVal;
	
	/*   
	 * 
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
	 */
}
