package com.fp.smartDoctor.sign.model.service;

import java.util.ArrayList;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.sign.model.vo.Sign;

public interface SignService {
	
	// 관리자_결재양식 관리
	int selectListCount();
	ArrayList<Sign> selectFormList(PageInfo pi);
}
