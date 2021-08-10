package com.it.ez.addrbook.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CoAddrBookServiceImpl implements CoAddrBookService {
	private final CoAddrBookDAO dao;
	
	@Override
	public List<CoEmpVO> selectAll(Map<String, String> paraMap) {
		return dao.selectAll(paraMap);
	}

	@Override
	public int selectTotalRecord(CoEmpVO searchVo) {
		return dao.selectTotalRecord(searchVo);
	}

	@Override
	public CoEmpVO selectByEmpNo(int empNo) {
		return dao.selectByEmpNo(empNo);
	}
	
}
