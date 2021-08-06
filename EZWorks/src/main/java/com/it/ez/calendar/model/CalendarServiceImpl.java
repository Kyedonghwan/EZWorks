package com.it.ez.calendar.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService{
	private final CalendarDAO calendarDao;
	
	@Override
	public List<CalendarVO> selectAll() {
		return calendarDao.selectAll();
	}

	@Override
	public int insertSch(CalendarVO vo) {
		return calendarDao.insertSch(vo);
	}

	@Override
	public int insertModal(CalendarVO vo) {
		return calendarDao.insertModal(vo);
	}

	@Override
	public int updateCal(CalendarVO vo) {
		return calendarDao.updateCal(vo);
	}

	@Override
	public CalendarVO selectBySchNo(int schNo) {
		return calendarDao.selectBySchNo(schNo);
	}

	@Override
	public int delCal(int schNo) {
		return calendarDao.delCal(schNo);
	}

	@Override
	public int insertColor(int schNo) {
		return calendarDao.insertColor(schNo);
	}
}
