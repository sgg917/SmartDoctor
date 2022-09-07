package com.fp.smartDoctor.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.fp.smartDoctor.sign.service.SignService;
import com.fp.smartDoctor.sign.model.service.SignServiceImpl;

@Controller
public class ApprFullListViewController {
	
	@Autowired
//	private SignService sService;
	private SignServiceImpl sService;
	
	@RequestMapping("fullListView.si")
	public String apprFullListView() {
		return "kma/apprFullListView";
	}
}
