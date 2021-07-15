package com.it.ez.emp.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO {
	private int empNo;
	private String empName;
	private String empEname;
	private String empPwd;
	private String empTel;
	private String empSsn;
	private String empEmail;
	private String empZipcode;
	private String empAddr;
	private String empAddr2;
	private Timestamp empHiredate;
	private String empHobby;
	private String empSchool;
	private String empMajor;
	private Timestamp empOutdate;
	private String empImg;
	private String empLev;
	private int empSal;
	private String empBookmark;
	private int deptNo;
	private int posNo;
}
