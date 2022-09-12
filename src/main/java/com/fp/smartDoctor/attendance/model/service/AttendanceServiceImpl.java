package com.fp.smartDoctor.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.attendance.model.dao.AttendanceDao;
import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private AttendanceDao aDao;
	
	
	@Override
	public int selectListCount(Attendance a) {
		return aDao.selectListCount(sqlSession, a);
	}
	
	@Override
	public ArrayList<Attendance> selectAttendance(PageInfo pi, Attendance a) {
		return aDao.selectAttendance(sqlSession, pi, a);
	}

	@Override
	public int insertAttendance(int empNo) {
		return aDao.insertAttendance(sqlSession, empNo);
	}

	@Override
	public String selectStartTime(int empNo) {
		return aDao.selectStartTime(sqlSession, empNo);
	}
	
	@Override
	public String selectEndTime(int empNo) {
		return aDao.selectEndTime(sqlSession, empNo);
	}

	@Override
	public int endAttendance(int empNo) {
		return aDao.endAttendance(sqlSession, empNo);
	}

}
