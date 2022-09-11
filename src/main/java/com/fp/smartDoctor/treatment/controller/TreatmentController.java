package com.fp.smartDoctor.treatment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.treatment.model.service.TreatmentService;
import com.fp.smartDoctor.treatment.model.vo.ListSurgeryBooking;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.google.gson.Gson;

@Controller
public class TreatmentController {
	
	
	@Autowired 
	private TreatmentService tService;
	 
	
	@RequestMapping("exercise.jy")
	public String exercise() {
		return "ljy/page";
	}
	
	

	//입원실 예약 조회 호출
	@RequestMapping("enrollForm.pr")
	public String prEnrollForm() {
		return "kcy/revPREnrollForm";
	}
	
	
	//수술실 예약 풀캘린더 조회
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
 	
 	@ResponseBody
 	@RequestMapping(value="list.ca", produces="application/json; charset=utf-8")
 	public String selectCalendarList() {
 		List<RevOProom> calendar = tService.getCalendar();
 		return new Gson().toJson(calendar);
 	}

 	//수술실 예약 조회
	@RequestMapping("detail.op")
	public ModelAndView selectRevOProom(int no, ModelAndView mv) {
		
		ListSurgeryBooking op = tService.selectRevOProom(no);
		mv.addObject("op", op).setViewName("kcy/revORDetail");
		
		return mv;
	}

}
