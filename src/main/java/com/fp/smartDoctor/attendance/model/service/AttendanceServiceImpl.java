package com.fp.smartDoctor.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.attendance.model.dao.AttendanceDao;

public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private AttendanceDao aDao;

}
