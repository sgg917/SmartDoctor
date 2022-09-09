package com.fp.smartDoctor.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;

@Repository
public class AttendanceDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.selectOne("attendanceMapper.selectListCount", a);
	}

	public ArrayList<Attendance> selectAttendance(SqlSessionTemplate sqlSession, PageInfo pi, Attendance a){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttendance", a, rowBounds);
		
	}
}
