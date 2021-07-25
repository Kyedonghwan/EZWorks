package com.it.ez.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.it.ez.message.common.SearchVO;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageSendVO vo);
	int insertReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVO searchVo);
	List<MessageReceiveVO> receiveAll(SearchVO searchVo);
	int deleteMessage(int messageNo);
	int deleteReceiveMessage(int messageNo);
	int sentCount(SearchVO searchVo);
	int receiveCount(SearchVO searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> receiveMessage(SearchVO searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVO searchVo);
}
