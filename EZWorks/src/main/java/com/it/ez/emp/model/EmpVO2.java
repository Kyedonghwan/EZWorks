package com.it.ez.emp.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmpVO2 {
	private int emp_No;
	private String emp_Name;
    private String emp_Pwd; 
    private String emp_Img;
    private int dept_No;
    private int pos_No;
    private int community_No;
}
