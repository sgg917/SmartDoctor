package com.fp.smartDoctor.reception.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.fp.smartDoctor.reception.model.service.ReceptionService;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.google.gson.Gson;

@Controller
public class ReceptionController {
	
	@Autowired
	private ReceptionService rService;
	
	@ResponseBody
	@RequestMapping(value= "list.pt", produces="apllication/json; charset=utf-8")
	public String ajaxSelectReplyList(@RequestParam(value="cpage", defaultValue="1") int currentPage) {
		int listCount = rService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Patient> list = rService.selectList(pi);
		return new Gson().toJson(list); // "[{}, {}, {} ..]"
	}
	
	
	@RequestMapping("reception.mj")
	public String reception(Model model) {
		
		ArrayList<Dept> deptList = rService.selectDeptList();
		ArrayList<Member> profList = rService.selectProfList();
		System.out.println(deptList);
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("profList", profList);
		
		return "kmj/reception";
	}
	
	
	/*
	@RequestMapping("reception.mj")
	public String reception() {
		ArrayList<Dept> deptList = rService.selectDeptList();
		System.out.println(deptList);
		return "kmj/reception";
	}
	*/
	
	@RequestMapping("detail.mj")
	public String detail() {
		return "kmj/patientDetail";
	}
	
	@RequestMapping("hospitalCalender.mj")
	public String hospitalCalender() {
		return "kmj/hospitalCalender";
	}
	
	@RequestMapping("personalCalender.mj")
	public String personalCalender() {
		return "kmj/personalCalender";
	}
	
	@RequestMapping("rsvWaiting.mj")
	public String rsvWaiting() {
		return "kmj/rsvWaiting";
	}
	
	@RequestMapping("room.mj")
	public String room() {
		return "kmj/room";
	}
	
	@RequestMapping("pay.mj")
	public String pay() {
		return "kmj/payWaiting";
	}
	
	@RequestMapping("payDone.mj")
	public String payDone() {
		return "kmj/payDone";
	}
	
	@RequestMapping("insert.pt")
	public String insertPatient(Patient p, HttpSession session, Model model) {
		
		// 넘어온 첨부파일이 없을 경우 b : 제목, 작성자, 내용
		// 넘어온 첨부파일이 있을 경우 b : 제목, 작성자, 내용, 파일원본명, 파일저장경로
		System.out.println(p);
		
		int result = rService.insertPatient(p);
		
		if(result > 0) { // 성공 => alert, 게시글 리스트페이지
			session.setAttribute("alertMsg", "성공적으로 환자 등록되었습니다.");
			return "redirect:reception.mj";
		}else { // 실패 => 에러문구, 에러페이지
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("select.pt")
	public ModelAndView selectBoard(int chartNo, ModelAndView mv) {
		
		
		Patient p = rService.selectPatient(chartNo);
		String beforeFV = p.getFirstVisit();
		p.setFirstVisit(beforeFV.substring(0,11));
		String beforeLV = p.getLastVisit();
		p.setLastVisit(beforeLV.substring(0,11));
		
		if(p != null) {
			mv.addObject("p",p).setViewName("kmj/reception");
			
		}else {
			mv.addObject("errorMsg", "환자 선택 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
