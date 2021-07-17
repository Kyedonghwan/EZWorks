package com.it.ez.message.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVo {
	private String employeeNo;
	private String teamId;
	private String teamName;
	private String email;
	private String employeeName;
	private String password;
	private String positionId; // 직급
	private String joinDate;
	private String isAuthority; // 인증여부
	private String lastLogin;
	private String role;
	private String positionName;
	private String imageUrl;
	

	

}
