package com.fp.smartDoctor.attendance.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.attendance.dao.AttendanceDao;
import org.springframework.stereotype.Service;

public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private AttendanceDao aDao;

}
