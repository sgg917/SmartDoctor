package com.fp.smartDoctor.messenger.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.messenger.model.dao.MessengerDao;

public class MessengerServiceImpl implements MessengerService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private MessengerDao mDao;

}
