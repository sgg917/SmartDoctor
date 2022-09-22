package com.fp.smartDoctor.sign.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.dao.SignDao;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Line;
import com.fp.smartDoctor.sign.model.vo.Overtime;
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
	public int selectApprListCount(String empNo) {
		return sDao.selectApprListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Sign> selectApprStandbyList(PageInfo pi, String empNo) {
		return sDao.selectApprStandbyList(sqlSession, pi, empNo);
	}
	@Override
	public int insertAppr(Sign s) {
		return sDao.insertAppr(sqlSession, s);
	}
	@Override
	public int selectReferListCount(String empNo) {
		return sDao.selectReferListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Sign> selectApprReferList(PageInfo pi, String empNo) {
		return sDao.selectApprReferList(sqlSession, pi, empNo);
	}
	@Override
	public Sign selectApprReferDetail(int apprNo) {
		return sDao.selectApprReferDetail(sqlSession, apprNo);
	}
	@Override
	public ArrayList<Line> selectApprLine(int apprNo) {
		return sDao.selectApprLine(sqlSession, apprNo);
	}
	@Override
	public ArrayList<Line> selectApprRef(int apprNo) {
		return sDao.selectApprRef(sqlSession, apprNo);
	}
	@Override
	public int selectReportListCount(String empNo) {
		return sDao.selectReportListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Sign> selectApprReportList(PageInfo pi, String empNo) {
		return sDao.selectApprReportList(sqlSession, pi, empNo);
	}
	@Override
	public Sign selectApprReportDetail(int apprNo) {
		return sDao.selectApprReportDetail(sqlSession, apprNo);
	}
	@Override
	public int insertLine(ArrayList<Line> lineList) {
		return sDao.insertLine(sqlSession, lineList);
	}
	@Override
	public int insertRef(ArrayList<Line> refList) {
		return sDao.insertRef(sqlSession, refList);
	}
	@Override
	public int selectGetListCount(String empNo) {
		return sDao.selectGetListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Sign> selectApprGetList(PageInfo pi, String empNo) {
		return sDao.selectApprGetList(sqlSession, pi, empNo);
	}
	@Override
	public int updateApproval(Line l) {
		return sDao.updateApproval(sqlSession, l);
	}
	@Override
	public int updateApprLine(Line l) {
		return sDao.updateApprLine(sqlSession, l);
	}
	@Override
	public int updateDisapproval(Line l) {
		return sDao.updateDisapproval(sqlSession, l);
	}
	@Override
	public int updateDisapprLine(Line l) {
		return sDao.updateDisapprLine(sqlSession, l);
	}
	@Override
	public Line selectLineLevel(HashMap<String, Object> map) {
		return sDao.selectLineLevel(sqlSession, map);
	}
	@Override
	public int insertApprOvertime(Sign s) {
		return sDao.insertApprOvertime(sqlSession, s);
	}
	@Override
	public int insertOvertime(Overtime o) {
		return sDao.insertOvertime(sqlSession, o);
	}
	@Override
	public int insertApprVacation(Sign s) {
		return sDao.insertApprVacation(sqlSession, s);
	}
	@Override
	public int insertVacation(Vacation v) {
		return sDao.insertVacation(sqlSession, v);
	}
	@Override
	public Overtime selectOvertime(int apprNo) {
		return sDao.selectOvertime(sqlSession, apprNo);
	}
	@Override
	public Vacation selectVacation(int apprNo) {
		return sDao.selectVacation(sqlSession, apprNo);
	}
	@Override
	public int selectStorageListCount(String empNo) {
		return sDao.selectStorageListCount(sqlSession, empNo);
	}
	@Override
	public ArrayList<Sign> selectApprStorageList(PageInfo pi, String empNo) {
		return sDao.selectApprStorageList(sqlSession, pi, empNo);
	}
	@Override
	public int updateReportCancel(int apprNo) {
		return sDao.updateReportCancel(sqlSession, apprNo);
	}
	@Override
	public Sign selectStorageReport(int apprNo) {
		return sDao.selectStorageReport(sqlSession, apprNo);
	}
	@Override
	public int updateStorageReport(Sign s) {
		return sDao.updateStorageReport(sqlSession, s);
	}
	@Override
	public int deleteApprLine(Sign s) {
		return sDao.deleteApprLine(sqlSession, s);
	}
	@Override
	public int insertStorageLine(ArrayList<Line> lineList) {
		return sDao.insertStorageLine(sqlSession, lineList);
	}
	@Override
	public int insertStorageRef(ArrayList<Line> refList) {
		return sDao.insertStorageRef(sqlSession, refList);
	}
	@Override
	public ArrayList<Line> selectLineComment(int apprNo) {
		return sDao.selectLineComment(sqlSession, apprNo);
	}
	@Override
	public int updateAllApproval(ArrayList<Line> list) {
		return sDao.updateAllApproval(sqlSession, list);
	}
	@Override
	public int updateAllLine(ArrayList<Line> list) {
		return sDao.updateAllLine(sqlSession, list);
	}
	@Override
	public int insertStorageAppr(Sign s) {
		return sDao.insertStorageAppr(sqlSession, s);
	}
	@Override
	public int updateStorage(Sign s) {
		return sDao.updateStorage(sqlSession, s);
	}
	
	

}
