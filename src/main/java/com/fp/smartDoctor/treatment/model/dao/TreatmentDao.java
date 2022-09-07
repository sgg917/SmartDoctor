package com.fp.smartDoctor.treatment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.treatment.model.vo.RevOProom;

@Repository
public class TreatmentDao {

	public int insertOP(SqlSessionTemplate sqlSession, RevOProom op) {
		return sqlSession.insert("treatmentMapper.insertOP", op);
	}
}
