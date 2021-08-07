package com.it.ez.approval.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalLineVO {
	private int alNo;
	private int empNo;
	private int deptNo;
	private int approvalNo;
	private int alOrder;
	private String alOpinion;
	private Timestamp alRegdate;
	private String isReceptedApproval;
	private String currentState;
}
