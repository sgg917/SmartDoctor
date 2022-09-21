<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Smart Doctor</title>
<!-- plugins:css -->
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
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon-16x16.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<style>
.wrap11 {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

.button {
	width: 110px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
}

.detail {
	width: 60px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
}

.bggray {
	background-color: lightgray;
}

b {
	font-size: 20px;
}

.title {
	border-radius: 7px;
	height: 50px;
}

.table {
	width: 100%;
}

input {
	height: 100%;
	border: 1px solid black;
	border-radius: 5px;
}

#searchbar {
	height: 30px;
}

#searchbar>div {
	height: 100%;
	box-sizing: border-box;
	float: left;
}

.innerArea {
	height: 100%;
	width: 1000px;
	margin: auto;
}

#header1 {
	width: 25%;
}

#header2 {
	width: 55%;
	padding: 0;
}

#header3 {
	width: 20%;
}

img {
	height: 100%;
	cursor: pointer;
}

#tableArea {
	height: 370px;
	width: 100%;
	/* border: 1px solid black; */
	text-align: center;
	overflow: auto;
}

#tableArea>table {
	width: 100%;
	box-sizing: border-box;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

#tableArea>.table>tbody>tr:hover {
	background: #E1F0FF;
	cursor: pointer;
}
</style>


</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">
				<br> <br> <br>

				<div class="innerArea">
					<table class="table bggray title">
						<tr height="40">
							<td><b>환자조회</B></td>
						</tr>
					</table>
					<br> <br>
					<div id="searchbar">
						<div id="header1"></div>
						<div id="header2">
							<input type="text" class="form-control input-sm"
								placeholder="이름 입력"
								style="width: 200px; height: 30px; display: inline;">&nbsp;<img
								src="resources/images/search.jpg">
						</div>
						<div id="header3">
							<button type="button" class="button">신규환자등록</button>
						</div>
					</div>
					<br> <br>
					<div id="tableArea" align="center">
						<table class="table" id="patientList">
							<thead>
								<tr>
									<th width="85px">차트번호</th>
									<th width="60px">이름</th>
									<th width="50px">성별</th>
									<th width="100px">주민등록번호</th>
									<th width="100px">연락처</th>
									<th width="100px">보호자연락처</th>
									<th width="200px">주소</th>
									<th width="80px">진료내역</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="8">환자가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${ list }">
											<tr>
												<td class="chartNo">${ p.chartNo }</td>
												<td>${ p.patientName }</td>
												<td>${ p.gender }</td>
												<td>${ p.idNo }</td>
												<td>${ p.phone }</td>
												<td>${ p.protector }</td>
												<td>${ p.address }</td>
												<td><button class="detail" value="${ p.chartNo }">조회</button></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
					</div>

					<!-- 페이징바 -->
					<div id="pagingbar">
						<ul class="pagination" style="justify-content: center;">

							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link">&lsaquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="color: rgb(29, 92, 99);"
										href="list.mj?cpage=${ pi.currentPage - 1 }">&lsaquo;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								
								<c:choose>
									<c:when test="${ pi.currentPage == p }">
										<!-- 현재페이지 -->
										<c:choose>
											<c:when test="${ empty keyword }">
												<li class="page-item"><a class="page-link"
													style="color: white; background: rgb(29, 92, 99)" href="list.mj?cpage=${ p }">${ p }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													style="color: white; background: rgb(29, 92, 99)"
													href="search.pt?cpage=${ p }&keyword=${keyword}">${ p }</a></li>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<!-- 현재페이지가 아닌거 -->
										
										<c:choose>
											<c:when test="${ empty keyword }">
												<li class="page-item"><a class="page-link"
													style="color: rgb(29, 92, 99);" href="list.mj?cpage=${ p }">${ p }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													style="color: rgb(29, 92, 99);"
													href="search.pt?cpage=${ p }&keyword=${keyword}">${ p }</a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>

							</c:forEach>

							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link">&rsaquo;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" id="aaa"
										style="color: rgb(29, 92, 99);"
										href="list.mj?cpage=${ pi.currentPage + 1 }">&rsaquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>

					<br> <br>
				</div>

			</div>
		</div>
		<script>
		
			$(function() {
				$("#patientList>tbody>tr>td>button").click(
						function() {
							location.href = "detail.pt?chartNo="
									+ $(this).val();
						})
			})
		
		</script>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>