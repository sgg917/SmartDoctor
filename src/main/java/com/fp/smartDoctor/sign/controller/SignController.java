package com.fp.smartDoctor.sign.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 관리자_결재양식 수정
	@RequestMapping("formUpdate.si")
	public String updateForm(Form f, HttpSession session) {
		
		int result = sService.updateForm(f);
		
		if(result > 0) { // 수정 성공
			session.setAttribute("alertMsg", "결재양식이 수정되었습니다.");
			return "redirect:formDetail.si?formNo=" + f.getFormNo();
		}else {
			session.setAttribute("alertMsg", "결재양식 수정에 실패하였습니다.");
			return "redirect:formDetail.si?formNo=" + f.getFormNo();
		}
	}
}
