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

}
