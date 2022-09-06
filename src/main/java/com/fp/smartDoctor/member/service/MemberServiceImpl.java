package com.fp.smartDoctor.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.member.dao.MemberDao;

public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private MemberDao mDao;

}
