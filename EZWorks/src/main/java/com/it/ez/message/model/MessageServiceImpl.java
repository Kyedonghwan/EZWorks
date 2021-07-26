package com.it.ez.message.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.message.common.SearchVO;

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


	@Override
	public List<MessageVO> selectAll(SearchVO searchVo) {
		return messageDao.selectAll(searchVo);
	}


	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return messageDao.selectTotalRecord(searchVo);
	}


	@Override
	public int updateMessage(MessageVO vo) {
		return messageDao.updateMessage(vo);
	}
	
}
