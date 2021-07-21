package com.it.ez.message.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private final MessageDAO messageDao;
	
	@Override
	public int insertMessage(MessageVO vo) {
		return messageDao.insertMessage(vo);
	}

	@Override
	public List<MessageVO> selectAll() {
		return messageDao.selectAll();
	}

	@Override
	public MessageVO selectByNo(int no) {
		return messageDao.selectByNo(no);
	}

	@Override
	public int deleteMessage(int no) {
		return messageDao.deleteMessage(no);
	}

	@Override
	public boolean checkPwd(int no, String pwd) {
		String dbPwd = messageDao.selectPwd(no);
		boolean result = false;
		if(pwd.equals(dbPwd)) {
			result = true;
		}
		return result;
	}
	
}
