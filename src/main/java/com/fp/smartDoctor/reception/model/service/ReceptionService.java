package com.fp.smartDoctor.reception.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.reception.model.vo.Prescription;
import com.fp.smartDoctor.reception.model.vo.ProomCalendar;
import com.fp.smartDoctor.reception.model.vo.Receipt;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.Pay;

public interface ReceptionService {
	
	// 1. 전체 환자 수 조회
	int selectListCount();
	
	// 2. 전체 환자 리스트 조회
	ArrayList<Patient> selectList(PageInfo pi);
	
	// 3. 환자 등록
	int insertPatient(Patient p);
	
	// 4. 환자 선택
	Patient selectPatient(int chartNo);
	
	// 5. 진료과 조회
	ArrayList<Dept> selectDeptList();
	
	// 6. 의사 조회
	ArrayList<Member> selectProfList();
	
	// 7. 진료 등록
	int insertTreatment(Clinic c);
	
	// 8. 진료 대기 환자 리스트 조회
	ArrayList<Clinic> ajaxSelectWaitingPatient();
	
	// 9. 진료 중 환자 조회
	ArrayList<Clinic> ajaxSelectIngPatient();
	
	// 10. 진료 상태 변경
	int ajaxChangePatientStatus(int changeChartNo);
	
	// 11. 수술실 예약 대기 환자 리스트 조회
	ArrayList<Clinic> ajaxSurgeryWaitingList();
	
	// 12. 입원실 예약 대기 환자 리스트 조회
	ArrayList<Clinic> ajaxPRoomWaitingList();

	// 13. 예약 완료 후 surgery 상태 변경
	int ajaxUpdateClinicSurgery(int clinicNo);
	
	// 14. 예약 완료 후 enter 상태 변경
	int ajaxUpdateClinicEnter(int clinicNo);
	
	// 15. 환자 과거 진료 내역 리스트 조회
	ArrayList<Clinic> pastClinicList(PageInfo pi, int chartNo);
	
	// 16. 환자 과거 진료 내역 수 조회
	int pastClinicListCount(int chartNo);
	
	// 17. 처방전 -> 진료 정보 조회
	Prescription selectPrescription(int clinicNo);
	
	// 18. 처방전 -> 약 정보 리스트 조회
	ArrayList<Medicine> selectMedicineList(int clinicNo);
	
	// 19. 수납 영수증 조회
	Receipt selectReceipt(int clinicNo);
	
	// 20. 입원실 출력용 날짜 조회
	ArrayList<ProomCalendar> selectDateList(String nowDate);
	
	// 21. 입원실 출력용 입원실 리스트 조회
	ArrayList<ProomCalendar> selectPRoomList();
	
	// 22. 입원실 출력용 입원실 예약 리스트 조회
	ArrayList<ProomCalendar> selectPRoomBookingList(String nowDate);
	
	// 23. 환자 검색
	int selectSearchCount(String keyword);
	ArrayList<Patient> selectSearchList(String keyword, PageInfo pi);
	
	// 24. 진료 접수 후 환자 상태 변경
	int updatePatientLastDept(Clinic c);
	
	// 25.수납 대기 환자 검색
	ArrayList<Pay> selectPayWaitingList();
}
