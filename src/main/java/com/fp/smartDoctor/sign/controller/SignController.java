package com.fp.smartDoctor.sign.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.common.model.vo.PageInfo;
import com.fp.smartDoctor.common.template.Pagination;
import com.fp.smartDoctor.sign.model.service.SignService;
import com.fp.smartDoctor.sign.model.vo.Form;

@Controller
public class SignController {
	
	@Autowired
	private SignService sService;
	
	// 관리자_결재양식조회
	@RequestMapping("formList.si")
	public ModelAndView selectFormList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Form> list = sService.selectFormList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("kma/formListView");
		
		return mv;
	}
	
	// 관리자_결재양식상세보기
	@RequestMapping("formDetail.si")
	public ModelAndView selectFormDetail(int formNo, ModelAndView mv) {
		
		Form f = sService.selectFormDetail(formNo);
		mv.addObject("f", f).setViewName("kma/formDetailView");
		
		return mv;
	}
}
