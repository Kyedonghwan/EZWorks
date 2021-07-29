package com.it.ez.message.model;

import java.util.List;

import com.it.ez.message.common.SearchVO;

public interface MessageService {
	int insertMessage(MessageVO vo);
	public List<MessageVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	MessageVO selectByNo(int no);
	boolean checkPwd(int no, String pwd);
	int deleteMessage(int no);
	int updateMessage(MessageVO vo);

}
