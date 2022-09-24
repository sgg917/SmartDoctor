package com.fp.smartDoctor.member.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;

public interface MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 비번변경
	int updatePwd(Member m, String updatePwd);
	
	// 조직도 부서 조회
	ArrayList<Dept> selectOrgChartDept();
	
	// 조직도 사원 조회
	ArrayList<Member> selectOrgChartEmp();

	// 조직도 부서별 사원 수 조회
	int selectEmpCount(Dept d);
	
	// 조직도 부서별 사원 조회
	ArrayList<Member> selectEmp(Dept d);
	
	// 조직도 사원 삭제
	int deleteEmp(String empNo);
	
	// 조직도 사원 수정
	int updateEmp(Member m);
	
	// 조직도 부서명 수정
	int updateDept(Dept d);
	
	// 조직도 부서 삭제
	int deleteDept(int deptNo);
	
	// 조직도 부서 추가
	int insertDept(String deptName);

	// 사원가입
	int insertMember(Member m);
	
	// 가입 후 관리자로 업데이트(경영지원부(4)의 부장(6), 팀장(7) 만 status ='A'로 업데이트)
	int updateAdmin(Member m);

}
