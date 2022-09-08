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
						전자결재 &nbsp;|&nbsp; <b>결재양식 관리</b>
					</p>
					<hr>
					<br>
					<br>
					<div class="appr-table-wrapper" style="margin-left:100px;">
						<select name="" id="appr-manage-select">
							<option>전체</option>
							<option>양식종류</option>
							<option>사용</option>
							<option>미사용</option>
						</select>
						<table class="table " id="appr-manage-table">
							<thead align="center">
								<tr>
									<th>번호</th>
									<th>사용여부</th>
									<th>양식종류</th>
									<th>양식명</th>
									<th>양식설명</th>
								</tr>
							</thead>
							<tbody align="center">
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="4">사용 가능한 양식이 없습니다.</td>
										<tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="f" items="${ list }">
											<tr>
												<td class="formNo">${ f.formNo }</td>
												<c:choose>
													<c:when test="${ f.formStatus eq 'Y' }">
														<td>사용</td>
													</c:when>
													<c:otherwise>
														<td>미사용</td>
													</c:otherwise>
												</c:choose>
												<td>${ f.formType }</td>
												<td>${ f.formTitle }</td>
												<td>${ f.formInfo }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>
						<button class="btn appr-write-btn" id="appr-manage-btn" onclick="location.href='formEnrollForm.si'">
							<span style="white-space: nowrap;">양식추가</span>
						</button>
						
						<script>
							$(function(){
			            		$("#appr-manage-table>tbody>tr").click(function(){
			            			location.href = 'formDetail.si?formNo=' + $(this).find(".formNo").text();
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
										<li class="page-item"><a class="page-link" href="formList.si?cpage=${ pi.currentPage - 1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<li class="page-item"><a class="page-link" href="formList.si?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="formList.si?cpage=${ pi.currentPage + 1 }">Next</a></li>
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