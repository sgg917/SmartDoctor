package com.fp.smartDoctor.attendance.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;

public interface AttendanceService {
	
	// 근태 총 개수 조회용 메소드
	int selectListCount(Attendance a);
	
	// 근태 목록 조회용 메소드
	ArrayList<Attendance> selectAttendance(PageInfo pi, Attendance a);
	
}
