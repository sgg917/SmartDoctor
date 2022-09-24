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
                <div class="card"  style="width: 100%;">
                  <div class="card-body" style="width: 100%;">
                  
                  <h2>공지사항 작성하기</h2>

					
					<form id="noticeEnroll" method="post" action="insert.no" enctype="multipart/form-data">
                	<table class="table" aligh="center">

	                  <thead>
	                    <tr>
	                      <th style="font-weight: bold;"><label for="noticeTitle">제목</label></th>
	                      <td style="border: 0;"><input type="text" id="noticeTitle" class="form-control" name="noticeTitle" style="border: 0; height: 1px; width: 600px;" required></td>
	                    </tr>
	                  </thead>

	                  <tbody>
	                    <tr>
	                      <th><label for="upfile">첨부파일</label></th>
	                      <td><input type="file" id="upfile" class="form-control-file border" style="border: 0;" name="upfile"></td>
	                    </tr>
	                    <tr>
	                      <th colspan="2" style="text-align: center;"><label for="noticeContent">내용</label></th>
	                    </tr>
	                    <tr>
	                      <td colspan="2"><textarea cols="100" rows="20" style="border: none; white-space:pre; width: 600px;" id="noticeContent" name="noticeContent" required></textarea></td>
	                    </tr>
	                  </tbody>
                	</table>
					
					

	              <div class="template-demo">
	                <button type="submit" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 100px;">등록하기</button>
	                <button type="reset" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(192, 57, 43); color: white; border: none; width: 100px;">취소하기</button>
	                <button type="reset" class="btn btn-gradient-primary btn-sm" style="float: left; background: rgb(237, 230, 214); color: rgb(29, 92, 99); border: none; width: 100px;" onclick="javascript:history.go(-1);">목록가기</button>
	              </div>
	              </form>
	              
                  </div>
                </div>
             </div>
         </div>
         <jsp:include page="../common/footer.jsp" />
      </div>   

</body>
</html>