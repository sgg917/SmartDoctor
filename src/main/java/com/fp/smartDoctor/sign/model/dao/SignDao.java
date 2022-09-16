package com.fp.smartDoctor.sign.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Line;
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
	
	public int selectApprListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("signMapper.selectApprListCount");
	}
	
	public ArrayList<Sign> selectApprStandbyList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("signMapper.selectApprStandbyList", null, rowBounds);
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
	
	public int selectCommentCount(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectCommentCount", apprNo);
	}
	
	public Sign selectApprReportDetail(SqlSessionTemplate sqlSession, int apprNo) {
		return sqlSession.selectOne("signMapper.selectApprReportDetail", apprNo);
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
	

	
	
}
