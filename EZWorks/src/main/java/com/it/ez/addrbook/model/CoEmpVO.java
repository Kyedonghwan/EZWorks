package com.it.ez.addrbook.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CoEmpVO extends AddrSearchVO{
	 private int empNo; 
	 private String empName;
	 private String empTel; 
	 private String empEmail;
	 private String empZipcode;
	 private String empAddr;
	 private String empAddr2;
	 private String empImg;
	 private int deptNo; 
	 private int posNo;
	 private String posName;
	 
	 private String deptName;
	 
	   
}