package com.fp.smartDoctor.treatment.model.service;

import com.fp.smartDoctor.treatment.model.vo.RevOProom;

public interface TreatmentService {
	

	//수술실 예약 서비스
	int insertOP(RevOProom op);
	
	//수술예약 상세조회 서비스
	RevOProom selectRevOProom(int bookingNo);
	
	//수술예약 삭제 서비스
	int deleteRevOProom(int bookingNo);
	
	//수술예약 수정 서비스
	int updateRevOProom(RevOProom op);
	
}
