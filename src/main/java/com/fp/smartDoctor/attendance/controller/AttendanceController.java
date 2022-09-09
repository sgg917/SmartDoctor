package com.fp.smartDoctor.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.attendance.model.service.AttendanceService;
import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.google.gson.Gson;	

@Controller
public class AttendanceController {

	
	@Autowired
	private AttendanceService aService;
	
	@RequestMapping("list.att")
	public ModelAndView memberAttendance(@RequestParam(value="cpage", defaultValue="1") int currentPage, int no, ModelAndView mv) {
		
		// 근태 총 개수 조회
		Attendance a = new Attendance();
		a.setEmpNo(no);
		int listCount = aService.selectListCount(a);
		
		// 페이징 정보 변수에 담기
		PageInfo pi = new Pagination().getPageInfo(listCount, currentPage, 5, 5);
		
		// 페이지 당 나타날 근태 정보 리스트에 담기
		ArrayList<Attendance> list = aService.selectAttendance(pi, a);
		
		// 근태 리스트 담아서 포워딩
		mv.addObject("list", list).addObject("pi",pi).setViewName("lsg/memberAttendanceView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="search.att", produces="application/json; charset=utf-8")
	public String ajaxSearchAttendance(int cpage, Attendance a, HttpServletRequest request) {
		
		// 검색될 근태 총 개수 조회
		int listCount = aService.selectListCount(a);
		
		System.out.println(a);
		
		// 페이지 정보 객체에 담기
		PageInfo pi = new Pagination().getPageInfo(listCount, cpage, 5, 5);
		
		// 검색될 근태 정보 리스트에 담기
		ArrayList<Attendance> newList = aService.selectAttendance(pi, a);
		
		// 페이지, 근태 정보 돌려주기
		HashMap map = new HashMap();
		map.put("pi", pi);
		map.put("newList", newList);
		
		return new Gson().toJson(map);
	}
}
