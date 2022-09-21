package com.fp.smartDoctor.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.fp.smartDoctor.member.model.vo.Member;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if( ((Member)session.getAttribute("loginUser")).getStatus().equals("A") ) {
			// 관리자 => 정상적으로 컨트롤러 실행
			return true;
		}else {
			// 관리자를 제외한 모든 사원들 => 컨트롤러 실행 x, 이전 페이지 리다이렉트
			session.setAttribute("alertMsg", "접근 권한이 없습니다.");
			String referer = request.getHeader("Referer");
			response.sendRedirect(referer);
			return false;
		}
	}
}
