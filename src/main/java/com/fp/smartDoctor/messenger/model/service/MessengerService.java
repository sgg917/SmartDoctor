package com.fp.smartDoctor.messenger.model.service;

import com.fp.smartDoctor.messenger.model.vo.Email;
import com.fp.smartDoctor.messenger.model.vo.MailAttachment;

public interface MessengerService{
	
	//메일 작성하기
	int insertMail(Email em);
	int insertMailAttachment(MailAttachment at);
	Email nowMailNo();
	String loadMailnameTo(String toname);
	
	
	int updateMailFlag(int curNo);
	int deleteMail(int i);
	int importFlagUpdate(int mailNo);
	int unImportFlagUpdate(int mailNo);

	
	
}
