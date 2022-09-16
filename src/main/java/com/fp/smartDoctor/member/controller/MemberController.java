package com.fp.smartDoctor.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.member.model.service.MemberService;
import com.fp.smartDoctor.member.model.vo.Dept;
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
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("changePwd.me")
	public String changePwd() {
		return "ljy/changePwd";
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m, String updatePwd, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(m.getEmpPwd().equals( loginUser.getEmpPwd())) { //로그인한 사람의 비번과 현재입력한비밀번호가 맞을 때 => 변경가능
			
			m.setEmpPwd(updatePwd);
			
			int result = mService.updatePwd(m);
			
			if(result > 0) { //비밀번호 변경 성공
				session.setAttribute("loginUser", mService.loginMember(m));
				session.setAttribute("alertMsg", "비밀번호 변경 성공!");
				return "redirect:/";
				
			}else { //비밀번호 변경실패
				System.out.println("비밀번호변경실패");
				return "redirect:changePwd.me";
			}
			
		}else {
			session.setAttribute("alertMsg", "현재 비밀번호가 틀렸습니다. 다시 입력해주세요!");
			return "redirect:changePwd.me";
		}
	}
	
	@RequestMapping("orgChart.me")
	public ModelAndView selectOrganization(ModelAndView mv) {
		
		// 조직도 부서 조회
		ArrayList<Dept> dlist = mService.selectOrgChartDept();
		
		// 조직도 사원 조회
		ArrayList<Member> mlist = mService.selectOrgChartEmp();
		
		mv.addObject("dlist", dlist).addObject("mlist", mlist)
		.setViewName("lsg/organizationChartView");
		
		return mv;
	}
	
}
