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
	
	// 관리자_결재양식 추가
	int insertForm(Form f);
	
	// 관리자_결재양식 삭제
	int deleteForm(int formNo);
	
	
	/*-------- 사용자 -----------*/
	
	// 사용자_결재양식선택 리스트 조회 (ajax)
	ArrayList<Form> selectApprFormList();
	
	// 사용자_결재양식 불러오기
	Form selectApprFormDetail(int formNo);
}
