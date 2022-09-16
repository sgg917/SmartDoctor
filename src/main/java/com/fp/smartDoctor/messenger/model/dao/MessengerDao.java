package com.fp.smartDoctor.messenger.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;
import com.fp.smartDoctor.messenger.model.vo.SearchCondition;

@Repository
public class MessengerDao {

	
	// 받은 메일
	public int selectListCount(SqlSessionTemplate sqlSession, String mailTo) {
		return sqlSession.selectOne("messengerMapper.selectListCount", mailTo);
	}
	
	public ArrayList<Email> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailTo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messengerMapper.selectList", mailTo, rowBounds);
	}
	
	
	// 보낸 메일
	public int fselectListCount(SqlSessionTemplate sqlSession, String mailFrom) {
		return sqlSession.selectOne("messengerMapper.fselectListCount", mailFrom);
	}
	
	public ArrayList<Email> fselectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailFrom) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messengerMapper.fselectList", mailFrom, rowBounds);
	}

	
	// 중요메일
	public int iselectListCount(SqlSessionTemplate sqlSession, String mailOwn) {
		return sqlSession.selectOne("messengerMapper.iselectListCount", mailOwn);
	}
	
	public ArrayList<Email> iselectList(SqlSessionTemplate sqlSession, PageInfo pi, String mailOwn) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messengerMapper.iselectList", mailOwn, rowBounds);
	}
	
	
	
	
	
	public int searchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("messengerMapper.searchListCount", sc);
	}
	
	public ArrayList<Email> searchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messengerMapper.searchList", sc, rowBounds);
	}
	
	public int isearchListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("messengerMapper.isearchListCount", sc);
	}
	
	public ArrayList<Email> isearchList(SqlSessionTemplate sqlSession, PageInfo pi, SearchCondition sc) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("messengerMapper.isearchList", sc, rowBounds);
	}
	
	
	
	
	

	public int readFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("messengerMapper.readFlagUpdate", mailNo);
	}

	public Email selectMail(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.selectOne("messengerMapper.selectMail", mailNo);
	}

	public ArrayList<MailAttachment> fileList(SqlSessionTemplate sqlSession, int mailNo) {
		return (ArrayList)sqlSession.selectList("messengerMapper.fileList", mailNo);
	}
	
	
	
	
	
	//메일 작성
	public int insertMail(SqlSessionTemplate sqlSession, Email insertE) {
		return sqlSession.insert("messengerMapper.insertMail", insertE);
	}
	
	public int insertMailAttachment(SqlSessionTemplate sqlSession, MailAttachment mt) {
		return sqlSession.insert("messengerMapper.insertMailAttachment", mt);
	}
	
	public int updateMailFlag(SqlSessionTemplate sqlSession, int currNo) {
		return sqlSession.update("messengerMapper.updateMailFlag", currNo);
	}
	
	public Email nowMailNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("messengerMapper.nowMailNo");
	}
	
	public String loadMailnameTo(SqlSessionTemplate sqlSession, String toname) {
		return sqlSession.selectOne("messengerMapper.loadMailnameTo", toname);
	}
	
	public int deleteMail(SqlSessionTemplate sqlSession, int mailOwn) {
		return sqlSession.update("messengerMapper.deleteMail", mailOwn);
	}
	
	public int importFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("messengerMapper.importFlagUpdate", mailNo);
	}
	
	public int unImportFlagUpdate(SqlSessionTemplate sqlSession, int mailNo) {
		return sqlSession.update("messengerMapper.unImportFlagUpdate", mailNo);
	}
	
	public int notReadMail(SqlSessionTemplate sqlSession, String mailOwn) {
		return sqlSession.selectOne("messengerMapper.notReadMail", mailOwn);
	}
	
	public int fromMail(SqlSessionTemplate sqlSession, String mailOwn) {
		return sqlSession.selectOne("messengerMapper.fromMail", mailOwn);
	}
	
	public int importMail(SqlSessionTemplate sqlSession, String mailOwn) {
		return sqlSession.selectOne("messengerMapper.importMail", mailOwn);
	}
	
	public ArrayList<Email> miniFromMailList(SqlSessionTemplate sqlSession, String mailOwn) {
		return (ArrayList)sqlSession.selectList("messengerMapper.miniFromMailList", mailOwn);
	}
	
	public ArrayList<Email> miniToMailList(SqlSessionTemplate sqlSession, String mailOwn) {
		return (ArrayList)sqlSession.selectList("messengerMapper.miniToMailList", mailOwn);
	}
	
	public ArrayList<Email> miniImportMailList(SqlSessionTemplate sqlSession, String mailOwn) {
		return (ArrayList)sqlSession.selectList("messengerMapper.miniImportMailList", mailOwn);
	}
	
	
	
}
