package com.fp.smartDoctor.messenger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.smartDoctor.messenger.model.service.MessengerService;

@Controller
public class MessengerController {

	@Autowired 
	private MessengerService mService;
	
	@RequestMapping("enroll.em")
	public String enrollEmail() {
		return "kcy/mailMailEnrollForm";
	}
	
	
 	
 	
	 	
	 	
	 	
	
}
