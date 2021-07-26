package com.it.ez.addrbook.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class EmployeeVO extends AddrSearchVO{
	 private int empNo ;
	 private String empName;
	 private String empPwd ; 
	 private String empImg ;
	 private int deptNo;
	 private String deptName ;
	 private String email;
	 private String   posName;
	 private int   posNo ;
	 private String   hp ;
	 private String   corp_phone;
	 private String   address;
	 private String   addressDetail;
}
