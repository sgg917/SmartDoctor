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
	public int selectListCount(int no) {
		return aDao.selectListCount(sqlSession, no);
	}
	
	@Override
	public ArrayList<Attendance> selectAttendance(PageInfo pi, int no) {
		return aDao.selectAttendance(sqlSession, pi, no);
	}

}
