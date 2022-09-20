<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시저장함</title>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>임시저장함</b>
					</p>
					<hr>
					<br>
					<br>
					<div class="appr-table-wrapper" style="margin-left:40px;">

						<div class="input-group appr-search-div">
							<select name="">
								<option>제목</option>
								<option>결재양식</option>
							</select> <input type="text" class="form-control"
								placeholder="검색어를 입력해주세요">
							<button class="btn appr-write-btn btn-sm" type="button">
								<img src="resources/images/kma/search.png">
							</button>
						</div>
						<table class="table appr-storage-tb" id="appr-all-table">
							<!-- 첨부는 제목 옆에 클립 -->
							<thead>
								<tr>
									<th>문서번호</th>
									<th>작성일</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="5" align=center>조회 가능한 문서가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${ list }">
											<tr>
												<td class="apprNo">${ a.apprNo }</td>
												<td>${ a.enrollDate }</td>
												<td>${ a.formTitle }</td>
												<td>${ a.apprTitle } &nbsp;
													<!-- <i class="mdi mdi-paperclip" style="color: gray;"></i>
													<span style="color: gray;">1</span> -->
												</td>
												<td>
													<label class="badge" style="background:indianred; border:none;">임시저장</label>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
						<script>
							$(function(){
			            		$(".appr-storage-tb>tbody>tr").click(function(){
			            			location.href = 'storageReport.si?apprNo=' + $(this).find(".apprNo").text();
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
										<li class="page-item"><a class="page-link" href="apprStorageList.si?cpage=${ pi.currentPage - 1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<li class="page-item"><a class="page-link" href="apprStorageList.si?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="apprStorageList.si?cpage=${ pi.currentPage + 1 }">Next</a></li>
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