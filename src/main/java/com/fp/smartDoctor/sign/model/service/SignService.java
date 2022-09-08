package com.fp.smartDoctor.sign.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.sign.model.vo.Form;

public interface SignService {
	
	// 관리자_결재양식조회
	int selectListCount();
	ArrayList<Form> selectFormList(PageInfo pi);
	
	// 관리자_결재양식 상세조회
	Form selectFormDetail(int formNo);
	
	// 관리자_결재양식 수정
	int updateForm(Form f);
}
