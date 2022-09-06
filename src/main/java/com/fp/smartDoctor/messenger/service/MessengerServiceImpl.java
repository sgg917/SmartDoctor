package com.fp.smartDoctor.messenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fp.smartDoctor.messenger.dao.MessengerDao;
import org.springframework.stereotype.Service;

public class MessengerServiceImpl implements MessengerService {

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private MessengerDao mDao;

}
