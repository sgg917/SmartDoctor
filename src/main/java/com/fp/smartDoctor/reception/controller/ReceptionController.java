package com.fp.smartDoctor.reception.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReceptionController {
	
	@RequestMapping("reception.mj")
	public String reception() {
		return "kmj/reception";
	}
	
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
}
