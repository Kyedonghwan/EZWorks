package com.it.ez.addrbook.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CoAddrBookDAO {
	List<EmployeeVO> selectAll(EmployeeVO searchVo);
	int selectTotalRecord(EmployeeVO searchVo);

}
