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
		
		//System.out.println(a);
		
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
	
	@ResponseBody
	@RequestMapping(value="insert.att", produces="text/html; charset=utf-8")
	public String insetAttendance(int no) {
		
		int result = aService.insertAttendance(no);
		
		if(result > 0) {
			
			String startTime = aService.selectStartTime(no);
			
			return startTime;
		}else {
			return "출근 등록에 실패했습니다.";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="check.att", produces="application/json; charset=utf-8")
	public String checkAttendance(int no) {
		
		// 출근 여부 확인 결과를 담은 문자열 변수 (출근했으면 출근시간, 안 했으면 NULL)
		String start = aService.checkStartTime(no);
		
		// 퇴근 여부 확인 결과를 담은 문자열 변수 (퇴근했으면 퇴근시간, 안 했으면 NULL)
		String end = aService.checkEndTime(no);
		
		// 리턴할 값을 담을 변수
		String attResult = "";
		
		// 출퇴근 여부와 출퇴근 시간 객체에 담아서 전달
		Attendance check = new Attendance();
		
		if(start != null && end != null) {
		// 출근도 하고, 퇴근도 했을 경우 == "YY"
			attResult = "YY";
			check.setStartTime(start);
			check.setEndTime(end);
				
		}else if(start != null && end == null) {
		// 출근은 했는데 퇴근을 안 한 경우 == "YN"
			attResult = "YN";
			check.setStartTime(start);
		}else {
		// 출퇴근 모두 안 한 경우 == "NN"
			attResult = "NN";
		}
		
		check.setAttResult(attResult);
		
		return new Gson().toJson(check);
		
	}
}
