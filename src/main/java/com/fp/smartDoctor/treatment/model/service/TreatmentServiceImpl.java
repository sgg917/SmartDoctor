package com.fp.smartDoctor.treatment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.treatment.model.dao.TreatmentDao;
import com.fp.smartDoctor.treatment.model.vo.ListSurgeryBooking;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;


@Service
public class TreatmentServiceImpl implements TreatmentService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TreatmentDao tDao;
	
	
	
	//수술예약 상세조회 서비스(select)
	@Override
	public ArrayList<ListSurgeryBooking> selectRevOProom(int bookingNo) {
		return tDao.selectRevOProom(sqlSession, bookingNo);
	}
	
	//수술예약 상세조회 서비스(select)
	@Override
	public  ArrayList<ListSurgeryBooking> selectforInsertRevOP(int bookingNo) {
		return tDao.selectforInsertRevOP(sqlSession, bookingNo);
	}
	
	// 수술실 캘린더 조회
	@Override
	public List<RevOProom> getCalendar() {
		return tDao.getCalendar(sqlSession);
	}

	//입력받은 날짜 중복여부 체크
	@Override
	public int checkOverlapRsv(HashMap<String, String> paraMap) {
		return tDao.checkOverlapRsv(sqlSession, paraMap);
	}

	//수술실 예약
	@Override
	public int insertReservation(HashMap<String, String> paraMap) {
		return tDao.insertReservation(sqlSession, paraMap);
	}

	//수술실 예약 취소
	@Override
	public int rsvCancel(HashMap<String, String> paraMap) {
		return tDao.rsvCancel(sqlSession, paraMap);
	}

	//수술실 예약 업데이트
	@Override
	public int updateRevOProom(RevOProom op) {
		return 0;
	}

	// 진료중인 환자 조회
	@Override
	public Patient selectNowPatient(Patient p) {
		Patient nowPatient = tDao.selectNowPatient(sqlSession, p);
		return nowPatient;
	}
	
	
	

}
