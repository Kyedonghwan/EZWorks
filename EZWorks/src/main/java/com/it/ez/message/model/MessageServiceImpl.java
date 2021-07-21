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
	
}
