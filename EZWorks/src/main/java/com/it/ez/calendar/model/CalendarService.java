package com.it.ez.calendar.model;

import java.util.List;

public interface CalendarService {
	public List<CalendarVO> selectAll();
	int insertSch(CalendarVO vo);
}
