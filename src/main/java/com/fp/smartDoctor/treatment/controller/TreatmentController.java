package com.fp.smartDoctor.treatment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.treatment.model.service.TreatmentService;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.google.gson.Gson;

@Controller
public class TreatmentController {
	
	
	@Autowired 
	private TreatmentService tService;
	 
	//입원실 예약 조회 호출
	@RequestMapping("enrollForm.pr")
	public String prEnrollForm() {
		return "kcy/revPREnrollForm";
	}
	
	
	//수술실 예약 풀캘린더 조회
	/*
 	@RequestMapping("enrollForm.op")
	public String getCalendarList(ModelAndView mv, HttpServletRequest request) {
		return "kcy/revOREnrollForm";
		
		
//		List<Calendar> calendar = null;
//		try {
//			calendar = mService.getCalendar();
//			request.setAttribute("calendarList", calendar);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(calendar);
//		mv.setViewName(viewpage);
//		return mv;
	}
	*/
 	
 	@ResponseBody
 	@RequestMapping(value="list.ca", produces="application/json; charset=utf-8")
 	public String selectCalendarList() {
 		List<RevOProom> calendar = tService.getCalendar();
 		return new Gson().toJson(calendar);
 	}
 	

	@RequestMapping("detail.mj")
	public String detail() {
		return "kmj/patientDetail";
	}

	
	@RequestMapping("pay.mj")
	public String pay() {
		return "kmj/page";
	}
	@RequestMapping("hospitalCalender.mj")
	public String hospitalCalender() {
		return "kmj/hospitalCalender";
	}

 	//수술실 예약 조회
	@ResponseBody
	@RequestMapping(value="detail.op", produces="application/json; charset=utf-8")
	public String selectRevOProom(int clinicNo) {
		Clinic c = tService.selectRevOProom(clinicNo);
		return new Gson().toJson(c);
		
	}
	
	//수술실 예약조회 모달 호출
	@RequestMapping("detail.op2")
    public String Modal() {
        return "kcy/revORDetail";
    }
	
	//수술실 예약조회 달력 호출
	@RequestMapping("list.op")
    public String orList() {
        return "kcy/revORList";
    }
	
	
	//수술실 예약을 위한 정보 조회
	@ResponseBody
 	@RequestMapping(value="enrollForm.op", produces="application/json; charset=utf-8")
	public ModelAndView selectforInsertRevOP(int clinicNo, ModelAndView mv) {
		
		Clinic c=tService.selectforInsertRevOP(clinicNo);
		
		mv.addObject("c", c).setViewName("kcy/revOREnrollForm");
		
		return mv;
	}

	
	// 진료화면 조회
	@RequestMapping("enroll.tmt")
	public ModelAndView enrollTreatment(Patient p, Clinic c, HttpSession session, ModelAndView mv) {
		
		// 진료할 환자의 정보 조회
		Patient nowPatient = tService.selectNowPatient(p);
		System.out.println("진료중인 환자 : " + nowPatient);
		
		if(nowPatient == null) {
			session.setAttribute("alertMsg", "진료중인 환자가 없습니다.");
			mv.setViewName("redirect:/");
		}else {
			session.setAttribute("nowPatient", nowPatient);
			mv.setViewName("ljy/enrollTreatment");
		}
		
		// 진료할 환자의 과거 내역 조회
		ArrayList<Clinic> list = tService.selectPatientInfo(nowPatient.getChartNo());
		mv.addObject("list", list)
		  .setViewName("ljy/enrollTreatment");

		return mv;
	}
	
	
	//수술실 예약 다시짜야함
	/*
	@ResponseBody
	@RequestMapping(value="insert.op", produces="application/json; charset=utf-8")
	public String insertReservation(HttpServletRequest request, HttpSession session) {
		
		String surgeryNo = request.getParameter("surgeryNo");
		String clinicNo = request.getParameter("clinicNo");
		String roomName = request.getParameter("roomName");
		String surDate = request.getParameter("surDate");
		String surEndTime = request.getParameter("surEndTime");
		String surStartTime = request.getParameter("surStartTime");
		String doctorName = request.getParameter("doctorName");
		String memo = request.getParameter("memo");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("surgeryNo", surgeryNo);
		paraMap.put("clinicNo", clinicNo);
		paraMap.put("roomName", roomName);
		paraMap.put("surDate", surDate);
		paraMap.put("surEndTime", surEndTime);
		paraMap.put("surStartTime", surStartTime);
		paraMap.put("doctorName", doctorName);
		paraMap.put("memo", memo);
		
		// 입력받은 일시가 중복된 날짜인지 검사
		int overlap = tService.checkOverlapRsv(paraMap);
		
		JSONObject jsonObj = new JSONObject();
		if (overlap != 0) {
			// 사용자가 선택한 시간대에 이미 예약이 있을 경우
			jsonObj.put("n", -1);
			session.setAttribute("alertMsg", "이미 예약이 있습니다.");
			
			return jsonObj.toString();
			
		}else {
			// 예약이 가능한 경우 예약테이블에 데이터 insert 진행
			int n = tService.insertReservation(paraMap);
			jsonObj.put("n", n);
			session.setAttribute("alertMsg", "수술실 예약에 성공했습니다.");
			return jsonObj.toString();
		}
	}
	*/
	
	
	//수술실 예약 중복 막기
	@ResponseBody
	@RequestMapping(value="overlap.op", produces="application/json; charset=utf-8")
	public String chOverlap(String surgeryRoom, String surDate, HttpSession session) {
		
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("surgeryRoom", surgeryRoom);
		paraMap.put("surDate", surDate);
		
		ArrayList<Clinic> c = tService.blockOverlap(paraMap);
		
		return new Gson().toJson(c);
		
	}
	
	
	//수술예약 취소
	@RequestMapping("cancel.op")
	public String cslRsvOP(int no, Model model, HttpSession session) {
		
		int result = tService.cslRsvOP(no);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "수술실 예약이 취소되었습니다.");
			return "redirect:/";
			
		}else {
			model.addAttribute("errorMsg", "예약 취소 실패");
			return "common/errorPage";
		}
		
	}
}
