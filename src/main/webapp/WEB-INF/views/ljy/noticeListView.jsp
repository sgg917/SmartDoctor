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
	<div class="content-wrapper" style="height:808px; text-align:center;">
		<div class="wrap11" style="width: 70%; height:70%; margin:auto;">
		
		
			<div class="row">
                <div class="card">
                  <div class="card-body">
                  	
                  	<div style="float: left;">
                    	<h2 style="float: left;">공지사항</h2>
                    	<br>
                    	<span class="card-description" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 ${ listCount }건 <code style="color:white;">.table-hover</code></span>
                    </div>
                    
					<br><br><br><br>
                    <div class="form-group" style="float: right;">
                      <table>
                        <tr>
                          <td><input type="text" class="form-control input-sm" placeholder="검색어 입력" style="width: 300px; height: 30px;"></td>
                          <td><button type="button" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;">검색</button>
                            
                        </tr>
                      </table>
                    </div>


                    <table id="noticeList" class="table table-hover">

                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성일</th>
                          <th>조회수</th>
                        </tr>
                      </thead>
                      
                      <tbody>
	                      <c:choose>
	                      	<c:when test="${ empty list }">
	                      		<tr>
	                      			<td colspan="4">현재 공지사항이 없습니다.</td>
	                      		</tr>
	                      	</c:when>
	                      	<c:otherwise>
	                      		<c:forEach var="n" items="${ list }">
	                      			<tr>
			                          <td class="no">${ n.noticeNo }</td>
			                          <td>${ n.noticeTitle }</td>
			                          <td>${ n.enrollDate }</td>
			                          <td>${ n.count }</td>
			                        </tr>
	                      		</c:forEach>
	                      	</c:otherwise>
	                      </c:choose>
                      </tbody>
                      
                     <script>
                      	$(function(){
                      		$("#noticeList>tbody>tr").click(function(){
                      			location.href = "detail.no?no=" + $(this).children(".no").text();
                      		})
                      	})
                      </script>
                      
                    </table>

                    <div class="template-demo">
                      <a class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;" href="enroll.no">글작성</a>
                    </div>

                    <br><br><br>
            
            		<!-- 페이징바 -->
                    <div id="pagingbar">
                      <ul class="pagination"  style="justify-content: center;">
                      	
                      	<c:choose>
                      		<c:when test="${ pi.currentPage eq 1 }">
                      			<li class="page-item disabled"><a class="page-link">&lsaquo;</a></li>
                      		</c:when>
                      		<c:otherwise>
                      			<li class="page-item"><a class="page-link" id="aaa" style="color: rgb(29, 92, 99);" href="list.no?cpage=${ pi.currentPage - 1 }">&lsaquo;</a></li>
                      		</c:otherwise>
                      	</c:choose>
                      	
                      	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                      		<li class="page-item"><a class="page-link" id="aaa"  style="color: rgb(29, 92, 99);" href="list.no?cpage=${ p }">${ p }</a></li>
                      	</c:forEach>
                      	
                      	<c:choose>
                      		<c:when test="${ pi.currentPage eq pi.maxPage }">
                      			<li class="page-item disabled"><a class="page-link">&rsaquo;</a></li>
                      		</c:when>
                      		<c:otherwise>
                      			<li class="page-item"><a class="page-link" id="aaa" style="color: rgb(29, 92, 99);" href="list.no?cpage=${ pi.currentPage + 1 }">&rsaquo;</a></li>
                      		</c:otherwise>
                      	</c:choose>
                      </ul>
                    </div>
                    

                  </div>
                </div>
                
            </div>
            <jsp:include page="../common/footer.jsp" />
		</div>
		<br>
	</div>
	

</body>
</html>