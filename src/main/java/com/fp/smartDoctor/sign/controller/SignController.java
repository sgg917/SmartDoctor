package com.fp.smartDoctor.sign.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.attendance.model.vo.Vacation;
import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.FileUpload;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.sign.model.service.SignService;
import com.fp.smartDoctor.sign.model.vo.Form;
import com.fp.smartDoctor.sign.model.vo.Line;
import com.fp.smartDoctor.sign.model.vo.Overtime;
import com.fp.smartDoctor.sign.model.vo.Sign;
import com.google.gson.Gson;

@Controller
public class SignController {
	
	@Autowired
	private SignService sService;
	
	// 관리자_결재양식조회
	@RequestMapping("formList.si")
	public ModelAndView selectFormList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Form> list = sService.selectFormList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/formListView");
		
		return mv;
	}
	
	// 관리자_결재양식상세보기
	@RequestMapping("formDetail.si")
	public ModelAndView selectFormDetail(int formNo, ModelAndView mv) {
		
		Form f = sService.selectFormDetail(formNo);
		mv.addObject("f", f).setViewName("kma/formDetailView");
		
		return mv;
	}
	
	// 관리자_결재양식 수정
	@RequestMapping("formUpdate.si")
	public String updateForm(Form f, HttpSession session) {
		
		int result = sService.updateForm(f);
		
		if(result > 0) { // 수정 성공
			session.setAttribute("alertMsg", "결재양식이 수정되었습니다.");
			return "redirect:formDetail.si?formNo=" + f.getFormNo();
		}else {
			session.setAttribute("alertMsg", "결재양식 수정에 실패하였습니다.");
			return "redirect:formDetail.si?formNo=" + f.getFormNo();
		}
	}
	
	// 관리자_결재양식 추가페이지
	@RequestMapping("formEnrollForm.si")
	public String formEnrollForm() {
		return "kma/formInsertView";
	}
	
	// 관리자_결재양식 추가
	@RequestMapping("formInsert.si")
	public String insertForm(Form f, HttpSession session) {
		
		int result = sService.insertForm(f);
		
		if(result > 0) { // 추가 성공
			session.setAttribute("alertMsg", "결재양식이 추가되었습니다.");
			return "redirect:formList.si";
		}else { // 실패
			session.setAttribute("alertMsg", "결재양식 추가에 실패하였습니다.");
			return "redirect:formList.si";
		}
	}
	
	// 관리자_결재양식 삭제
	@RequestMapping("formDelete.si")
	public String deleteForm(int formNo, HttpSession session) {
		
		int result = sService.deleteForm(formNo);
		
		if(result > 0) { // 삭제 성공
			session.setAttribute("alertMsg", "결재양식이 삭제되었습니다.");
			return "redirect:formList.si";
		}else {
			session.setAttribute("alertMsg", "결재양식 삭제에 실패하였습니다.");
			return "redirect:formList.si";
		}
	}
	
	
	
	/*------------------------ 사용자 --------------------------------*/
	
	
	// 사용자_결재문 작성페이지
	@RequestMapping("apprEnrollForm.si")
	public String apprEnrollForm() {
		return "kma/apprEnrollForm";
	}
	
	// 사용자_결재양식 리스트 조회 (ajax)
	@ResponseBody
	@RequestMapping(value="apprFormList.si", produces="application/json; charset=UTF-8")
	public String selectApprFormList() {
		
		ArrayList<Form> list = sService.selectApprFormList();
		return new Gson().toJson(list);
	}
	
	// 사용자_결재양식 불러오기 (ajax)
	@ResponseBody
	@RequestMapping(value="apprFormDetail.si", produces="application/json; charset=UTF-8")
	public String selectApprFormDetail(int formNo) {
		
		Form f = sService.selectFormDetail(formNo);
		return new Gson().toJson(f);
	}
	
	// 사용자_결재라인 조직도 조회 (ajax)
	@ResponseBody
	@RequestMapping(value="apprLineList.si", produces="application/json; charset=UTF-8")
	public String selectApprLineList() {
		
		ArrayList<Dept> deptList = sService.selectApprLineDept();
		ArrayList<Member> empList = sService.selectApprLineList();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("deptList", deptList);
		map.put("empList", empList);
		
		return new Gson().toJson(map);
	}
	
	// 사용자_결재라인 사원 조회 (ajax)
	@ResponseBody
	@RequestMapping(value="apprLineEmp.si", produces="application/json; charset=UTF-8")
	public String selectApprEmp(int empNo) {
		
		Member m = sService.selectApprEmp(empNo);
		return new Gson().toJson(m);
	}
	
	// 사용자_결재대기함 페이지
	@RequestMapping("apprStandbyList.si")
	public ModelAndView selectApprStandbyList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		int listCount = sService.selectApprListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Sign> list = sService.selectApprStandbyList(pi, empNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/apprStandbyList");
		
		return mv;
	}
	
	// 사용자_결재요청
	@RequestMapping("apprInsert.si")
	public String insertAppr(Sign s, Line i, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/appr_files/");
			
			s.setOriginName(upfile.getOriginalFilename());
			s.setChangeName(saveFilePath);
		}
		
		ArrayList<Line> lineList = i.getLineList();
		ArrayList<Line> refList = i.getRefList();
		
		int num = 1;
		for(Line l : lineList) { // lineLevel 세팅
			l.setLineLevel(num);
			num++;
		}
		
		if(refList != null) { // 참조자가 있을 시에만 insert 요청
			sService.insertRef(refList);
		}
		
		int result = sService.insertAppr(s);
		int lineResult = sService.insertLine(lineList);
		
		if(lineResult > 0  && result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 결재요청하였습니다.");
			return "redirect:apprEnrollForm.si";
		}else {
			
			session.setAttribute("alertMsg", "결재요청에 실패하였습니다.");
			return "redirect:apprEnrollForm.si";
		}
		
	}
	
	// 사용자_연장근무신청 페이지
	@RequestMapping("apprOvertimeForm.si")
	public String overtimeEnrollForm() {
		return "kma/apprOvertimeForm";
	}
	
	// 사용자_참조문서함 페이지
	@RequestMapping("apprReferList.si")
	public ModelAndView selectApprReferList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		int listCount = sService.selectReferListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Sign> list = sService.selectApprReferList(pi, empNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/apprReferList");
		
		return mv;
	}
	
	// 사용자_참조문서함 상세보기
	@RequestMapping("apprReferDetail.si")
	public ModelAndView selectApprReferDetail(int apprNo, ModelAndView mv) {
		
		ArrayList<Line> ref = sService.selectApprRef(apprNo); // 참조자 조회
		ArrayList<Line> line = sService.selectApprLine(apprNo); // 결재자 조회
		Sign s = sService.selectApprReferDetail(apprNo);
		
		mv.addObject("s", s).setViewName("kma/apprReferDetail");
		
		return mv;
	}
	
	// 사용자_기안문서함 페이지
	@RequestMapping("apprReportList.si")
	public ModelAndView selectApprReportList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		int listCount = sService.selectReportListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Sign> list = sService.selectApprReportList(pi, empNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/apprReportList");
		
		return mv;
	}
	
	// 사용자_기안문서함 상세보기
	@RequestMapping("apprReportDetail.si")
	public ModelAndView selectApprReportDetail(int apprNo, ModelAndView mv) {
		
		ArrayList<Line> ref = sService.selectApprRef(apprNo); // 참조자 조회
		ArrayList<Line> line = sService.selectApprLine(apprNo); // 결재자 조회
		int count = sService.selectCommentCount(apprNo); // 결재의견 개수 조회
		Overtime o = sService.selectOvertime(apprNo); // 연장근무 양식일 경우 내용 담기
		Vacation v = sService.selectVacation(apprNo); // 휴가 양식일 경우 내용 담기
		Sign s = sService.selectApprReportDetail(apprNo);
		
		mv.addObject("s", s)
		  .addObject("ref", ref)
		  .addObject("line", line)
		  .addObject("count", count)
		  .addObject("o", o)
		  .addObject("v", v)
		  .setViewName("kma/apprReportDetail");
		
		return mv;
	}
	
	// 사용자_결재문서함 페이지
	@RequestMapping("apprGetList.si")
	public ModelAndView selectApprGetList(@RequestParam(value="cpage", defaultValue="1")int currentPage, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		int listCount = sService.selectGetListCount(empNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Sign> list = sService.selectApprGetList(pi, empNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/apprGetList");
		
		return mv;
	}
	
	// 사용자_결재문서함 상세보기
	@RequestMapping("apprGetDetail.si")
	public ModelAndView selectApprGetDetail(int apprNo, HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		String empNo = loginUser.getEmpNo();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("apprNo", apprNo);
		map.put("empNo", empNo);
		
		ArrayList<Line> ref = sService.selectApprRef(apprNo); // 참조자 조회
		ArrayList<Line> line = sService.selectApprLine(apprNo); // 결재자 조회
		int count = sService.selectCommentCount(apprNo); // 결재의견 개수 조회
		Overtime o = sService.selectOvertime(apprNo); // 연장근무 양식일 경우 내용 담기
		Vacation v = sService.selectVacation(apprNo); // 휴가 양식일 경우 내용 담기
		Line l = sService.selectLineLevel(map); // 내결재순번 조회
		Sign s = sService.selectApprReportDetail(apprNo);
		
		mv.addObject("s", s)
		  .addObject("ref", ref)
		  .addObject("line", line)
		  .addObject("count", count)
		  .addObject("l", l)
		  .addObject("o", o)
		  .addObject("v", v)
		  .setViewName("kma/apprGetDetail");
		
		return mv;
	}
	
	// 사용자_결재대기 문서함 상세보기
	@RequestMapping("apprStandbyDetail.si")
	public ModelAndView selectApprStandbyDetail(int apprNo, ModelAndView mv) {
		
		ArrayList<Line> ref = sService.selectApprRef(apprNo); // 참조자 조회
		ArrayList<Line> line = sService.selectApprLine(apprNo); // 결재자 조회
		int count = sService.selectCommentCount(apprNo); // 결재의견 개수 조회
		Overtime o = sService.selectOvertime(apprNo); // 연장근무 양식일 경우 내용 담기
		Vacation v = sService.selectVacation(apprNo); // 휴가 양식일 경우 내용 담기
		Sign s = sService.selectApprReportDetail(apprNo);
		
		mv.addObject("s", s)
		  .addObject("ref", ref)
		  .addObject("line", line)
		  .addObject("count", count)
		  .addObject("o", o)
		  .addObject("v", v)
		  .setViewName("kma/apprStandbyDetail");
		
		return mv;
	}
	
	// 사용자_결재하기
	@RequestMapping("approve.si")
	public String updateApprove(Line l, HttpSession session) {
		
		int apprResult = sService.updateApproval(l);
		int lineResult = sService.updateApprLine(l);

		if(apprResult > 0 && lineResult > 0) {
			
			session.setAttribute("alertMsg", "결재 승인되었습니다.");
			return "redirect:apprStandbyList.si";
		}else {
			
			session.setAttribute("alertMsg", "결재처리에 실패하였습니다.");
			return "redirect:apprStandbyList.si";
		}
	}
	
	// 사용자_반려하기
	@RequestMapping("disapprove.si")
	public String updateDisapprove(Line l, HttpSession session) {
		
		int apprResult = sService.updateDisapproval(l);
		int lineResult = sService.updateDisapprLine(l);

		if(apprResult > 0 && lineResult > 0) {
			
			session.setAttribute("alertMsg", "반려 처리되었습니다.");
			return "redirect:apprStandbyList.si";
		}else {
			
			session.setAttribute("alertMsg", "결재처리에 실패하였습니다.");
			return "redirect:apprStandbyList.si";
		}
	}
	
	// 사용자_연장근무 결재신청
	@RequestMapping("insertOvertime.si")
	public String insertApprOvertime(Line i, Sign s, Overtime o, HttpSession session) {
		
		ArrayList<Line> lineList = i.getLineList();
		ArrayList<Line> refList = i.getRefList();
		
		int num = 1;
		for(Line l : lineList) { // lineLevel 세팅
			l.setLineLevel(num);
			num++;
		}
		
		int result = sService.insertApprOvertime(s);
		int lineResult = sService.insertLine(lineList);
		int overtime = sService.insertOvertime(o);
		
		if(refList != null) { // 참조자가 있을 시에만 insert 요청
			sService.insertRef(refList);
		}
		
		if(lineResult > 0  && result > 0 && overtime > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 결재요청하였습니다.");
			return "redirect:apprOvertimeForm.si";
		}else {
			
			session.setAttribute("alertMsg", "결재요청에 실패하였습니다.");
			return "redirect:apprOvertimeForm.si";
		}
		
	}
	
	// 사용자_휴가 신청페이지
	@RequestMapping("vacationForm.si")
	public String VacationEnrollForm() {
		return "kma/vacationForm";
	}
	
	// 사용자_휴가 결재신청
	@RequestMapping("insertVacation.si")
	public String insertApprVacation(Line i, Sign s, Vacation v, HttpSession session) {
		
		ArrayList<Line> lineList = i.getLineList();
		ArrayList<Line> refList = i.getRefList();
		
		int num = 1;
		for(Line l : lineList) { // lineLevel 세팅
			l.setLineLevel(num);
			num++;
		}
		
		int result = sService.insertApprVacation(s);
		int lineResult = sService.insertLine(lineList);
		int vacResult = sService.insertVacation(v);
		
		if(refList != null) { // 참조자가 있을 시에만 insert 요청
			sService.insertRef(refList);
		}
		
		if(lineResult > 0  && result > 0 && vacResult > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 결재요청하였습니다.");
			return "redirect:vacationForm.si";
		}else {
			
			session.setAttribute("alertMsg", "결재요청에 실패하였습니다.");
			return "redirect:vacationForm.si";
		}
		
	}
	
	// 사용자_기안문서함 재기안
	@RequestMapping("againReport.si")
	public ModelAndView againReport(Sign s, Line l, ModelAndView mv) {
		
		ArrayList<Line> lineList = l.getLineList();
		System.out.println(lineList);
		mv.addObject("s", s)
		  .addObject("lineList", lineList)
		  .setViewName("kma/againReport");
		
		return mv;
	}
	
}
