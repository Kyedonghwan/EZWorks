package com.it.ez.message.model;

import java.util.List;

import com.it.ez.message.common.SearchVo;

public interface MessageService {
	int insertMessage(MessageSendVO vo);
	int insertReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVo searchVo);
	List<MessageReceiveVO> receiveAll(SearchVo searchVo);
	int deleteMessage(int messageNo);
	int deleteReceiveMessage(int messageNo);
	int deleteMessageMulti(List<MessageSendVO> list);
	int sentCount(SearchVo searchVo);
	int receiveCount(SearchVo searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> receiveMessage(SearchVo searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVo searchVo);
}
