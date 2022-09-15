package com.fp.smartDoctor.member.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int updatePwd(Member m);
	
	// 조직도 부서 조회 - 슬
	ArrayList<Dept> selectOrgChartDept();
	
	// 조직도 사원 조회 - 슬
	ArrayList<Member> selectOrgChartEmp();
}
