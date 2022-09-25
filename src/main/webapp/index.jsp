<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap11{
	width: 70%;
	height: 100%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
	}
</style>
<link rel="stylesheet"
	href="resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="resources/images/favicon2.ico" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
</head>
<body>
	
	<div class="content-wrapper" style="height:808px; text-align:center;"><!-- 이 안에서 작업해 주세요 -->
			<img src="resources/images/logo.png" alt="logo" style="width:200px; height:50px;"/>
            <br><br><br>
			<div class="wrap11" style="width: 70%; height:70%; margin:auto;">
			
				<div class="container-scroller" style="padding: 60px 0px;" align="center">
					
        			<div class="auth-form-light text-left p-5" style="width: 550px;">
            			
            			<h2 align="center" style="color: rgb(29, 92, 99); font-weight:bold;">LOGIN</h2>
            			
			            <form class="pt-3" action="enter.me">
			            <div class="form-group">
			                <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="empNo" placeholder="사번을 입력해주세요">
			            </div>
			            <div class="form-group">
			                <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="empPwd" placeholder="비밀번호를 입력해주세요">
			            </div>
			            <div class="mt-3" align="center">
			                <button type="submit" class="btn btn-block btn-gradient-primary btn-lg auth-form-btn font-weight-medium" style="background: RGB(29, 92, 99); color: white; width: 100%; font-weight: bold; font-size: 18px;">로그인</button>
			            </div>
			            </form>

        			</div>
        
    			</div>
			</div>
		</div>
		
		<!-- jstl 관련 라이브러리는 안될 수 있음 메이븐으로 안됨, 따라서 직접 추가해야함-->
	<%-- <jsp:forward page="WEB-INF/views/main.jsp"/>  --%>
	
	<%-- <jsp:forward page="WEB-INF/views/ljy/loginMember.jsp"/> --%>
	
</body>
</html>