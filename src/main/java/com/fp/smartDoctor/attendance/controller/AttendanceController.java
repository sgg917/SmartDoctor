package com.fp.smartDoctor.attendance.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.attendance.model.service.AttendanceService;
import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;

@Controller
public class AttendanceController {

	
	@Autowired
	private AttendanceService aService;
	
	@RequestMapping("list.att")
	public ModelAndView memberAttendance(@RequestParam(value="cpage", defaultValue="1") int currentPage, int no, ModelAndView mv) {
		
		// 근태 총 개수 조회
		int listCount = aService.selectListCount(no);
		
		// 페이징 정보 변수에 담기
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount, currentPage, 5, 5);
		
		// 페이지 당 나타날 근태 리스트 변수에 담기
		ArrayList<Attendance> list = aService.selectAttendance(pi, no);
		
		System.out.println(pi);
		System.out.println(list);
		
		// 근태 리스트 담아서 포워딩
		mv.addObject("list", list).addObject("pi",pi).setViewName("lsg/memberAttendanceView");
		
		return mv;
	}
}
