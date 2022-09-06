package com.fp.smartDoctor.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	/*
	 * Interceptor (정확히는 HandlerInterceptor)
	 * -해당 컨트롤러가 실행되기 전, 실행 된 후에 낚아 채서 실행할 내용 작성 가능
	 * -로그인 여부에 대한 판단, 회원의 권한 체크 할 때 주로 사용
	 * 
	 * preHandle(전 처리): DispatcherServlet이 해당 컨트롤러를 호출하기 전에 낚아채는 영역
	 * postHandle(후 처리): 컨트롤러에서 요청처리후  DispatcherServlet으로 뷰 정보가 리턴되는 순간 낚아채는 영역
	 * 
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		// true 리턴시: 기존의 흐름대로 해당 controller를 제대로 실행
		// false리턴시 : controller를 실행 시키지 않겠다.
		
		//로그인 여부는 session에 loginUser의 키 값이 담겨있는지로 알 수 있음.
		HttpSession session = request.getSession();//request로 세션 얻어올 수 있음
		
		if(session.getAttribute("loginUser") != null) {
			//로그인 후->정상적으로 컨트롤러 실행
			return true;
			
		}else {
			//로그인 전=>컨트롤러가 실행 안되도록 ,, 대신에 페이지를 넘겨줘야함!
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
	}
}
