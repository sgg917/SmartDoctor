package com.fp.smartDoctor.messenger.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.messenger.model.dao.MessengerDao;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;

@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MessengerDao mDao;

	//메일 작성하기
	@Override
	public int insertMail(Email em) {
		return mDao.insertMail(sqlSession, em);
	}

	@Override
	public int insertMailAttachment(MailAttachment mt) {
		return mDao.insertMailAttachment(sqlSession, mt);
	}
	
	@Override
	public Email nowMailNo() {
		return mDao.nowMailNo(sqlSession);
	}
	
	@Override
	public String loadMailnameTo(String toname) {
		return mDao.loadMailnameTo(sqlSession, toname);
	}
	
	
	
	@Override
	public int updateMailFlag(int currNo) {
		return mDao.updateMailFlag(sqlSession, currNo);
	}
	
	@Override
	public int deleteMail(int i) {
		return mDao.deleteMail(sqlSession, i);
	}
	
	@Override
	public int importFlagUpdate(int mailNo) {
		return mDao.importFlagUpdate(sqlSession, mailNo);
	}
	
	@Override
	public int unImportFlagUpdate(int mailNo) {
		return mDao.unImportFlagUpdate(sqlSession, mailNo);
	}
	

	

	//
	
}
