<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.appr-doc-btn{
		float: left; 
		height: 35px;
	}
	.appr-doc-btn>i{
		color: white;
	}
    .appr-standby-tb>tbody>tr:hover{
  		cursor: pointer;
    }
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>결재대기 문서함</b>
					</p>
					<hr>
					<br><br>
					<div class="appr-table-wrapper" style="margin-left:40px;">
						<form id="allApprove" action="" method="post">
							<button type="button" class="btn appr-doc-btn"
								onclick="allApprove('allApprove.si');">
								<i class="mdi mdi-playlist-check"></i>&nbsp;
								<span>일괄결재</span>
							</button>
							<div class="input-group appr-search-div" style="float: right;">
								<select name="" style="display: inline-block;">
									<option>제목</option>
									<option>결재양식</option>
								</select> <input type="text" class="form-control"
									placeholder="검색어를 입력해주세요" style="display: inline-block;">
								<button class="btn appr-write-btn btn-sm" type="button"
									style="display: inline-block;">
									<img src="resources/images/kma/search.png">
								</button>
							</div>
						</form>
						
						<table class="table appr-standby-tb" id="appr-all-table">
							<thead>
								<tr>	
									<th>선택</th>
									<th>문서번호</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>기안자</th>
									<th>기안일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="5" align="center">결재대기 문서가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${ list }">
											<tr>
												<td class="check"><input type="checkbox" value="1"></td>
												<td class="apprNo">${ a.apprNo }</td>
												<td>${ a.formTitle }</td>
												<td>${ a.apprTitle } &nbsp;
													<c:if test="${ not empty a.originName }">
														<i class="mdi mdi-paperclip" style="color: gray;"></i>
														<span style="color: gray;">1</span>
													</c:if>
												</td>
												<td>${ a.empName }</td>
												<td>${ a.enrollDate }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
						<script>
							$(function(){ // 상세페이지
			            		$(".appr-standby-tb>tbody").on('click', 'tr td:not(:first-child)', function(e){
			            			location.href = 'apprStandbyDetail.si?apprNo=' + $(e.target).siblings(".apprNo").text();
			            		})
			            	})
			            	
			            	function allApprove(url){ // 일괄결재
								
								$('input[type=checkbox]:checked').each(function(index, item){
									$("#allApprove").append("<input type='hidden' value='" + $(item).parent().siblings('.apprNo').text() + "' name='lineList[" + index + "].apprNo'>")
								})
								
								let result = confirm("일괄결재 하시겠습니까? 일괄결재 시 결재의견은 '승인합니다'로 통일됩니다.");
								if(result == true){
									$("#allApprove").attr("action", url).submit();
								} 
							}
						</script>
						
						<!-- 페이징 -->
						<nav aria-label="Page navigation example" class="appr-page">
							<ul class="pagination">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="apprStandbyList.si?cpage=${ pi.currentPage - 1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<li class="page-item"><a class="page-link" href="apprStandbyList.si?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="apprStandbyList.si?cpage=${ pi.currentPage + 1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
								
							</ul>
						</nav>
					</div>

				</div>
			</div>

		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>