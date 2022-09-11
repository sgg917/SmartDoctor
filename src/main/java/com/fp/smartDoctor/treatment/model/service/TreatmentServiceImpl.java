package com.fp.smartDoctor.treatment.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.treatment.model.dao.TreatmentDao;
import com.fp.smartDoctor.treatment.model.vo.Calendar;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;


@Service
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
	@Override
	public List<RevOProom> getCalendar() {
		return tDao.getCalendar(sqlSession);
	}
	
	

}
