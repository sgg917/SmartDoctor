package com.fp.smartDoctor.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.dao.MemberDao;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = mDao.loginMember(sqlSession, m);
		return loginUser;
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}

	@Override
	public ArrayList<Dept> selectOrgChartDept() {
		return mDao.selectOrgChartDept(sqlSession);
	}

	@Override
	public ArrayList<Member> selectOrgChartEmp() {
		return mDao.selectOrgChartEmp(sqlSession);
	}

	@Override
	public int selectEmpCount(Dept d) {
		return mDao.selectEmpCount(sqlSession, d);
	}

	@Override
	public ArrayList<Member> selectEmp(Dept d) {
		return mDao.selectEmp(sqlSession, d);
	}

	// 직원가입
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	// 조직도 사원 삭제 - 슬
	@Override
	public int deleteEmp(String empNo) {
		return mDao.deleteEmp(sqlSession, empNo);
	}

	// 조직도 사원 수정 - 슬
	@Override
	public int updateEmp(Member m) {
		return mDao.updateEmp(sqlSession, m);
	}
	
	// 관리자 업데이트
	@Override
	public int updateAdmin(Member m) {
		return mDao.updateAdmin(sqlSession, m);
	}

}
