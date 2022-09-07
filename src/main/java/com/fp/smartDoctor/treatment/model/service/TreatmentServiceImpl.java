package com.fp.smartDoctor.treatment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.treatment.model.dao.TreatmentDao;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;



public class TreatmentServiceImpl implements TreatmentService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TreatmentDao tDao;
	
	@Override
	public int insertOP(RevOProom op) {
		return tDao.insertOP(sqlSession, op);
	}
	@Override
	public RevOProom selectRevOProom(int bookingNo) {
		return null;
	}
	@Override
	public int deleteRevOProom(int bookingNo) {
		return 0;
	}
	@Override
	public int updateRevOProom(RevOProom op) {
		return 0;
	}

}
