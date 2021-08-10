package com.it.ez.attendance.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.ez.attendance.common.AttendanceMonthCalculator;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService{
	private final AttendanceDAO attendanceDao;
	private final AttendanceMonthCalculator monthCal;

	@Override
	public List<AttendanceVO> selectByDate(Map<String, Object> map) {
		return attendanceDao.selectByDate(map);
	}

	@Override
	public int insertAttendance(AttendanceVO vo) {
		return attendanceDao.insertAttendance(vo);
	}

	@Override
	public List<List<AttendanceMainViewVO>> getDaysListFullDetail(int year, int month, int empNo){
		String date = monthCal.getStartingyyyyMMdd(year, month);
		String splitDate[] = date.split("-");
		int nYear = Integer.parseInt(splitDate[0]);
		int nMonth = Integer.parseInt(splitDate[1]);
		int nDate = Integer.parseInt(splitDate[2]);
		Calendar calendar = Calendar.getInstance(Locale.KOREA);
		calendar.set(nYear, nMonth-1, nDate);
		List<List<AttendanceMainViewVO>> monthListFullDetail = new ArrayList<>();
		Date d = new Date();
		int weeks = monthCal.getTotalWeeks(year, month);
		for(int i=0;i<weeks;i++) {
			List<AttendanceMainViewVO> weekList = new ArrayList<>();
			for(int j=0;j<7;j++) {
				d= new Date(calendar.getTimeInMillis());
				int searchStartYear = calendar.get(Calendar.YEAR);
				int searchStartMonth = calendar.get(Calendar.MONTH)+1;
				int searchStartDate = calendar.get(Calendar.DATE);
				int monthmaxdate = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
				String startingDate = searchStartYear+"-"+searchStartMonth+"-"+searchStartDate;
				if(searchStartDate==monthmaxdate) {
					if(searchStartMonth==12) {
						searchStartYear += 1;
						searchStartMonth = 1;
					}else {
						searchStartMonth += 1;
					}
					searchStartDate = 1;
				}else {
					searchStartDate += 1;
				}
				String endingDate = searchStartYear+"-"+searchStartMonth+"-"+(searchStartDate);
				Map<String, Object> searchMap = new HashMap<>();
				searchMap.put("startingDate", startingDate);
				searchMap.put("endingDate", endingDate);
				searchMap.put("empNo", empNo);
				
				List<AttendanceVO> daySearchList = attendanceDao.selectByDate(searchMap);
				AttendanceMainViewVO vo = new AttendanceMainViewVO();
				vo.setForCalendar(d);
				vo.setAttendanceVosInADay(daySearchList);
				weekList.add(vo);
				calendar.add(Calendar.DATE, 1);
				if(weekList.size()==7) {
					monthListFullDetail.add(weekList);
				}
			}
		}
		return monthListFullDetail;
	}

	@Override
	public int isAttended(String startingDate, String endingDate, int empNo) {
		return attendanceDao.isAttended(startingDate, endingDate, empNo);
	}

	@Override
	public int isEnded(String startingDate, String endingDate, int empNo) {
		return attendanceDao.isEnded(startingDate, endingDate, empNo);
	}

	@Override
	public AttendanceVO todayAttendTime(String startingDate, String endingDate, int empNo) {
		return attendanceDao.todayAttendTime(startingDate, endingDate, empNo);
	}

	@Override
	public AttendanceVO todayEndTime(String startingDate, String endingDate, int empNo) {
		return attendanceDao.todayEndTime(startingDate, endingDate, empNo);
	}
}
