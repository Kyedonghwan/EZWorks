package com.it.ez.approval.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReferenceVO {
	private int referenceNo;
	private int empNo;
	private int deptNo;
	private int approvalNo;
}
