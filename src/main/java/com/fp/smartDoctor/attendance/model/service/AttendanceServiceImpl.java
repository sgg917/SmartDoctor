package com.fp.smartDoctor.attendance.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.attendance.model.dao.AttendanceDao;
import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Member;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private AttendanceDao aDao;
	
	// 근태 총 개수 조회용 메소드
	@Override
	public int selectListCount(Attendance a) {
		return aDao.selectListCount(sqlSession, a);
	}
	
	// 근태 리스트 조회용 메소드 (페이징 ㅇ)
	@Override
	public ArrayList<Attendance> selectAttendance(PageInfo pi, Attendance a) {
		return aDao.selectAttendance(sqlSession, pi, a);
	}
	
	// 근태 리스트 조회용 메소드 (페이징 x)
	@Override
	public ArrayList<Attendance> selectAttendance(Attendance a) {
		return aDao.selectAttendance(sqlSession, a);
	}

	// 오늘 출근 시간 조회용 메소드
	@Override
	public String selectStartTime(int empNo) {
		return aDao.selectStartTime(sqlSession, empNo);
	}
	
	// 오늘 퇴근 시간 조회용 메소드
	@Override
	public String selectEndTime(int empNo) {
		return aDao.selectEndTime(sqlSession, empNo);
	}
	
	// 출근 insert 메소드
	@Override
	public int insertAttendance(int empNo) {
		return aDao.insertAttendance(sqlSession, empNo);
	}

	// 퇴근, 근태상태 update 메소드
	@Override
	public int endAttendance(int empNo) {
		return aDao.endAttendance(sqlSession, empNo);
	}

	// 휴가 총 개수 조회용 메소드
	@Override
	public int selectVacListCount(int empNo) {
		return aDao.selectVacListCount(sqlSession, empNo);
	}

	// 휴가 리스트 조회용 메소드 (페이징 o)
	@Override
	public ArrayList<Vacation> selectVacationList(PageInfo pi, int empNo) {
		return aDao.selectVacationList(sqlSession, pi, empNo);
	}

	// 연차 잔여일수 조회용 메소드
	@Override
	public int selectVacRemain(int empNo) {
		return aDao.selectVacRemain(sqlSession, empNo);
	}

	// 전사 근태 개수 조회용 메소드
	@Override
	public int selectAllListCount() {
		return aDao.selectAllListCount(sqlSession);
	}

	// 전사 근태 리스트 조회용 메소드
	@Override
	public ArrayList<Attendance> selectAllAttendanceList(PageInfo pi) {
		return aDao.selectAllAttendanceList(sqlSession, pi);
	}
	
	// 근태 정보 수정용 메소드
	@Override
	public int updateAttendance(Attendance a) {
		return aDao.updateAttendance(sqlSession, a);
	}

	// 검색한 근태 수 조회용 메소드
	@Override
	public int ajaxSearchAttListCount(HashMap hm) {
		return aDao.ajaxSearchAttListCount(sqlSession, hm);
	}

	// 검색한 근태 정보 조회용 메소드
	@Override
	public ArrayList<Attendance> ajaxSearchAttendance(PageInfo pi, HashMap hm) {
		return aDao.ajaxSearchAttendance(sqlSession, pi, hm);
	}

	// 전체 사원 수 조회용 메소드
	@Override
	public int selectMemListCount() {
		return aDao.selectMemListCount(sqlSession);
	}

	// 전체 사원 조회용 메소드
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDao.selectMemberList(sqlSession, pi);
	}

	// 휴가를 사용한 사원들의 연차 잔여일수 조회용 메소드
	@Override
	public ArrayList<Vacation> selectMemVacRemain() {
		return aDao.selectMemVacRemain(sqlSession);
	}

	// 휴가 리스트 조회용 메소드 (페이징 x)
	@Override
	public ArrayList<Vacation> selectVacationList(int empNo) {
		return aDao.selectVacationList(sqlSession, empNo);
	}

	// 검색한 사원 수 조회용 메소드
	@Override
	public int ajaxSearchListCount(HashMap hm) {
		return aDao.ajaxSearchListCount(sqlSession, hm);
	}

	// 검색한 사원 리스트 조회용 메소드
	@Override
	public ArrayList<Member> ajaxSearchList(PageInfo pi, HashMap hm) {
		return aDao.ajaxSearchList(sqlSession, pi, hm);
	}
	
}
