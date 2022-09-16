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
	
	<div class="content-wrapper" style="height:100%;">
		<div class="wrap11" style="width: 70%; margin:auto;">
			<div class="row">
                <div class="card">
                  <div class="card-body">
                  
                  <h2>공지사항</h2>

	              <div id="detail-area">
					
					<form id="noticeEnroll" method="post" action="insert.no" ecntype="multipart/form-data">
                	<table class="table">

	                  <thead>
	                    <tr>
	                      <th style="font-weight: bold;">제목</th>
	                      <td><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" style="border: 0; height: 1px;" required></td>
	                    </tr>
	                  </thead>

	                  <tbody>
	                    <tr>
	                      <th>작성일</th>
	                      <td><input type="text" id="enrollDate" class="form-control" name="enrollDate" style="border: 0;  height: 1px;" required></td>
	                    </tr>
	                    <tr>
	                      <th>첨부파일</th>
	                      <td><input type="file" id="upfile" class="form-control-file border" style="border: 0; name="upfile"></td>
	                    </tr>
	                    <tr>
	                      <th colspan="2" style="text-align: center;">내용</th>
	                    </tr>
	                    <tr>
	                      <td colspan="2"><textarea cols="100" rows="20" style="border: none; white-space:pre;"></textarea></td>
	                    </tr>
	                  </tbody>
                	</table>
					</form>
					
             	  </div>

	              <div class="template-demo">
	                <button type="submit" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 100px;">등록하기</button>
	                <button type="reset" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(237, 230, 214); color: rgb(29, 92, 99); border: none; width: 100px;">취소하기</button>
	              </div>
	              
                  </div>
                </div>
             </div>
         </div>
         <jsp:include page="../common/footer.jsp" />
      </div>   

</body>
</html>