package com.fp.smartDoctor.treatment.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.treatment.model.dao.TreatmentDao;
import com.fp.smartDoctor.treatment.model.vo.ListSurgeryBooking;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;


@Service
public class TreatmentServiceImpl implements TreatmentService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TreatmentDao tDao;
	
	
	@Override
	public ListSurgeryBooking selectRevOProom(int bookingNo) {
		return tDao.selectRevOProom(sqlSession, bookingNo);
	}
	
	@Override
	public List<RevOProom> getCalendar() {
		return tDao.getCalendar(sqlSession);
	}

	@Override
	public int checkOverlapRsv(HashMap<String, String> paraMap) {
		return 0;
	}

	@Override
	public int insertReservation(HashMap<String, String> paraMap) {
		return 0;
	}

	@Override
	public int rsvCancel(HashMap<String, String> paraMap) {
		return 0;
	}

	@Override
	public int updateRevOProom(RevOProom op) {
		return 0;
	}
	
	

}
