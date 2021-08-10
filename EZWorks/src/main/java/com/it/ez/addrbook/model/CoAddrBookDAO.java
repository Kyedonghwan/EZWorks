package com.it.ez.addrbook.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CoAddrBookDAO {
	List<CoEmpVO> selectAll(Map<String, String> paraMap);
	int selectTotalRecord(CoEmpVO searchVo);
	CoEmpVO selectByEmpNo(int empNo);
}
