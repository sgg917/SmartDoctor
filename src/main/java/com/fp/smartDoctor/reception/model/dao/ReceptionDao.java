package com.fp.smartDoctor.reception.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ReceptionDao {

	// 1. 전체 환자 수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("receptionMapper.selectListCount");
	}
	
	// 2. 전체 환자 리스트 조회
	public ArrayList<Patient> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit); // offset만큼 건너뛰고 limit만큼 조회하겠다.
		
		return (ArrayList)sqlSession.selectList("receptionMapper.selectList", null, rowBounds); // 부모클래스인 list로 반환해주기때문에 다운캐스팅 필요
	}
	
	// 3. 환자 등록
	public int insertPatient(SqlSessionTemplate sqlSession, Patient p) {
		return sqlSession.insert("receptionMapper.insertPatient", p);
	}
	
	// 4. 환자 선택
	public Patient selectPatient(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.selectOne("receptionMapper.selectPatient", chartNo);
	}
	
	// 5. 진료과 조회
	public ArrayList<Dept> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectDeptList");
	}
	
	// 6. 의사 조회
	public ArrayList<Member> selectProfList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectProfList");
	}
	
	// 7. 진료 등록
	public int insertTreatment(SqlSessionTemplate sqlSession, Clinic c) {
		return sqlSession.insert("receptionMapper.insertTreatment", c);
	}
	
	// 8. 진료 대기 환자 리스트 조회
	public ArrayList<Clinic> ajaxSelectWaitingPatient(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.ajaxSelectWaitingPatient");
	}
	
	// 9. 진료 중 환자 조회
	public ArrayList<Clinic> ajaxSelectIngPatient(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.ajaxSelectIngPatient");
	}
	
	// 10. 진료 상태 변경
	public int ajaxChangePatientStatus(SqlSessionTemplate sqlSession, int changeChartNo) {
		return sqlSession.update("receptionMapper.ajaxChangePatientStatus", changeChartNo);
	}
	
	// 11. 수술실 예약 대기 환자 리스트 조회
	public ArrayList<Clinic> ajaxSurgeryWaitingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.ajaxSurgeryWaitingList");
	}
	
	// 12. 입원실 예약 대기 환자 리스트 조회
	public ArrayList<Clinic> ajaxPRoomWaitingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.ajaxPRoomWaitingList");
	}
	
	// 13. 예약 완료 후 surgery 상태 변경
	public int ajaxUpdateClinicSurgery(SqlSessionTemplate sqlSession, int clinicNo) {
		return sqlSession.update("receptionMapper.ajaxUpdateClinicSurgery", clinicNo);
	}
	
	// 14. 예약 완료 후 enter 상태 변경
	public int ajaxUpdateClinicEnter(SqlSessionTemplate sqlSession, int clinicNo) {
		return sqlSession.update("receptionMapper.ajaxUpdateClinicEnter", clinicNo);
	}
	
	// 15. 환자 과거 진료 내역 리스트 조회
	public ArrayList<Clinic> pastClinicList(SqlSessionTemplate sqlSession, PageInfo pi, int chartNo) {
		
		int offset =  (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("receptionMapper.pastClinicList", chartNo, rowBounds);
	}
	// 16. 환자 과거 진료 내역 수 조회
	public int pastClinicListCount(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.selectOne("receptionMapper.pastClinicListCount", chartNo);
	}
	
	// 17. 처방전 -> 진료 정보 조회
	public Prescription selectPrescription(SqlSessionTemplate sqlSession, int clinicNo) {
		return sqlSession.selectOne("receptionMapper.selectPrescription", clinicNo);
	}
	
	// 18. 처방전 -> 약 정보 리스트 조회
	public ArrayList<Medicine> selectMedicineList(SqlSessionTemplate sqlSession, int clinicNo) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectMedicineList", clinicNo);
	}
	
	// 19. 수납 영수증 조회
	public Receipt selectReceipt(SqlSessionTemplate sqlSession, int clinicNo) {
		return sqlSession.selectOne("receptionMapper.selectReceipt", clinicNo);
	}
	
	// 20. 입원실 출력용 날짜 조회
	public ArrayList<ProomCalendar> selectDateList(SqlSessionTemplate sqlSession, String nowDate) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectDateList", nowDate);
	}
	
	// 21. 입원실 출력용 입원실 리스트 조회
	public ArrayList<ProomCalendar> selectPRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectPRoomList");
	}
	
	// 21. 입원실 출력용 입원실 예약 리스트 조회
	public ArrayList<ProomCalendar> selectPRoomBookingList(SqlSessionTemplate sqlSession, String nowDate) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectPRoomBookingList", nowDate);
	}
	
	// 22. 검색된 환자 카운트
	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("receptionMapper.selectSearchCount", keyword);
	}
	
	// 23. 검색된 환자 리스트
	public ArrayList<Patient> selectSearchList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("receptionMapper.selectSearchList", keyword, rowBounds);
		
	}
	
	// 24. 진료 접수 후 환자 상태 변경
	public int updatePatientLastDept(SqlSessionTemplate sqlSession, Clinic c) {
		return sqlSession.update("receptionMapper.updatePatientLastDept", c);
	}
	
	// 25. 수납 대기 리스트
	public ArrayList<Pay> selectPayWaitingList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("receptionMapper.selectPayWaitingList");
		
	}
}
