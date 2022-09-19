package com.fp.smartDoctor.messenger.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;
import com.fp.smartDoctor.messenger.model.vo.Search;
import com.fp.smartDoctor.messenger.model.vo.SearchCondition;

public interface MessengerService{
	
	// 받은메일
	int selectListCount(String mailTo);
	ArrayList<Email> selectList(PageInfo pi, String mailTo);
	// 보낸메일
	int fselectListCount(String mailFrom);
	ArrayList<Email> fselectList(PageInfo pi, String mailFrom);
	// 중요메일
	int iselectListCount(String mailOwn);
	ArrayList<Email> iselectList(PageInfo pi, String mailOwn);
	
	
	// 받은메일+보낸메일 검색
	int searchListCount(SearchCondition sc);
	ArrayList<Email> searchList(PageInfo pi, SearchCondition sc);
	// 중요메일 검색
	int isearchListCount(SearchCondition sc);
	ArrayList<Email> isearchList(PageInfo pi, SearchCondition sc);
	
	
	int readFlagUpdate(int mailNo);
	Email selectMail(int mailNo);
	ArrayList<MailAttachment> fileList(int mailNo);
	
	//메일작성
	int insertMail(Email insertE);
	//다중 인서트를 위한 메일작성
	//int insertMail(ArrayList<Email> insertE);
	int insertMailAttachment(MailAttachment mt);
	int updateMailFlag(int currNo);
	Email nowMailNo();
	String loadMailnameTo(String toname);
	int deleteMail(int i);
	int importFlagUpdate(int mailNo);
	int unImportFlagUpdate(int mailNo);
	
	
	
	int notReadMail(String mailOwn);
	int fromMail(String mailOwn);
	int importMail(String mailOwn);
	
	
	ArrayList<Email> miniFromMailList(String mailOwn);
	ArrayList<Email> miniToMailList(String mailOwn);
	ArrayList<Email> miniImportMailList(String mailOwn);
	
	
	// 주소록 부서별 사원 조회
	ArrayList<Member> selectDeptEmpList(String keyword);
	// 주소록 키워드 검색 
	ArrayList<Member> selectEmpListSearch(Search search);
}
