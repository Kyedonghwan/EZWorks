package com.it.ez.approval.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalVO {
	private int approvalNo;
	private String approvalStringNo;
	private int formNo;
	private int empNo;
	private Timestamp approvalRegdate;
	private int deptNo;
	private String form3Title;
	private String form3Content;
	private String currentState;
	private String emergency;
	private String approvalDraftingOpinion;
	private int currentOrder;
	private String form20Div;
	private String form20Startdate;
	private String form20A;
	private String form20B;
	private String form20C;
	private String form20D;
	private String form20E;
	private String form20Description;

}
