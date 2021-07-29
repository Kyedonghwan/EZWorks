package com.it.ez.addrbook.model;

import java.util.List;

public interface CoAddrBookService {
	List<CoEmpVO> selectAll(CoEmpVO searchVo);
	int selectTotalRecord(CoEmpVO searchVo);

}
