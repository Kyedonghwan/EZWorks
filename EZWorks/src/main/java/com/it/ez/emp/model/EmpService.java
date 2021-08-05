package com.it.ez.emp.model;

import java.util.List;
import java.util.Map;

public interface EmpService {

	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	List<Map<String,Object>> selectOrganization();
	public EmpVO selectEmpByEname(String empEname);
	public EmpVO selectEmpByEmpNo(int empNo);

	public int loginProc(int empNo, String pwd);
	EmpVO selectEmpInfo(int empNo);
}
