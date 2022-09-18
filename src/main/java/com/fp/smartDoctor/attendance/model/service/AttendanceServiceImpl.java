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
	
	
	@Override
	public int selectListCount(Attendance a) {
		return aDao.selectListCount(sqlSession, a);
	}
	
	@Override
	public ArrayList<Attendance> selectAttendance(PageInfo pi, Attendance a) {
		return aDao.selectAttendance(sqlSession, pi, a);
	}

	@Override
	public int insertAttendance(int empNo) {
		return aDao.insertAttendance(sqlSession, empNo);
	}

	@Override
	public String selectStartTime(int empNo) {
		return aDao.selectStartTime(sqlSession, empNo);
	}
	
	@Override
	public String selectEndTime(int empNo) {
		return aDao.selectEndTime(sqlSession, empNo);
	}

	@Override
	public int endAttendance(int empNo) {
		return aDao.endAttendance(sqlSession, empNo);
	}

	@Override
	public int selectVacListCount(int empNo) {
		return aDao.selectVacListCount(sqlSession, empNo);
	}

	@Override
	public ArrayList<Vacation> selectVacationList(PageInfo pi, int empNo) {
		return aDao.selectVacationList(sqlSession, pi, empNo);
	}

	@Override
	public int selectVacRemain(int empNo) {
		return aDao.selectVacRemain(sqlSession, empNo);
	}

	@Override
	public int selectAllListCount() {
		return aDao.selectAllListCount(sqlSession);
	}

	@Override
	public ArrayList<Attendance> selectAllAttendanceList(PageInfo pi) {
		return aDao.selectAllAttendanceList(sqlSession, pi);
	}

	@Override
	public int selectMemListCount() {
		return aDao.selectMemListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public ArrayList<Vacation> selectMemVacRemain() {
		return aDao.selectMemVacRemain(sqlSession);
	}

	@Override
	public ArrayList<Vacation> ajaxSelectVacationList(int empNo) {
		return aDao.ajaxSelectVacationList(sqlSession, empNo);
	}

	@Override
	public int ajaxSearchListCount(HashMap hm) {
		return aDao.ajaxSearchListCount(sqlSession, hm);
	}

	@Override
	public ArrayList<Member> ajaxSearchList(PageInfo pi, HashMap hm) {
		return aDao.ajaxSearchList(sqlSession, pi, hm);
	}

	@Override
	public ArrayList<Attendance> selectAttendance(Attendance a) {
		return aDao.selectAttendance(sqlSession, a);
	}

	@Override
	public int updateAttendance(Attendance a) {
		return aDao.updateAttendance(sqlSession, a);
	}
	
	

}
