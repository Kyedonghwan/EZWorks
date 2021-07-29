package com.it.ez.addrbook.model;


import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AddrBookServiceImpl implements AddrBookService {
	private final AddrBookDAO dao;
	@Override
	public int insertBook(AddrBookVO vo) {
		return dao.insertBook(vo);
	}
	@Override
	public List<AddrBookVO> selectAll(AddrBookVO searchVo) {
		return dao.selectAll(searchVo);
	}
	@Override
	public int selectTotalRecord(AddrBookVO searchVo) {
		return dao.selectTotalRecord(searchVo);
	}
	@Override
	public int updateBook(AddrBookVO vo) {
		return dao.updateBook(vo);
	}
	@Override
	public AddrBookVO selectByNo(int bookNo) {
		return dao.selectByNo(bookNo);
	}

}
