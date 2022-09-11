package com.fp.smartDoctor.treatment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.treatment.model.service.TreatmentService;
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
	
	

	
	@RequestMapping("enrollForm.pr")
	public String prEnrollForm() {
		return "kcy/revPREnrollForm";
	}
	
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


}
