package com.it.ez.message.model;

import java.util.List;

import com.it.ez.message.common.SearchVO;

public interface SendService {
	int insertMessage(SendVO vo);
	public List<MessageVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	SendVO selectByNo(int no);
}
