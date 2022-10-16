package com.fp.smartDoctor.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.attendance.model.service.AttendanceService;
import com.fp.smartDoctor.attendance.model.vo.Attendance;
import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.member.model.service.MemberService;
import com.fp.smartDoctor.member.model.vo.Member;
import com.google.gson.Gson;	

@Controller
public class AttendanceController {

	
	@Autowired
	private AttendanceService aService;
	private MemberService mService;
	
	// 출퇴근 관리 페이지 조회
	@RequestMapping("list.att")
	public ModelAndView selectAttendanceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, int no, ModelAndView mv) {
		
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
		
		// 페이징 없이 전체 근태 정보 리스트에 담기
		ArrayList<Attendance> alist = aService.selectAttendance(a);
		
		// 정상, 지각, 조퇴, 결근 횟수 변수에 담기
		int y = 0; int l = 0; int e = 0; int n = 0;
		
		for(Attendance i : alist) {
			switch(i.getStatus()) {
				case "정상" : y++; break;
				case "지각" : l++; break;
				case "휴가" : e++; break;
				case "결근" : n++; break;
			}
		}
		
		// 근태 리스트, 페이징 정보, 근태 상태 별 횟수 담아서 포워딩
		mv.addObject("list", list).addObject("pi",pi)
		.addObject("y", y).addObject("l", l).addObject("e", e).addObject("n", n)
		.setViewName("lsg/attendanceListView");
		
		return mv;
	}
	
	// 근태 검색
	@ResponseBody
	@RequestMapping(value="search.att", produces="application/json; charset=utf-8")
	public String ajaxSearchAttendance(int cpage, Attendance a, HttpServletRequest request) {
		
		// 검색될 근태 총 개수 조회
		int listCount = aService.selectListCount(a);
		
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
		
		// 출근 insert
		int result = aService.insertAttendance(no);
		
		if(result > 0) {
		// 출근 성공 시 => 출근 시간 담아서 리턴
			String startTime = aService.selectStartTime(no);
			
			return startTime;
		}else {
		// 출근 실패 시 => 출근 등록 실패 alert
			return "출근 등록에 실패했습니다.";
		}
	}
	
	// 퇴근
	@RequestMapping("end.att")
	public String endAttendance(int no, HttpServletRequest request) {
		
		// 퇴근시간, 근태 상태 update 결과 담기
		int result = aService.endAttendance(no);
		
		if(result > 0) {
		// 퇴근 성공 시 => 출퇴근 관리 페이지 url 재요청
			return "redirect:list.att?no=" + no;
		}else {
		// 퇴근 실패 시 => 에러 페이지 포워딩
			request.setAttribute("errorMsg", "퇴근 등록에 실패하였습니다.");
			return "common/errorPage";
		}
			
	}
	
	// 휴가 관리 페이지
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
		
		// 휴가 리스트, 잔여일수, 페이징 정보 담아서 리턴
		mv.addObject("pi", pi).addObject("list", list).addObject("vacRemain", vacRemain)
		.setViewName("lsg/vacationListView");
		
		return mv;
	}
	
	// 월간 근태 체크 페이지로 이동
	@RequestMapping("goCalendar.att")
	public String goAttendanceCalendar() {
		return "lsg/attendanceCalendar";
	}
	
	// 월간 근태 리스트 조회
	@ResponseBody
	@RequestMapping(value="calendar.att", produces="application/json; charset=utf-8")
	public String attendanceCalendar(Attendance a) {
		
		// 근태 리스트 조회
		ArrayList<Attendance> list = aService.selectAttendance(a);
		
		// 리스트를 Map에 담아서 리턴
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	// 사원 근태 관리 페이지 조회
	@RequestMapping("allList.att")
	public ModelAndView selectAllAttendanceList(@RequestParam(value="cpage", defaultValue="1")int cpage, ModelAndView mv) {
		
		// 전사 근태 개수 조회
		int listCount = aService.selectAllListCount();
		
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount,  cpage, 5, 10);
		
		// 전사 근태 리스트 조회
		ArrayList<Attendance> list = aService.selectAllAttendanceList(pi);
		
		// 전사 근태 리스트, 페이징 정보 담아서 리턴
		mv.addObject("pi", pi).addObject("list", list)
		.setViewName("lsg/allAttendanceListView");
		
		return mv;
	}
	
	// 근태 정보 수정
	@RequestMapping("update.att")
	public String updateAttendance(Attendance a, HttpSession session, Model model) {
		
		// 근태 update
		int result = aService.updateAttendance(a);
		
		if(result > 0) {
		// 근태 update 성공 시	=> 성공 alert 문구를 담아서 url 재요청
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:allList.att";
		}else {
		// 근태 update 실패 시 => 실패 문구를 담아서 에러페이지 포워딩
			model.addAttribute("errorMsg", "근태 수정에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 전사 근태 검색
	@ResponseBody
	@RequestMapping(value="allSearch.att", produces="application/json; charset=utf-8")
	public String ajaxSearchAllAttendance(int cpage, String type, String keyword) {
		
		// 전달받아온 검색 종류, 키워드 담기
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("type", type);
		hm.put("keyword", keyword);
		
		// 페이징 정보 담기
		int listCount = aService.ajaxSearchAttListCount(hm);
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount, cpage, 5, 10);
		
		// 검색 리스트 조회
		ArrayList<Attendance> list = aService.ajaxSearchAttendance(pi, hm);
		
		// 검색 리스트, 페이징 정보 담아서 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	// 전사 휴가리스트
	@RequestMapping("allList.vac")
	public ModelAndView selectAllVacationList(@RequestParam(value="cpage", defaultValue="1")int cpage, ModelAndView mv) {
		
		// 병원장을 제외한 사원 수
		int listCount = aService.selectMemListCount() - 1;
		
		// 사원 리스트 페이징 정보
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount, cpage, 5, 10);
		
		// 사원 리스트
		ArrayList<Member> list = aService.selectMemberList(pi);
		
		// 사원들의 잔여 휴가일
		ArrayList<Vacation> vacList = aService.selectMemVacRemain();
		
		// 페이징 정보, 사원 리스트, 잔여 휴가일 담아서 리턴
		mv.addObject("pi", pi).addObject("list", list).addObject("vacList", vacList)
		.setViewName("lsg/allVacationListView");
		return mv;
	}
	
	// 한 사원의 휴가리스트
	@ResponseBody
	@RequestMapping(value="memList.vac", produces="application/json; charset=utf-8")
	public String ajaxselectVacationList(int no) {
		
		// 한 사원의 휴가리스트 조회
		ArrayList<Vacation> list = aService.selectVacationList(no);
		
		return new Gson().toJson(list);
	}
	
	// 사원 검색
	@ResponseBody
	@RequestMapping(value="search.vac", produces="application/json; charset=utf-8")
	public String ajaxSearchVacationList(@RequestParam(value="cpage", defaultValue="1")int cpage, String type, String keyword) {
		
		// 전달받아온 검색 종류, 키워드 담기
		HashMap<String, String> hm = new HashMap<>();
		hm.put("type", type);
		hm.put("keyword", keyword);
		
		// 검색 결과 사원 수
		int listCount = aService.ajaxSearchListCount(hm);
		
		// 사원 페이징 정보
		PageInfo pi = new PageInfo();
		pi = new Pagination().getPageInfo(listCount, cpage, 5, 10);
		
		// 검색 결과 사원 리스트
		ArrayList<Member> list = aService.ajaxSearchList(pi, hm);
		
		// 사원들의 잔여 휴가일
		ArrayList<Vacation> vlist = aService.selectMemVacRemain();
		
		// 페이징 정보, 사원 리스트, 잔여 휴가일 담아서 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		map.put("vlist",  vlist);
		
		return new Gson().toJson(map);
		
	}
}
