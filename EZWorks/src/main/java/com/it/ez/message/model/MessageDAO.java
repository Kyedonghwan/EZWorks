package com.it.ez.message.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

import com.it.ez.message.common.SearchVO;

@Mapper
public interface MessageDAO {
	int insertMessage(MessageVO vo);
	public List<MessageVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	MessageVO selectByNo(int no);
	boolean checkPwd(int no, String pwd);
	String selectPwd(int no);
	int deleteMessage(int no);	
	int updateMessage(MessageVO vo);


}
