package com.fp.smartDoctor.treatment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.smartDoctor.treatment.model.service.TreatmentService;

@Controller
public class TreatmentController {
	
	/*
	 * @Autowired private TreatmentService tService;
	 */
	
	
	@RequestMapping("enrollForm.op")
	public String enrollForm() {
		return "kcy/revOREnrollForm";
	}
	
	 


}
