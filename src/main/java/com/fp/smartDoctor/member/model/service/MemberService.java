package com.fp.smartDoctor.member.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int updatePwd(Member m);
	
	// 조직도 부서 조회 - 슬
	ArrayList<Dept> selectOrgChartDept();
	
	// 조직도 사원 조회 - 슬
	ArrayList<Member> selectOrgChartEmp();

	// 조직도 부서별 사원 수 조회 - 슬
	int selectEmpCount(Dept d);
	
	// 조직도 부서별 사원 조회 - 슬
	ArrayList<Member> selectEmp(Dept d);

	// 사원가입
	int insertMember(Member m);

}
