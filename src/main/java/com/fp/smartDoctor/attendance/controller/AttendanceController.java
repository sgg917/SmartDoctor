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
import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.google.gson.Gson;	

@Controller
public class AttendanceController {

	
	@Autowired
	private AttendanceService aService;
	
	// 근태 리스트 조회
	@RequestMapping("list.att")
	public ModelAndView memberAttendance(@RequestParam(value="cpage", defaultValue="1") int currentPage, int no, ModelAndView mv) {
		
		// 근태 객체에 사번 담기
		Attendance a = new Attendance();
		a.setEmpNo(no);
		
		// 한 사원의 근태 총 개수 조회
		int listCount = aService.selectListCount(a);
		
		//System.out.println(listCount);
		// 페이징 정보 변수에 담기
		PageInfo pi = new Pagination().getPageInfo(listCount, currentPage, 5, 5);
		
		// 페이지 당 나타날 근태 정보 리스트에 담기
		ArrayList<Attendance> list = aService.selectAttendance(pi, a);
		
		// 정상, 지각, 조퇴, 결근 횟수 변수에 담기
		int y = 0; int l = 0; int e = 0; int n = 0;
		
		for(Attendance i : list) {
			switch(i.getStatus()) {
			case "Y" : y++; break;
			case "L" : l++; break;
			case "E" : e++; break;
			case "N" : n++; break;
			}
		}
		
		//System.out.println("Y : " + y + ", L : " + l + ", E : " + e + ", N : " + n);
		
		// 근태 리스트, 페이징 정보, 근태 상태 별 횟수 담아서 포워딩
		mv.addObject("list", list).addObject("pi",pi)
		.addObject(y).addObject(l).addObject(e).addObject(n)
		.setViewName("lsg/memberAttendanceView");
		
		return mv;
	}
	
	// 근태 검색
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
	
	// 출퇴근 여부
	@ResponseBody
	@RequestMapping(value="check.att", produces="application/json; charset=utf-8")
	public String checkAttendance(int no) {
		
		// 출근 시간 담은 문자열 변수 (출근 안 했으면 NULL)
		String start = aService.selectStartTime(no);
		
		// 퇴근 시간 담은 문자열 변수 (퇴근 안 했으면 NULL)
		String end = aService.selectEndTime(no);
		
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
	
	// 출근
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
	
	// 퇴근
	@RequestMapping("end.att")
	public String endAttendance(int no, HttpServletRequest request) {
		
		//System.out.println(a);
		
		// 퇴근 update 결과 담기
		int result = aService.endAttendance(no);
		
		if(result > 0) {
			
			return "redirect:list.att?no=" + no;
			
		}else {
			
			request.setAttribute("errorMsg", "퇴근 등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 휴가 리스트 조회
	@RequestMapping("list.vac")
	public ModelAndView selectVacationList(@RequestParam(value="cpage", defaultValue="1")int cpage, int no, ModelAndView mv) {
		
		// 휴가 총 개수 조회
		int listCount = aService.selectVacListCount(no);
		
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount, cpage, 5, 5);
		
		// 휴가 리스트 조회
		ArrayList<Vacation> list = aService.selectVacationList(pi, no);
		
		// 휴가 잔여일수 조회
		int vacRemain = aService.selectVacRemain(no);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("vacRemain", vacRemain)
		.setViewName("lsg/vacationListView");
		
		//System.out.println(listCount);
		//System.out.println(pi);
		//System.out.println(list);
		
		return mv;
	}
	
}
