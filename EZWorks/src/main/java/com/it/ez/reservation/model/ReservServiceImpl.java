package com.it.ez.reservation.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.reservDt.model.ReservDtVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservServiceImpl implements ReservService {
	private final ReservDAO reservDao;
	
	@Override
	public ReservVO selectResrvById(int rvNo) {
		return reservDao.selectResrvById(rvNo);
	}

	@Override
	public int insertReserv(ReservationVO vo) {
		return reservDao.insertReserv(vo);
	}

	@Override
	public List<ReservDtVO> showReservCate(int rvdCate) {
		return reservDao.showReservCate(rvdCate);
	}

	@Override
	public List<ReservationVO> showReservList() {
		return reservDao.showReservList();
	}

	@Override
	public List<reservViewVO> selectResrvAll() {
		return reservDao.selectResrvAll();
	}

	@Override
	public int deleteResev(int no) {
		return reservDao.deleteResev(no);
	}

	@Override
	public ReservationVO selectReservationById(int no) {
		return reservDao.selectReservationById(no);
	}

	@Override
	public reservViewVO selectResrvViewById(int no) {
		return reservDao.selectResrvViewById(no);
	}

	@Override
	public int updateReservation(ReservationVO vo) {
		return reservDao.updateReservation(vo);
	}

	@Override
	public int updateReserv(ReservVO vo) {
		return reservDao.updateReserv(vo);
	}

}
