package com.fp.smartDoctor.treatment.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;

@Repository
public class TreatmentDao {

	
	//수술실 예약 상세조회
	public Clinic selectRevOProom(SqlSessionTemplate sqlSession,int bookingNo) {
		return sqlSession.selectOne("treatmentMapper.selectOProom", bookingNo);
	}
	
	//수술실 예약을 위한 정보조회
	public Clinic selectforInsertRevOP(SqlSessionTemplate sqlSession, int clinicNo) {
		//ListSurgeryBooking list  = new ListSurgeryBooking();
		
		Clinic c = sqlSession.selectOne("treatmentMapper.forinsertOProom",clinicNo);
		return c;
	}
	
	
	
	//수술실 예약 풀캘린더 정보 조회
	public List<RevOProom> getCalendar(SqlSessionTemplate sqlSession)  {
		List<RevOProom> calendar = sqlSession.selectList("treatmentMapper.calendarList");
		return calendar;
	}
	
	//수술실 중복 체크
	/*
	public int checkOverlapRsv(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.selectOne("treatmentMapper.checkOverlapRsv", paraMap);
	}
	*/
	
	//수술실 시간 중복 방지
	public ArrayList<Clinic> blockOverlap(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectOverlap", map);
	}
	
	//수술실 예약(insert)
	public int insertReservation(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.insert("treatmentMapper.insertReservation", paraMap);
	}
	
	//수술실 예약 취소
	public int cslRsvOP(SqlSessionTemplate sqlSession, int bookingNo) {
		return sqlSession.update("treatmentMapper.rsvCancel",bookingNo);
	}
	
	// 진료중인 환자 조회
	public Patient selectNowPatient(SqlSessionTemplate sqlSession, Patient p) {
		return sqlSession.selectOne("treatmentMapper.selectNowPatient", p);
	}
	
	// 진료할 환자의 과거 내역 조회
	public ArrayList<Clinic> selectPatientInto(SqlSessionTemplate sqlSession, int chartNo) {
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectPatientInfo", chartNo);
	}
	
	// 질병 리스트 조회
	public ArrayList<Disease> selectDiseaseList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectDiseaseList");
	}
	
	// 수술 전체 리스트 조회
	public ArrayList<Surgery> selectSurgeryList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectSurgeryList");
	}
	
	
	public ArrayList<Medicine> selectMedList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectMedList");
	}
}