package com.fp.smartDoctor.reception.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.reception.model.dao.ReceptionDao;
import com.fp.smartDoctor.reception.model.vo.Prescription;
import com.fp.smartDoctor.reception.model.vo.ProomCalendar;
import com.fp.smartDoctor.reception.model.vo.Receipt;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.Pay;

@Service
public class ReceptionServiceImpl implements ReceptionService{
	
	@Autowired
	private ReceptionDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 1. 전체 환자 수 조회
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	// 2. 전체 환자 리스트 조회
	@Override
	public ArrayList<Patient> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}
	
	// 3. 환자 등록
	@Override
	public int insertPatient(Patient p) {
		return rDao.insertPatient(sqlSession, p);
	}
	
	// 4. 환자 선택
	@Override
	public Patient selectPatient(int chartNo) {
		return rDao.selectPatient(sqlSession, chartNo);
	}
	
	// 5. 진료과 조회
	@Override
	public ArrayList<Dept> selectDeptList() {
		return rDao.selectDeptList(sqlSession);
	}
	
	// 6. 의사 조회
	@Override
	public ArrayList<Member> selectProfList() {
		return rDao.selectProfList(sqlSession);
	}

	// 7. 진료 등록
	@Override
	public int insertTreatment(Clinic c) {
		return rDao.insertTreatment(sqlSession, c);
	}

	// 8. 진료 대기 환자 리스트 조회
	@Override
	public ArrayList<Clinic> ajaxSelectWaitingPatient() {
		return rDao.ajaxSelectWaitingPatient(sqlSession);
	}

	// 9. 진료 중 환자 조회
	@Override
	public ArrayList<Clinic> ajaxSelectIngPatient() {
		return rDao.ajaxSelectIngPatient(sqlSession);
	}
	
	// 10. 진료 상태 변경
	@Override
	public int ajaxChangePatientStatus(int changeChartNo) {
		return rDao.ajaxChangePatientStatus(sqlSession, changeChartNo);
	}
	
	// 11. 수술실 예약 대기 환자 리스트 조회
	@Override
	public ArrayList<Clinic> ajaxSurgeryWaitingList() {
		return rDao.ajaxSurgeryWaitingList(sqlSession);
	}

	// 12. 입원실 예약 대기 환자 리스트 조회
	@Override
	public ArrayList<Clinic> ajaxPRoomWaitingList() {
		return rDao.ajaxPRoomWaitingList(sqlSession);
	}
	
	// 13. 예약 완료 후 surgery 상태 변경
	@Override
	public int ajaxUpdateClinicSurgery(int clinicNo) {
		return rDao.ajaxUpdateClinicSurgery(sqlSession, clinicNo);
	}
	
	// 14. 예약 완료 후 enter 상태 변경
	@Override
	public int ajaxUpdateClinicEnter(int clinicNo) {
		return rDao.ajaxUpdateClinicEnter(sqlSession, clinicNo);
	}
	
	// 15. 환자 과거 진료 내역 리스트 조회
	@Override
	public ArrayList<Clinic> pastClinicList(PageInfo pi, int chartNo) {
		return rDao.pastClinicList(sqlSession, pi, chartNo);
	}
	
	// 16. 환자 과거 진료 내역 수 조회
	@Override
	public int pastClinicListCount(int chartNo) {
		return rDao.pastClinicListCount(sqlSession, chartNo);
	}

	// 17. 처방전 -> 진료 정보 조회
	@Override
	public Prescription selectPrescription(int clinicNo) {
		return rDao.selectPrescription(sqlSession, clinicNo);
	}
	
	// 18. 처방전 -> 약 정보 리스트 조회
	@Override
	public ArrayList<Medicine> selectMedicineList(int clinicNo) {
		return rDao.selectMedicineList(sqlSession, clinicNo);
	}
	
	// 19. 수납 영수증 조회
	@Override
	public Receipt selectReceipt(int clinicNo) {
		return rDao.selectReceipt(sqlSession, clinicNo);
	}

	@Override
	public ArrayList<ProomCalendar> selectDateList(String nowDate) {
		return rDao.selectDateList(sqlSession, nowDate);
	}

	@Override
	public ArrayList<ProomCalendar> selectPRoomList() {
		return rDao.selectPRoomList(sqlSession);
	}

	@Override
	public ArrayList<ProomCalendar> selectPRoomBookingList(String nowDate) {
		return rDao.selectPRoomBookingList(sqlSession, nowDate);
	}
	
	// 검색된 환자 카운트
	@Override
	public int selectSearchCount(String keyword) {
		return rDao.selectSearchCount(sqlSession, keyword);
	}

	// 검색된 환자 리스트
	@Override
	public ArrayList<Patient> selectSearchList(String keyword, PageInfo pi) {
		return rDao.selectSearchList(sqlSession, keyword, pi);
	}
	
	// 24. 진료 접수 후 환자 상태 변경
	@Override
	public int updatePatientLastDept(Clinic c) {
		return rDao.updatePatientLastDept(sqlSession, c);
	}
	
	// 25. 수납 대기 리스트
	@Override
	public ArrayList<Pay> selectPayWaitingList() {
		return rDao.selectPayWaitingList(sqlSession);
	}
	
	// 26. 수납 완료 카운트
	@Override
	public int selectPayDoneCount() {
		return rDao.selectPayDoneCount(sqlSession);
	}
	
	// 27. 수납 완료 리스트
	@Override
	public ArrayList<Pay> selectPayDoneList(PageInfo pi) {
		return rDao.selectPayDoneList(sqlSession, pi);
	}

	// 28. 수납 상태 변경
	@Override
	public int ajaxChangePayStatus(int changePayNo) {
		return rDao.ajaxChangePayStatus(sqlSession, changePayNo);
	}
	
	// 29. 환자 정보 변경
	@Override
	public int updatePatient(Patient p) {
		return rDao.updatePatient(sqlSession, p);
	}
	
	// 30. 선택한 과로 대기 리스트 조회
	@Override
	public ArrayList<Clinic> ajaxWaitingListDeptCondition(String deptNo) {
		return rDao.ajaxWaitingListDeptCondition(sqlSession, deptNo);
	}
	
	// 31. 선택한 과로 진료중 리스트 조회
	@Override
	public ArrayList<Clinic> ajaxIngListDeptCondition(String deptNo) {
		return rDao.ajaxIngListDeptCondition(sqlSession, deptNo);
	}
	
}
