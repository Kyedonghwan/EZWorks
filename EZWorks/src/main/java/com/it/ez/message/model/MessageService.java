package com.it.ez.message.model;

import java.util.List;

public interface MessageService {
	int insertMessage(MessageVO vo);
	List<MessageVO> selectAll();
	MessageVO selectByNo(int no);
	boolean checkPwd(int no, String pwd);
	int deleteMessage(int no);
}
