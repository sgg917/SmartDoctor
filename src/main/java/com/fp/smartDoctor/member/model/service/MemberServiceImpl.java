package com.fp.smartDoctor.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.member.model.dao.MemberDao;
import com.fp.smartDoctor.member.model.vo.Member;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MemberDao mDao;

	

}
