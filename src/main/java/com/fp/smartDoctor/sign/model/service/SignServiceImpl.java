package com.fp.smartDoctor.sign.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.dao.SignDao;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Sign;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private SignDao sDao;
	
	@Override
	public int selectListCount() {
		return sDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Form> selectFormList(PageInfo pi) {
		return sDao.selectFormList(sqlSession, pi);
	}
	@Override
	public Form selectFormDetail(int formNo) {
		return sDao.selectFormDetail(sqlSession, formNo);
	}
	@Override
	public int updateForm(Form f) {
		return sDao.updateForm(sqlSession, f);
	}
	@Override
	public int insertForm(Form f) {
		return sDao.insertForm(sqlSession, f);
	}
	@Override
	public int deleteForm(int formNo) {
		return sDao.deleteForm(sqlSession, formNo);
	}
	@Override
	public ArrayList<Form> selectApprFormList() {
		return sDao.selectApprFormList(sqlSession);
	}
	@Override
	public Form selectApprFormDetail(int formNo) {
		return sDao.selectApprFormDetail(sqlSession, formNo);
	}
	@Override
	public ArrayList<Member> selectApprLineList() {
		return sDao.selectApprLineList(sqlSession);
	}
	@Override
	public ArrayList<Dept> selectApprLineDept() {
		return sDao.selectApprLineDept(sqlSession);
	}
	@Override
	public Member selectApprEmp(int empNo) {
		return sDao.selectApprEmp(sqlSession, empNo);
	}
	@Override
	public int selectApprListCount() {
		return sDao.selectApprListCount(sqlSession);
	}
	@Override
	public ArrayList<Sign> selectApprStandbyList(PageInfo pi) {
		return sDao.selectApprStandbyList(sqlSession, pi);
	}
	@Override
	public int insertAppr(Sign s) {
		return sDao.insertAppr(sqlSession, s);
	}
}
