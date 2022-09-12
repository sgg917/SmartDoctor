package com.fp.smartDoctor.attendance.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;

public interface AttendanceService {
	
	// 근태 총 개수 조회용 메소드
	int selectListCount(Attendance a);
	
	// 근태 리스트 조회용 메소드
	ArrayList<Attendance> selectAttendance(PageInfo pi, Attendance a);
	
	// 오늘 출근 시간 조회용 메소드
	String selectStartTime(int empNo);
	
	// 오늘 퇴근 시간 조회용  메소드
	String selectEndTime(int empNo);
	
	// 출근 insert 메소드(insert)
	int insertAttendance(int empNo);
	
	// 퇴근 + 근태상태 update 메소드
	int endAttendance(int empNo);
	
	// 휴가 총 개수 조회용 메소드
	int selectVacListCount(int empNo);
	
	// 휴가 리스트 조회용 메소드
	ArrayList<Vacation> selectVacationList(PageInfo pi, int empNo);
	
	// 연차 잔여일수 조회용 메소드
	int selectVacRemain(int empNo);
}
