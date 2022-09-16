package com.fp.smartDoctor.messenger.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;

@Repository
public class MessengerDao {

	
	//메일 작성하기
	public int insertMail(SqlSessionTemplate sqlSession, Email insertE) {
		return sqlSession.insert("mailMapper.insertMail", insertE);
	}
	public int insertMailAttachment(SqlSessionTemplate sqlSession, MailAttachment mt) {
		return sqlSession.insert("mailMapper.insertMailAttachment", mt);
	}
	public int updateMailFlag(SqlSessionTemplate sqlSession, int currNo) {
		return sqlSession.update("mailMapper.updateMailFlag", currNo);
	}
	public Email nowMailNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.nowMailNo");
	}
	public String loadMailnameTo(SqlSessionTemplate sqlSession, String toname) {
		return sqlSession.selectOne("mailMapper.loadMailnameTo", toname);
	}
	public int deleteMail(SqlSessionTemplate sqlSession, int mailOwn) {
		return sqlSession.update("mailMapper.deleteMail", mailOwn);
	}
	public int importFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("mailMapper.importFlagUpdate", mailNo);
	}
	public int unImportFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("mailMapper.unImportFlagUpdate", mailNo);
	}
	
	
	
}
