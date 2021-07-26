package com.it.ez.addrbook.model;

import java.util.List;

public interface CoAddrBookService {
	List<EmployeeVO> selectAll(EmployeeVO searchVo);
	int selectTotalRecord(EmployeeVO searchVo);

}
