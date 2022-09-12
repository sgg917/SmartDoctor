<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	
	<jsp:include page="../common/navbar.jsp" />
	<div class="content-wrapper" style="height:808px; text-align:center;">
		<div class="wrap11" style="width: 70%; height:70%; margin:auto;">
			<div class="container-scroller" style="padding: 60px 0px;" align="center">
			
				<div class="auth-form-light text-left p-5" style="width: 550px;">
                
                <h2 align="center" style="color: rgb(29, 92, 99); font-weight:bold;">비밀번호 변경</h2>
                
                <form class="pt-3" action="updatePwd.me">
                  <input type="hidden" name="empNo" value="${ loginUser.empNo }">
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" name="empPwd" id="exampleInputEmail1" placeholder="현재 비밀번호 입력해주세요">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" name="updatePwd" id="exampleInputPassword1" placeholder="변경할 비밀번호를 입력해주세요">
                  </div>
                  <div class="mt-3" align="center">
                    <button type="submit" class="btn btn-block btn-gradient-primary btn-lg auth-form-btn font-weight-medium" style="background: rgb(29, 92, 99); width: 100%; font-weight: bold; font-size: 18px;" href="">변경하기</button>
                  </div>
                </form>
              </div>
              
			</div>
		</div>
		<br>
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>