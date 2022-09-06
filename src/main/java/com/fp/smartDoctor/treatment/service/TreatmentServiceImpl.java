package com.fp.smartDoctor.treatment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.treatment.dao.TreatmentDao;



public class TreatmentServiceImpl implements TreatmentService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TreatmentDao tDao;

}
