package com.fp.smartDoctor.sign.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.sign.model.dao.SignDao;

@Service
public class SignServiceImpl implements SignService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private SignDao sDao;
}
