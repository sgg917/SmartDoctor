package com.fp.smartDoctor.sign.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Line;
import com.fp.smartDoctor.sign.model.vo.Overtime;
import com.fp.smartDoctor.sign.model.vo.Sign;

public interface SignService {
	
	// 관리자_결재양식조회
	int selectListCount();
	ArrayList<Form> selectFormList(PageInfo pi);
	
	// 관리자_결재양식 상세조회
	Form selectFormDetail(int formNo);
	
	// 관리자_결재양식 수정
	int updateForm(Form f);
	
	// 관리자_결재양식 추가
	int insertForm(Form f);
	
	// 관리자_결재양식 삭제
	int deleteForm(int formNo);
	
	
	/*-------- 사용자 -----------*/
	
	// 사용자_결재양식선택 리스트 조회 (ajax)
	ArrayList<Form> selectApprFormList();
	
	// 사용자_결재양식 불러오기 (ajax)
	Form selectApprFormDetail(int formNo);
	
	// 사용자_결재라인 조직도 조회 (ajax)
	ArrayList<Member> selectApprLineList();
	
	// 사용자_결재라인 조직도 부서 조회 (ajax)
	ArrayList<Dept> selectApprLineDept();
	
	// 사용자_결재라인 사원 조회 (ajax)
	Member selectApprEmp(int empNo);
	
	// 사용자_결재대기함 페이지
	int selectApprListCount(String empNo);
	ArrayList<Sign> selectApprStandbyList(PageInfo pi, String empNo);
	
	// 사용자_결재요청(상신)
	int insertLine(ArrayList<Line> lineList);
	int insertRef(ArrayList<Line> refList);
	int insertAppr(Sign s);
	
	// 사용자_참조문서함 페이지
	int selectReferListCount(String empNo);
	ArrayList<Sign> selectApprReferList(PageInfo pi, String empNo);
	
	// 사용자_참조문서함 상세조회
	ArrayList<Line> selectApprRef(int apprNo);
	ArrayList<Line> selectApprLine(int apprNo);
	Sign selectApprReferDetail(int apprNo);
	
	// 사용자_기안문서함 페이지
	int selectReportListCount(String empNo);
	ArrayList<Sign> selectApprReportList(PageInfo pi, String empNo);
	
	// 사용자_기안문서함 상세조회
	ArrayList<Line> selectLineComment(int apprNo);
	Sign selectApprReportDetail(int apprNo);
	Overtime selectOvertime(int apprNo);
	Vacation selectVacation(int apprNo);
	
	// 사용자_결재문서함 리스트 조회
	int selectGetListCount(String empNo);
	ArrayList<Sign> selectApprGetList(PageInfo pi, String empNo);
	
	// 사용자_결재문서함 상세조회
	Line selectLineLevel(HashMap<String, Object> map);
	
	// 사용자_결재하기
	int updateApproval(Line l);
	int updateApprLine(Line l);
	
	// 사용자_반려하기
	int updateDisapproval(Line l);
	int updateDisapprLine(Line l);
	
	// 사용자_연장근무 신청
	int insertApprOvertime(Sign s);
	int insertOvertime(Overtime o);
	
	// 사용자_휴가 신청
	int insertApprVacation(Sign s);
	int insertVacation(Vacation v);

	// 사용자_임시저장함 리스트 조회
	int selectStorageListCount(String empNo);
	ArrayList<Sign> selectApprStorageList(PageInfo pi, String empNo);
	
	// 사용자_상신취소
	int updateReportCancel(int apprNo);
	
	// 사용자_임시저장함 상세페이지(기안하기)
	Sign selectStorageReport(int apprNo);
	
	// 사용자_임시저장함 결재요청
	int updateStorageReport(Sign s);
	int deleteApprLine(Sign s);
	int insertStorageLine(ArrayList<Line> lineList);
	int insertStorageRef(ArrayList<Line> refList);
	
	// 사용자_일괄결재
	int updateAllApproval(String empNo);
	int updateAllLine(String empNo);
	
	int updateAllApproval2(HashMap<String, String> map);
	int updateAllLine2(HashMap<String, String> map);
	
	// 사용자_임시저장
	int insertStorageAppr(Sign s);
	
	// 사용자_임시저장 기안페이지에서 임시저장
	int updateStorage(Sign s);
}
