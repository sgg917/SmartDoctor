<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<button type="button" class="btn btn-outline-success appr-doc-btn"
							style="float: left; height: 35px;">
							<i class="mdi mdi-playlist-check" style="color: white;"></i>&nbsp;
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

						<table class="table appr-standby-tb" id="appr-all-table">
							<thead>
								<tr>
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
												<td class="apprNo">${ a.apprNo }</td>
												<td>${ a.formTitle }</td>
												<td>${ a.apprTitle } &nbsp;
													<!-- <i class="mdi mdi-paperclip" style="color: gray;"></i> -->
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
							$(function(){
			            		$(".appr-standby-tb>tbody>tr").click(function(){
			            			location.href = 'apprStandbyDetail.si?apprNo=' + $(this).find(".apprNo").text();
			            		})
			            	})
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