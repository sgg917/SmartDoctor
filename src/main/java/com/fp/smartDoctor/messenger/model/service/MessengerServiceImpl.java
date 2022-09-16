package com.fp.smartDoctor.messenger.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.messenger.model.dao.MessengerDao;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;
import com.fp.smartDoctor.messenger.model.vo.SearchCondition;

@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MessengerDao mDao;

	@Override
	public int selectListCount(String mailTo) {
		return mDao.selectListCount(sqlSession, mailTo);
	}
	@Override
	public ArrayList<Email> selectList(PageInfo pi, String mailTo) {
		return mDao.selectList(sqlSession, pi, mailTo);
	}
	
	@Override
	public int fselectListCount(String mailFrom) {
		return mDao.fselectListCount(sqlSession, mailFrom);
	}
	@Override
	public ArrayList<Email> fselectList(PageInfo pi, String mailFrom) {
		return mDao.fselectList(sqlSession, pi, mailFrom);
	}
	
	@Override
	public int iselectListCount(String mailOwn) {
		return mDao.iselectListCount(sqlSession, mailOwn);
	}
	@Override
	public ArrayList<Email> iselectList(PageInfo pi, String mailOwn) {
		return mDao.iselectList(sqlSession, pi, mailOwn);
	}
	
	
	
	
	
	@Override
	public int searchListCount(SearchCondition sc) {
		return mDao.searchListCount(sqlSession, sc);
	}
	@Override
	public ArrayList<Email> searchList(PageInfo pi, SearchCondition sc) {
		return mDao.searchList(sqlSession,  pi, sc);
	}
	@Override
	public int isearchListCount(SearchCondition sc) {
		return mDao.isearchListCount(sqlSession, sc);
	}
	@Override
	public ArrayList<Email> isearchList(PageInfo pi, SearchCondition sc) {
		return mDao.isearchList(sqlSession,  pi, sc);
	}
	
	
	
	
	
	@Override
	public int readFlagUpdate(int mailNo) {
		return mDao.readFlagUpdate(sqlSession, mailNo);
	}

	@Override
	public Email selectMail(int mailNo) {
		return mDao.selectMail(sqlSession, mailNo);
	}

	@Override
	public ArrayList<MailAttachment> fileList(int mailNo) {
		return mDao.fileList(sqlSession, mailNo);
	}
	
	
	
	//메일작성
	@Override
	public int insertMail(Email insertE) {
		return mDao.insertMail(sqlSession, insertE);
	}
	@Override
	public int insertMailAttachment(MailAttachment mt) {
		return mDao.insertMailAttachment(sqlSession, mt);
	}
	@Override
	public int updateMailFlag(int currNo) {
		return mDao.updateMailFlag(sqlSession, currNo);
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
	@Override
	public int notReadMail(String mailOwn) {
		return mDao.notReadMail(sqlSession, mailOwn);
	}
	@Override
	public int fromMail(String mailOwn) {
		return mDao.fromMail(sqlSession, mailOwn);
	}
	@Override
	public int importMail(String mailOwn) {
		return mDao.importMail(sqlSession, mailOwn);
	}
	
	
	
	@Override
	public ArrayList<Email> miniFromMailList(String mailOwn) {
		return mDao.miniFromMailList(sqlSession, mailOwn);
	}
	@Override
	public ArrayList<Email> miniToMailList(String mailOwn) {
		return mDao.miniToMailList(sqlSession, mailOwn);
	}
	@Override
	public ArrayList<Email> miniImportMailList(String mailOwn) {
		return mDao.miniImportMailList(sqlSession, mailOwn);
	}
	
}
