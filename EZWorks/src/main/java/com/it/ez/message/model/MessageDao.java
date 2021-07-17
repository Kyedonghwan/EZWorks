package com.it.ez.message.model;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MessageDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public MessageVo getDetailMessage(MessageVo messageVo ) {
		return sqlSession.selectOne("message.getDetailMessage", messageVo);
		
	}
	
	public int sendMessage(MessageVo messageVo ) {
		int count = sqlSession.insert("message.sendMessage", messageVo);
		return count;
	}
	public int answerMessage(MessageVo messageVo ) {
		int count = sqlSession.insert("message.answerMessage", messageVo);
		return count;
	}
	
	public int deleteMessage(MessageVo messageVo ) {
		int count = sqlSession.delete("message.deleteMessage", messageVo);
		return count;
	}
	
	public List<MessageVo> getMessage(MessageVo messageVo) {
		return sqlSession.selectList("message.getMessage", messageVo);
	}
}
