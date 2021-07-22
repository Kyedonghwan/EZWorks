package com.it.ez.addrbook.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddrBookDAO {

	int insertBook(AddrBookVO vo);
}


