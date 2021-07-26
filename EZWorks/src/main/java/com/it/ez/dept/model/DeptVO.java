package com.it.ez.dept.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DeptVO {
	private int deptNo;
	private String deptName;
	private int upperDeptNo;
}
