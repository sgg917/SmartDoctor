package com.fp.smartDoctor.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;

@Repository
public class AttendanceDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("attendanceMapper.selectListCount", no);
	}

	public ArrayList<Attendance> selectAttendance(SqlSessionTemplate sqlSession, PageInfo pi, int no){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttendance", no, rowBounds);
		
	}
}
