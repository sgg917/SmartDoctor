package com.fp.smartDoctor.reception.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.reception.model.dao.ReceptionDao;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Patient;

@Service
public class ReceptionServiceImpl implements ReceptionService{
	
	@Autowired
	private ReceptionDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Patient> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertPatient(Patient p) {
		return rDao.insertPatient(sqlSession, p);
	}

	@Override
	public Patient selectPatient(int chartNo) {
		return rDao.selectPatient(sqlSession, chartNo);
	}

	@Override
	public ArrayList<Dept> selectDeptList() {
		return rDao.selectDeptList(sqlSession);
	}

	@Override
	public ArrayList<Member> selectProfList() {
		return rDao.selectProfList(sqlSession);
	}

	@Override
	public int insertTreatment(Clinic c) {
		return rDao.insertTreatment(sqlSession, c);
	}

	@Override
	public ArrayList<Clinic> ajaxSelectWaitingPatient() {
		return rDao.ajaxSelectWaitingPatient(sqlSession);
	}

	@Override
	public ArrayList<Clinic> ajaxSelectIngPatient() {
		return rDao.ajaxSelectIngPatient(sqlSession);
	}
	
	@Override
	public int ajaxChangePatientStatus(int changeChartNo) {
		return rDao.ajaxChangePatientStatus(sqlSession, changeChartNo);
	}
	
	@Override
	public ArrayList<Clinic> ajaxSurgeryWaitingList() {
		return rDao.ajaxSurgeryWaitingList(sqlSession);
	}

	@Override
	public ArrayList<Clinic> ajaxPRoomWaitingList() {
		return rDao.ajaxPRoomWaitingList(sqlSession);
	}

}
