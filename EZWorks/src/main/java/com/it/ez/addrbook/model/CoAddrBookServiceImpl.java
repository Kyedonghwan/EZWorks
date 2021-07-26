package com.it.ez.addrbook.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CoAddrBookServiceImpl implements CoAddrBookService {
	private final CoAddrBookDAO dao;
	
	@Override
	public List<EmployeeVO> selectAll(EmployeeVO searchVo) {
		return dao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(EmployeeVO searchVo) {
		return dao.selectTotalRecord(searchVo);
	}
	
}