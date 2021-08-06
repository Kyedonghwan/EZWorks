package com.it.ez.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.message.common.SearchVO;

@Mapper
public interface SendDAO {
	int insertMessage(SendVO vo);
	public List<MessageVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	SendVO selectByNo(int no);
	int updateMessage(SendVO vo);
}
