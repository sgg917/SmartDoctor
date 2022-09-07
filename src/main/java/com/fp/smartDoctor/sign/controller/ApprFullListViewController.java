package com.fp.smartDoctor.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.smartDoctor.sign.service.SignService;

@Controller
public class ApprFullListViewController {
	
	@Autowired
	private SignService sService;
	
	@RequestMapping("fullListView.si")
	public String apprFullListView() {
		return "kma/apprFullListView";
	}
}
