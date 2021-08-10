package com.it.ez.calendar.model;

import java.util.List;

public interface CalendarService {
	public List<CalendarVO> selectAll();
	int insertSch(CalendarVO vo);
	int insertModal(CalendarVO vo);
	int updateCal(CalendarVO vo);
	CalendarVO selectBySchNo(int schNo);
	int delCal(int schNo);
	int insertColor(int schNo);
}
