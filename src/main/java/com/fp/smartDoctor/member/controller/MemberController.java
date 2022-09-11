package com.fp.smartDoctor.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.member.model.service.MemberService;
import com.fp.smartDoctor.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired 
	private MemberService mService;
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public String loginMember() {
		return "ljy/loginMember";
	}
	
	
	@RequestMapping("enter.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		System.out.println(loginUser);
		
		if(loginUser == null) { //로그인실패
			System.out.println("로그인 실패");
		}else { //로그인성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("ljy/login");
		}
		return mv;
	}
	
	
}
