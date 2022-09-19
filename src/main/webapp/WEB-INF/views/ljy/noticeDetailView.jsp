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
	#aaa:hover{
		background: rgb(237, 230, 214);
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/navbar.jsp" />
	
	<div class="content-wrapper" style="height:100%;">
		<div class="wrap11" style="width: 70%; margin:auto;">
			<div class="row">
                <div class="card"  style="width: 100%;">
                <div style="background: white; border-radius: 10px; width: 100%">
                  <div class="card-body">
                  
                    <h2>공지사항</h2>

                    <div id="detail-area">

                      <table class="table">

                        <thead>
                          <tr>
                            <th style="font-weight: bold;">제목</th>
                            <td>${ n.noticeTitle }</td>
                          </tr>
                        </thead>

                        <tbody>
                          <tr>
                            <th>작성일</th>
                            <td>${ n.enrollDate }</td>
                          </tr>
                          <tr>
                            <th>첨부파일</th>
                            <td>
                            	<c:choose>
                            		<c:when test="${ empty n.noticeOrigin }">
                            			첨부파일이 없습니다.
                            		</c:when>
                            		<c:otherwise>
                            			<a href="${ n.noticePath }" download="${ n.noticeOrigin }">${ n.noticeOrigin }</a>
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                          </tr>
                          <tr>
                            <th colspan="2" style="text-align: center;">내용</th>
                          </tr>
                          <tr>
                            <td colspan="2"><textarea cols="100" rows="20" style="border: none; width: 100%;">${ n.noticeContent }</textarea></td>
                          </tr>
                        </tbody>
                      </table>

                    </div>
                    
                    <c:if test="${ loginUser.status eq 'A' }">
                    
                    	<div class="template-demo">
                    		<a class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(192, 57, 43); color: white; border: none; width: 100px;" onclick="postFormSubmit('delete.no')">삭제하기</a>
                      		<a class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 100px;" onclick="postFormSubmit('updateForm.no')">수정하기</a>
                    	</div>
                    	
                    	<form id="postForm" action="" method="post">
                    		<input type="hidden" name="no" value="${ n.noticeNo }">
                    		<input type="hidden" name="noticePath" value="${ n.noticePath }">
                    	</form>
                    	
                    	<script>
                    		function postFormSubmit(url){
                    			$("#postForm").attr("action", url).submit();
                    		}
                    	</script>
                    
                    </c:if>

                    <div class="template-demo">
                      <a class="btn btn-gradient-primary btn-sm" style="float: left; background: rgb(237, 230, 214); color: rgb(29, 92, 99); border: none; width: 100px;" href="list.no">목록으로</a>
                    </div>

                    <br><br><br>
            </div>
                  </div>
            </div>
          </div>
        </div>
          <jsp:include page="../common/footer.jsp" />
      </div>

</body>
</html>