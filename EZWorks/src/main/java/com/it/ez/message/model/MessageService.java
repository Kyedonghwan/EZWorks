package com.it.ez.message.model;

import java.util.List;

import com.it.ez.message.common.SearchVO;

public interface MessageService {
	int insertMessage(MessageSendVO vo);
	int insertReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> sentAll(SearchVO searchVo);
	List<MessageReceiveVO> receiveAll(SearchVO searchVo);
	int deleteMessage(int messageNo);
	int deleteReceiveMessage(int messageNo);
	int deleteMessageMulti(List<MessageSendVO> list);
	int sentCount(SearchVO searchVo);
	int receiveCount(SearchVO searchVo);
	MessageSendVO sentByMessageNo(int messageNo);
	int editMessage(MessageSendVO vo);
	int editReceiveMessage(MessageReceiveVO vo);
	List<MessageSendVO> receiveMessage(SearchVO searchVo);
	MessageReceiveVO receiveByMessageNo(int messageNo);
	int totalReceive(SearchVO searchVo);
}
