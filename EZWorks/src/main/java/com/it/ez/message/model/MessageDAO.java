package com.it.ez.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageVO vo);
	List<MessageVO> selectAll();
}
