package com.fp.smartDoctor.sign.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Line;
import com.fp.smartDoctor.sign.model.vo.Overtime;
import com.fp.smartDoctor.sign.model.vo.Sign;

@Repository
public class SignDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("signMapper.selectListCount");
	}
	
	public ArrayList<Form> selectFormList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectFormList", null, rowBounds);
	}
	
	public Form selectFormDetail(SqlSessionTemplate sqlSession, int formNo) {
		return sqlSession.selectOne("signMapper.selectFormDetail", formNo);
	}
	
	public int updateForm(SqlSessionTemplate sqlSession, Form f) {
		return sqlSession.update("signMapper.updateForm", f);
	}
	
	public int insertForm(SqlSessionTemplate sqlSession, Form f) {
		return sqlSession.insert("signMapper.insertForm", f);
	}
	
	public int deleteForm(SqlSessionTemplate sqlSession, int formNo) {
		return sqlSession.update("signMapper.deleteForm", formNo);
	}
	
	public ArrayList<Form> selectApprFormList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("signMapper.selectApprFormList");
	}
	
	public Form selectApprFormDetail(SqlSessionTemplate sqlSession, int formNo) {
		return sqlSession.selectOne("signMapper.selectApprFormDetail", formNo);
	}
	
	public ArrayList<Member> selectApprLineList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.selectApprLineList");
	}
	
	public ArrayList<Dept> selectApprLineDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectApprLineDept");
	}
	
	public Member selectApprEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("memberMapper.selectApprEmp", empNo);
	}
	
	public int selectApprListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("signMapper.selectApprListCount", empNo);
	}
	
	public ArrayList<Sign> selectApprStandbyList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprStandbyList", empNo, rowBounds);
	}
	
	public int insertLine(SqlSessionTemplate sqlSession, ArrayList<Line> lineList) {
		
		int result = 0;
		for(Line l : lineList) {
			result += sqlSession.insert("signMapper.insertLine", l);
		}
		
		return result;
	}
	
	public int insertRef(SqlSessionTemplate sqlSession, ArrayList<Line> refList) {
		
		int result = 0;
		for(Line l : refList) {
			result += sqlSession.insert("signMapper.insertRef", l);
		}
		
		return result;
	}
	
	public int insertAppr(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.insert("signMapper.insertAppr", s);
	}
	
	public int selectReferListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("signMapper.selectReferListCount", empNo);
	}
	
	public ArrayList<Sign> selectApprReferList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprReferList", empNo, rowBounds);
	}
	
	public ArrayList<Line> selectApprRef(SqlSessionTemplate sqlSession, int apprNo) {
		return (ArrayList)sqlSession.selectList("signMapper.selectApprRef", apprNo);
	}
	
	public ArrayList<Line> selectApprLine(SqlSessionTemplate sqlSession, int apprNo) {
		return (ArrayList)sqlSession.selectList("signMapper.selectApprLine", apprNo);
	}
	
	public Sign selectApprReferDetail(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectApprReferDetail", apprNo);
	}
	
	public int selectReportListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("signMapper.selectReportListCount", empNo);
	}
	
	public ArrayList<Sign> selectApprReportList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprReportList", empNo, rowBounds);
	}
	
	// 기안문서함 상세 조회
	public ArrayList<Line> selectLineComment(SqlSessionTemplate sqlSession, int apprNo) {
		return (ArrayList)sqlSession.selectList("signMapper.selectLineComment", apprNo);
	}
	
	public Sign selectApprReportDetail(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectApprReportDetail", apprNo);
	}
	
	public Overtime selectOvertime(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectOvertime", apprNo);
	}
	
	public Vacation selectVacation(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("attendanceMapper.selectVacation", apprNo);
	}
	
	// 결재문서함 리스트 조회
	public int selectGetListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("signMapper.selectGetListCount", empNo);
	}
	
	public ArrayList<Sign> selectApprGetList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprGetList", empNo, rowBounds);
	}
	
	// 내결재 순번 조회
	public Line selectLineLevel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("signMapper.selectLineLevel", map);
	}
	
	// 결재하기
	public int updateApproval(SqlSessionTemplate sqlSession, Line l) {
		return sqlSession.update("signMapper.updateApproval", l);
	}
	
	public int updateApprLine(SqlSessionTemplate sqlSession, Line l) {
		return sqlSession.update("signMapper.updateApprLine", l);
	}
	
	// 반려하기
	public int updateDisapproval(SqlSessionTemplate sqlSession, Line l) {
		return sqlSession.update("signMapper.updateDisapproval", l);
	}
	
	public int updateDisapprLine(SqlSessionTemplate sqlSession, Line l) {
		return sqlSession.update("signMapper.updateDisapprLine", l);
	}
	
	// 연장근무 신청
	public int insertApprOvertime(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.insert("signMapper.insertApprOvertime", s);
	}
	
	public int insertOvertime(SqlSessionTemplate sqlSession, Overtime o) {
		return sqlSession.insert("signMapper.insertOvertime", o);
	}
	
	// 휴가 신청
	public int insertApprVacation(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.insert("attendanceMapper.insertApprVacation", s);
	}
	
	public int insertVacation(SqlSessionTemplate sqlSession, Vacation v) {
		return sqlSession.insert("attendanceMapper.insertVacation", v);
	}
	
	// 임시저장함 리스트 조회
	public int selectStorageListCount(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.selectOne("signMapper.selectStorageListCount", empNo);
	}
	
	public ArrayList<Sign> selectApprStorageList(SqlSessionTemplate sqlSession, PageInfo pi, String empNo){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprStorageList", empNo, rowBounds);
	}
	
	// 상신취소
	public int updateReportCancel(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.update("signMapper.updateReportCancel", apprNo);
	}
	
	// 임시저장함 상세페이지(기안하기)
	public Sign selectStorageReport(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectStorageReport", apprNo);
	}
	
	// 임시저장함 결재요청
	public int updateStorageReport(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.update("signMapper.updateStorageReport", s);
	}
	
	public int deleteApprLine(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.delete("signMapper.deleteApprLine", s);
	}
	
	public int insertStorageLine(SqlSessionTemplate sqlSession, ArrayList<Line> lineList) {
		
		int result = 0;
		for(Line l : lineList) {
			result += sqlSession.insert("signMapper.insertStorageLine", l);
		}
		
		return result;
	}
	
	public int insertStorageRef(SqlSessionTemplate sqlSession, ArrayList<Line> refList) {
		
		int result = 0;
		for(Line l : refList) {
			result += sqlSession.insert("signMapper.insertStorageRef", l);
		}
		
		return result;
	}
	
	// 일괄결재
	public int updateAllApproval(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("signMapper.updateAllApproval", empNo);
	}
	
	public int updateAllLine(SqlSessionTemplate sqlSession, String empNo) {
		return sqlSession.update("signMapper.updateAllLine", empNo);
	}
	
	
	
	
	public int updateAllApproval2(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("signMapper.updateAllApproval", map);
	}
	
	public int updateAllLine2(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("signMapper.updateAllLine", map);
	}
	
	// 임시저장
	public int insertStorageAppr(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.insert("signMapper.insertStorageAppr", s);
	}
	
	// 임시저장페이지에서 임시저장
	public int updateStorage(SqlSessionTemplate sqlSession, Sign s) {
		return sqlSession.update("signMapper.updateStorage", s);
	}
}
