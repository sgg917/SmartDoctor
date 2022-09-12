package com.fp.smartDoctor.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("list.no")
	public String selectList() {
		return "ljy/noticeListView";
	}

}
