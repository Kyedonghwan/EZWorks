package com.it.ez.message.model;

import java.util.List;

public interface MessageService {
	int insertMessage(MessageVO vo);
	List<MessageVO> selectAll();
}
