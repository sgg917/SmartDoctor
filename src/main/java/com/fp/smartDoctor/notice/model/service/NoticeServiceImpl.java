package com.fp.smartDoctor.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.notice.model.dao.NoticeDao;
import com.fp.smartDoctor.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nDao;

	// 게시글 총 갯수 세기
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}
	
	// 공지사항 리스트 조회
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
	}

	// 공지사항 작성하기
	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	// 공지사항 조회수 증가
	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}

	// 공지사항 상세조회
	@Override
	public Notice selectNotice(int noticeNo) {
		return nDao.selectNotice(sqlSession, noticeNo);
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}

	// 공지사항 수정
	@Override
	public int updateNotice(Notice n) {
		return nDao.updateNotice(sqlSession, n);
	}

	// 공지사항 검색 글 총 갯수 세기
	@Override
	public int selectSearchCount(String keyword) {
		return nDao.selectSearchCount(sqlSession, keyword);
	}

	// 공지사항 검색 글 리스트 조회
	@Override
	public ArrayList<Notice> selectSearchList(String keyword, PageInfo pi) {
		return nDao.selectSearchList(sqlSession, keyword, pi);
	}

	// 메인 공지사항 조회수 상위 5개 조회
	@Override
	public ArrayList<Notice> selectTopNoticeList() {
		return nDao.selectTopNoticeList(sqlSession);
	}
	
}
