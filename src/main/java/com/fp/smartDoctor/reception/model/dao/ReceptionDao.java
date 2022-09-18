package com.fp.smartDoctor.reception.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.treatment.model.vo.Patient;

@Repository
public class ReceptionDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("receptionMapper.selectListCount");
	}
	
	public ArrayList<Patient> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit); // offset만큼 건너뛰고 limit만큼 조회하겠다.
		
		return (ArrayList)sqlSession.selectList("receptionMapper.selectList", null, rowBounds); // 부모클래스인 list로 반환해주기때문에 다운캐스팅 필요
	}
	
	public int insertPatient(SqlSessionTemplate sqlSession, Patient p) {
		return sqlSession.insert("receptionMapper.insertPatient", p);
	}
	
	public Patient selectPatient(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.selectOne("receptionMapper.selectPatient", chartNo);
	}
	
	public ArrayList<Dept> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectDeptList");
	}
	
	public ArrayList<Member> selectProfList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receptionMapper.selectProfList");
	}
}
