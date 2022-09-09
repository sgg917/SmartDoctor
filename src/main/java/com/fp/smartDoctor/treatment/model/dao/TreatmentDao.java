package com.fp.smartDoctor.treatment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.treatment.model.vo.Calendar;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;

@Repository
public class TreatmentDao {

	public int insertOP(SqlSessionTemplate sqlSession, RevOProom op) {
		return sqlSession.insert("treatmentMapper.insertOP", op);
	}
	
	public List<Calendar> getCalendar(SqlSessionTemplate sqlSession)  {
		List<Calendar> calendar = sqlSession.selectList("treatmentMapper.calendarList");
		return calendar;
	}
}