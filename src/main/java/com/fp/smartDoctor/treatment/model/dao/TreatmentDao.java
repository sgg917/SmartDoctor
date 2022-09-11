package com.fp.smartDoctor.treatment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.treatment.model.vo.ListSurgeryBooking;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;

@Repository
public class TreatmentDao {

	public int insertOP(SqlSessionTemplate sqlSession, RevOProom op) {
		return sqlSession.insert("treatmentMapper.insertOP", op);
	}
	
	public List<RevOProom> getCalendar(SqlSessionTemplate sqlSession)  {
		List<RevOProom> calendar = sqlSession.selectList("treatmentMapper.calendarList");
		return calendar;
	}
	
	public ListSurgeryBooking selectRevOProom(SqlSessionTemplate sqlSession, int bookingNo) {
		return sqlSession.selectOne("treatmentMapper.selectOProom", bookingNo);
	}
}