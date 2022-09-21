package com.fp.smartDoctor.treatment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.treatment.model.service.TreatmentService;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;
import com.google.gson.Gson;

@Controller
public class TreatmentController {
	
	
	@Autowired 
	private TreatmentService tService;
	 
		
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
	public ModelAndView enrollTreatment(Patient p, Clinic c, Disease d, HttpSession session, ModelAndView mv) {
		
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
		
		// 질병 리스트 조회
		ArrayList<Disease> dList = tService.selectDiseaseList();
		mv.addObject("dList", dList).setViewName("ljy/enrollTreatment");
		
		// 수술 전체 리스트 조회
		ArrayList<Surgery> sList = tService.selectSurgeryList();
		mv.addObject("sList", sList).setViewName("ljy/enrollTreatment");
		
		// 약 전체 리스트 조회
		ArrayList<Medicine> mList = tService.selectMedList();
		mv.addObject("mList", mList).setViewName("ljy/enrollTreatment");

		return mv;
	}
	
	
	//수술실 예약
	@ResponseBody
	@RequestMapping(value="insert.op", produces="application/json; charset=utf-8")
	public ModelAndView insertReservation(HttpServletRequest request, HttpSession session,ModelAndView mv) {
		
		String surgeryNo = request.getParameter("surgeryNo");
		String clinicNo = request.getParameter("clinicNo");
		String roomName = request.getParameter("roomName");
		String surDate = request.getParameter("surDate");
		String surEndTime = request.getParameter("surEndTime");
		String surStartTime = request.getParameter("surStartTime");
		String patientName = request.getParameter("patientName");
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
		paraMap.put("patientName", patientName);
		
		int result = tService.insertReservation(paraMap);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수술실 예약이 완료되었습니다.");
			mv.setViewName("redirect:/");
			//예약한 다음 수술실 예약 페이지 이전페이지로 이동 시킬것임 수정해야 함
		}else {
			session.setAttribute("errorMsg", "수술실 예약에 실패하였습니다.");
			mv.setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	
	//수술실 예약
	/*
	@RequestMapping("insert.op")
	public String insertNotice(Clinic c, HttpSession session, Model model) {
		
		int result = tService.insertRsv(c);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수술실 예약이 완료되었습니다.");
			return "redirect:enrollForm.op";
		}else {
			model.addAttribute("errorMsg", "수술실 예약에 실패하였습니다.");
			return "common/errorPage";
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
	
	
	
	
	
	
	
	
	
	
 	//입원실 달력 정보조회
 	@ResponseBody
 	@RequestMapping(value="list.cp", produces="application/json; charset=utf-8")
 	public String selectpCalendarList() {
 		List<RevOProom> calendar = tService.getCalendar();
 		return new Gson().toJson(calendar);
 	}
 	

 	//입원실 예약 조회
	@ResponseBody
	@RequestMapping(value="detail.pr", produces="application/json; charset=utf-8")
	public String selectRevProom(int clinicNo) {
		Clinic c = tService.selectRevOProom(clinicNo);
		return new Gson().toJson(c);
		
	}
	
	//입원실 예약조회 모달 호출
	@RequestMapping("detail.pr2")
    public String Modal2() {
        return "kcy/revORDetail";
    }

	
	//입원실 예약조회 달력 호출
	@RequestMapping("list.pr")
    public String prList() {
        return "kcy/revORList";
    }
	
	
	//입원실 예약을 위한 정보 조회
	@ResponseBody
 	@RequestMapping(value="enrollForm.pr", produces="application/json; charset=utf-8")
	public ModelAndView selectforInsertRevP(int clinicNo, ModelAndView mv) {
		
		Clinic c=tService.selectforInsertRevOP(clinicNo);
		
		mv.addObject("c", c).setViewName("kcy/revPREnrollForm");
		
		return mv;
	}

	
	
	//입원실 예약
	@ResponseBody
	@RequestMapping(value="insert.pr", produces="application/json; charset=utf-8")
	public ModelAndView insertpr(HttpServletRequest request, HttpSession session,ModelAndView mv) {
		
		String surgeryNo = request.getParameter("surgeryNo");
		String clinicNo = request.getParameter("clinicNo");
		String roomName = request.getParameter("roomName");
		String surDate = request.getParameter("surDate");
		String surEndTime = request.getParameter("surEndTime");
		String surStartTime = request.getParameter("surStartTime");
		String patientName = request.getParameter("patientName");
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
		paraMap.put("patientName", patientName);
		
		int result = tService.insertReservation(paraMap);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수술실 예약이 완료되었습니다.");
			mv.setViewName("redirect:/");
			//예약한 다음 수술실 예약 페이지 이전페이지로 이동 시킬것임 수정해야 함
		}else {
			session.setAttribute("errorMsg", "수술실 예약에 실패하였습니다.");
			mv.setViewName("common/errorPage");
			return mv;
		}
		
		return mv;
	}
	
	
	@RequestMapping("insert.tmt")
	public String insertTreatment(Clinic c) {
		
		int clinicResult = tService.updateClinic(c);
		
	}
	
	
	

	
	

}
