package com.it.ez.addrbook.model;

import java.util.List;

public interface AddrBookService {
	int insertBook(AddrBookVO vo);
	List<AddrBookVO> selectAll(AddrBookVO searchVo);
	int selectTotalRecord(AddrBookVO searchVo);
	int updateBook(AddrBookVO vo);
	AddrBookVO selectByNo(int bookNo);
	int deleteBook(int bookNo);	

}
