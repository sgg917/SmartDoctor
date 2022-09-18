package com.fp.smartDoctor.treatment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;

public interface TreatmentService {
	
	
	//수술예약 상세조회 서비스(select)
	Clinic selectRevOProom(int bookingNo);
	
	//수술예약을 위한 기본정보 조회 서비스(select)
	Clinic selectforInsertRevOP(int clinicNo);
	
	// 입력받은 일시가 중복된 날짜인지 검사
	//int checkOverlapRsv(HashMap<String, String> paraMap);
	
	//중복을 막기위한 조회
	ArrayList<Clinic> blockOverlap(HashMap<String, String> map);
	
	//수술실 예약하기(insert)
	int insertReservation(HashMap<String, String> paraMap);
	
	//예약 상세보기
	//Reservation readDetailRsvList(String reserveNo);
	
	//예약 취소하기
	int cslRsvOP(int bookingNo);
	
	//수술예약 수정 서비스
	int updateRevOProom(RevOProom op);
	
	//수술예약 풀캘린더
	//List<Calendar> getCalendar();
	
	//수술예약 풀캘린더
	List<RevOProom> getCalendar();
	
	// 진료중인 환자 조회
	Patient selectNowPatient(Patient p);
	
	// 진료할 환자의 과거 내역 조회
	ArrayList<Clinic> selectPatientInfo(String chartNo);
	
	// 질병 전체 리스트 조회
	ArrayList<Disease> selectDiseaseList();
	
	// 수술 전체 리스트 조회
	ArrayList<Surgery> selectSurgeryList();
	
	// 약 전체 리스트 조회
	ArrayList<Medicine> selectMedList();
}
