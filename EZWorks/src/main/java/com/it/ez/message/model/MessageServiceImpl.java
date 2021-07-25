package com.it.ez.message.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.ez.message.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private static final Logger logger=LoggerFactory.getLogger(MessageServiceImpl.class);
	
	private final MessageDAO messageDao;

	@Override
	public int insertMessage(MessageSendVO vo) {
		return messageDao.insertMessage(vo);
	}

	@Override
	public List<MessageSendVO> sentAll(SearchVO searchVo) {
		return messageDao.sentAll(searchVo);
	}

	@Override
	public int deleteMessage(int messageNo) {
		logger.info("쪽지 삭제, messageNo={}",messageNo);
		int cnt=messageDao.deleteMessage(messageNo);
		logger.info("쪽지 삭제 결과, cnt={}",cnt);
		return cnt;
	}

	@Override
	public int sentCount(SearchVO searchVo) {
		return messageDao.sentCount(searchVo);
	}

	@Override
	public int receiveCount(SearchVO searchVo) {
		return messageDao.receiveCount(searchVo);
	}

	@Override
	public MessageSendVO sentByMessageNo(int messageNo) {
		return messageDao.sentByMessageNo(messageNo);
	}

	@Override
	public int editMessage(MessageSendVO vo) {
		return messageDao.editMessage(vo);
	}

	@Override
	public MessageReceiveVO receiveByMessageNo(int messageNo) {
		return messageDao.receiveByMessageNo(messageNo);
	}

	@Override
	public int insertReceiveMessage(MessageReceiveVO vo) {
		return messageDao.insertReceiveMessage(vo);
	}

	@Override
	public int deleteReceiveMessage(int messageNo) {
		return messageDao.deleteReceiveMessage(messageNo);
	}

	@Override
	@Transactional
	public int deleteMessageMulti(List<MessageSendVO> list) {
		logger.info("deleteMessageMulti list.size={}",list.size());
		int cnt=0;
		try {
			for(MessageSendVO vo : list) {
				int messageNo=vo.getMessageNo();
				logger.info("메시지 다중 삭제 messageNo={}",messageNo);
				if(messageNo!=0) {  
					logger.info("메시지 다중 삭제, messageNo={}",messageNo);
					cnt=messageDao.deleteReceiveMessage(messageNo);
					cnt=messageDao.deleteMessage(messageNo);
					logger.info("메시지 다중 삭제 cnt={}",cnt);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		logger.info("cnt={}",cnt);
		return cnt;
	}

	@Override
	public List<MessageReceiveVO> receiveAll(SearchVO searchVo) {
		return messageDao.receiveAll(searchVo);
	}

	@Override
	public int editReceiveMessage(MessageReceiveVO vo) {
		return messageDao.editReceiveMessage(vo);
	}

	@Override
	public List<MessageSendVO> receiveMessage(SearchVO searchVo) {
		return messageDao.receiveMessage(searchVo);
	}

	@Override
	public int totalReceive(SearchVO searchVo) {
		return messageDao.totalReceive(searchVo);
	}

	
}
