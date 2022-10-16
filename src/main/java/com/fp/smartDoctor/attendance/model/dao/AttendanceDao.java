package com.fp.smartDoctor.attendance.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Member;

@Repository
public class AttendanceDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.selectOne("attendanceMapper.selectListCount", a);
	}

	public ArrayList<Attendance> selectAttendance(SqlSessionTemplate sqlSession, PageInfo pi, Attendance a){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttendance", a, rowBounds);		
	}
	
	public ArrayList<Attendance> selectAttendance(SqlSessionTemplate sqlSession, Attendance a){
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttendance", a);
	}
	
	public String selectStartTime(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("attendanceMapper.selectStartTime", empNo);
	}
	
	public String selectEndTime(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("attendanceMapper.selectEndTime", empNo);
	}
	
	public int insertAttendance(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.insert("attendanceMapper.insertAttendance", empNo);
	}
	
	public int endAttendance(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.update("attendanceMapper.endAttendance", empNo);
	}
	
	public int selectVacListCount(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("attendanceMapper.selectVacListCount", empNo);
	}
	
	public ArrayList<Vacation> selectVacationList(SqlSessionTemplate sqlSession, PageInfo pi, int empNo){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectVacationList", empNo, rowBounds);
	}
	
	public int selectVacRemain(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("attendanceMapper.selectVacRemain", empNo);
	}
	
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.selectAllListCount");
	}
	
	public ArrayList<Attendance> selectAllAttendanceList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAllAttendanceList", null, rowBounds);
	}
	
	public int updateAttendance(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.update("attendanceMapper.updateAttendance", a);
	}
	
	public int ajaxSearchAttListCount(SqlSessionTemplate sqlSession, HashMap hm) {
		return sqlSession.selectOne("attendanceMapper.ajaxSearchAttListCount", hm);
	}
	
	public ArrayList<Attendance> ajaxSearchAttendance(SqlSessionTemplate sqlSession, PageInfo pi, HashMap hm){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.ajaxSearchAttendance", hm, rowBounds);
	}
	
	public int selectMemListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}
	
	public ArrayList<Vacation> selectMemVacRemain(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectMemVacRemain");
	}
	
	public ArrayList<Vacation> selectVacationList(SqlSessionTemplate sqlSession, int empNo){
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectVacationList", empNo);
	}
	
	public int ajaxSearchListCount(SqlSessionTemplate sqlSession, HashMap hm) {
		return sqlSession.selectOne("memberMapper.ajaxSearchListCount", hm);
	}
	
	public ArrayList<Member> ajaxSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap hm){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.ajaxSearchList", hm, rowBounds);
	}
	
}
