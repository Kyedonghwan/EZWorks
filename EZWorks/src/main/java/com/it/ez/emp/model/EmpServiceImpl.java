package com.it.ez.emp.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmpServiceImpl implements EmpService{
	private final EmpDAO empDao;

	@Override
	public EmpVO selectEmpByEname(String empEname) {
		return empDao.selectEmpByEname(empEname);
	}

	@Override
	public EmpVO selectEmpByEmpNo(int empNo) {
		String posName = empDao.selectPosName(empNo);
		EmpVO vo = empDao.selectEmpByEmpNo(empNo);
		vo.setPosName(posName);
		return vo;
	}
	
	@Override
	public List<Map<String, Object>> selectOrganization() {
		return empDao.selectOrganization();
	}

	@Override
	public int loginProc(int empNo, String pwd) {
		String dbPwd=empDao.selectPwd(empNo);
		int result=0;
		if(dbPwd == null || dbPwd.isEmpty()) {
			result=ID_NONE; //아이디 존재하지 않을시
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK; //db와 사용자가 입력한 비밀번호가 일치시
			}else {
				result=PWD_DISAGREE; //비밀번호 일치 실패시
			}
		}
		
		return result;		
	}
	public EmpVO selectEmpInfo(int empNo) {
		return empDao.selectEmpInfo(empNo);
	}
	public String selectName(int empNo) {
		return empDao.selectName(empNo);
	}

	@Override
	public String selectPosName(int posNo) {
		return empDao.selectPosName(posNo);
	}
}
