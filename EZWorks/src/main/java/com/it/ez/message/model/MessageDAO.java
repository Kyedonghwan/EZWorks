package com.it.ez.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.message.common.SearchVo;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageSendVO vo);
	int insertReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVo searchVo);
	List<MessageReceiveVO> receiveAll(SearchVo searchVo);
	int deleteMessage(int messageNo);
	int deleteReceiveMessage(int messageNo);
	int sentCount(SearchVo searchVo);
	int receiveCount(SearchVo searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> receiveMessage(SearchVo searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVo searchVo);
}
