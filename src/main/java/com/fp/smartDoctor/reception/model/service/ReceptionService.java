package com.fp.smartDoctor.reception.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Patient;

public interface ReceptionService {
	
	// 1. 환자 리스트 조회
	int selectListCount();
	ArrayList<Patient> selectList(PageInfo pi);
	
	// 2. 환자 등록
	int insertPatient(Patient p);
	
	// 3. 환자 선택
	Patient selectPatient(int chartNo);
	
	// 4. 진료과 조회
	ArrayList<Dept> selectDeptList();
	
	// 5. 의사 조회
	ArrayList<Member> selectProfList();
	
	// 6. 진료 등록
	int insertTreatment(Clinic c);
	
	// 7. 진료 대기 환자 조회
	ArrayList<Clinic> ajaxSelectWaitingPatient();
	
	// 8. 진료 중 환자 조회
	ArrayList<Clinic> ajaxSelectIngPatient();
	
	// 9. 진료 상태 변경
	int ajaxChangePatientStatus(int changeChartNo);
	
	// 10. 수술실 예약 대기 환자 조회
	ArrayList<Clinic> ajaxSurgeryWaitingList();
	
	// 11. 입원실 예약 대기 환자 조회
	ArrayList<Clinic> ajaxPRoomWaitingList();

}
