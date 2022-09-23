package com.fp.smartDoctor.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fp.smartDoctor.common.template.FileUpload;
import com.fp.smartDoctor.member.model.service.MemberService;
import com.fp.smartDoctor.member.model.vo.Dept;
import com.fp.smartDoctor.member.model.vo.Member;
import com.google.gson.Gson;

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
	public String goOrgChart() {
		return "lsg/organizationChartView";
	}
	
	// 조직도 구현
	@ResponseBody
	@RequestMapping(value="select.org", produces="application/json; charset=utf-8")
	public String ajaxSelectOrganization() {
		// 조직도 부서 조회
		ArrayList<Dept> dlist = mService.selectOrgChartDept();
		
		// 조직도 사원 조회
		ArrayList<Member> mlist = mService.selectOrgChartEmp();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("dlist", dlist);
		map.put("mlist", mlist);
		
		return new Gson().toJson(map);
	}
	
	// 조직도 부서별 사원
	@ResponseBody
	@RequestMapping(value="select.me", produces="application/json; charset=utf-8")
	public String ajaxSelectMember(Dept d) {
		
		//System.out.println(d);
		// 부서별 사원 수 조회
		int listCount = mService.selectEmpCount(d);
		
		// 부서별 사원 조회
		ArrayList<Member> list = mService.selectEmp(d);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("listCount", listCount);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	// 조직도 수정 페이지 호출
	@RequestMapping("adOrgChart.me")
	public String goAdOrgChart() {
		return "lsg/AdminOrganizationChartView";
	}

	// 직원가입 페이지 호출
	@RequestMapping("enroll.me")
	public String enrollForm() {
		return "ljy/memberEnrollForm";
	}
	
	// 직원 가입하기 
	@RequestMapping("insert.me")
	public String insertMember(String empNo, Member m, HttpSession session, MultipartFile upfile) {
		
		String currentTime = new SimpleDateFormat("YYMM").format(new Date());
		int ranNum = (int)(Math.random() * 9000 + 1000);
		String changeEmpNo = currentTime + ranNum;
		
		String newEmail = changeEmpNo + "@smartdoctor.com";
			
		m.setEmpNo(changeEmpNo);
		m.setEmpPwd(changeEmpNo);
		m.setEmail(newEmail);
		
		String saveFilepath = FileUpload.saveFile(upfile, session, "resources/profile_images/");
		m.setOriginName(upfile.getOriginalFilename());
		m.setPath(saveFilepath);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			// insert 성공
			
			// 관리자로 가입되었는지 확인
			if(m.getDeptNo() == 4 && (m.getJobNo() == 6 || m.getJobNo() == 7)) {
				int result2 = mService.updateAdmin(m);
				
				if(result2 > 0) {
					// 관리자 승격 성공
					session.setAttribute("alertMsg", "관리자로 가입되었습니다.");
					return "redirect:/";
				}
			}
			
			session.setAttribute("alertMsg", "성공적으로 가입되었습니다.");
			return "redirect:/";
		}else {
			session.setAttribute("errorMsg", "가입 실패");
			return "ljy/memberEnrollForm";
		}
		
	}
	
	// 사원 퇴사
	@RequestMapping("deleteEmp.me")
	public String deleteEmp(String empNo, HttpSession session, Model model) {
		
		System.out.println("empNo : " + empNo);
		
		// 사원 삭제 update
		int result = mService.deleteEmp(empNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:adOrgChart.me";
		}else {
			model.addAttribute("errorMsg", "사원 삭제에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 사원 정보 수정
	@ResponseBody
	@RequestMapping(value="updateEmp.me", produces="text/html; charset=utf-8")
	public String updateEmp(Member m) {
		//System.out.println(m);
		// 사원 정보 수정 update
		int result = mService.updateEmp(m);
		
		// 기존의 페이지에 문자열 전해주기
		return result > 0 ? "성공적으로 수정되었습니다." : "사원 정보 수정에 실패하였습니다.";
	}
	
	// 부서명 수정
	@ResponseBody
	@RequestMapping(value="update.de", produces="text/html; charset=utf-8")
	public String updateDept(Dept d) {
		
		// 부서명 수정 update
		int result = mService.updateDept(d);
		
		return result > 0 ? "성공적으로 수정되었습니다." : "부서명 수정에 실패하였습니다.";
	}
	
	// 부서 삭제
	@ResponseBody
	@RequestMapping(value="delete.de", produces="text/html; charset=utf-8")
	public String deleteDept(int deptNo) {
		
		// 부서명 수정 update
		int result = mService.deleteDept(deptNo);
		
		return result > 0 ? "삭제 완료되었습니다." : "부서 삭제에 실패하였습니다.";
	}
	
	// 부서 추가
	@ResponseBody
	@RequestMapping(value="insert.de", produces="text/html; charset=utf-8")
	public String insertDept(String deptName) {
		
		// 부서 추가 insert
		int result = mService.insertDept(deptName);
		
		return result > 0 ? "성공적으로 추가되었습니다." : "부서 추가에 실패하였습니다.";
	}
}
