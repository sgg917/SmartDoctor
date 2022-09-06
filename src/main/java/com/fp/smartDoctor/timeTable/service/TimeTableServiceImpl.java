package com.fp.smartDoctor.timeTable.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.timeTable.dao.TimeTableDao;



public class TimeTableServiceImpl implements TimeTableService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TimeTableDao tDao;

}
