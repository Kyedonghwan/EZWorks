package com.it.ez.message.model;

import java.util.List;

import com.it.ez.message.common.SearchVOMessage;

public interface MessageService {
	int insertMessage(MessageSendVO vo);
	int insertReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVOMessage searchVo);
	List<MessageReceiveVO> receiveAll(SearchVOMessage searchVo);
	int deleteMessage(int messageNo);
	int deleteReceiveMessage(int messageNo);
	int deleteMessageMulti(List<MessageSendVO> list);
	int sentCount(SearchVOMessage searchVo);
	int receiveCount(SearchVOMessage searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> receiveMessage(SearchVOMessage searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVOMessage searchVo);
}
