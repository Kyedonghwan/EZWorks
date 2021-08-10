package com.it.ez.addrbook.model;

import java.util.List;
import java.util.Map;

public interface CoAddrBookService {
	List<CoEmpVO> selectAll(Map<String, String> paraMap);
	int selectTotalRecord(CoEmpVO searchVo);
	CoEmpVO selectByEmpNo(int empNo);
}
