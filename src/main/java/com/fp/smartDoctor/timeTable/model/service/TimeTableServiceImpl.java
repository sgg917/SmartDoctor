package com.fp.smartDoctor.timeTable.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.timeTable.model.dao.TimeTableDao;



public class TimeTableServiceImpl implements TimeTableService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TimeTableDao ttDao;

}
