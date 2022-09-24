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

.btn-green { /* outline-btn */
	border-color: RGB(29, 92, 99);
	color: RGB(29, 92, 99);
	float: right;
	width: 110px;
	height: 35px;
	display: flex;
	margin-bottom: 15px;
	margin-right: 5px;
}

.btn-green:hover {
	background: RGB(29, 92, 99);
	border-color: RGB(29, 92, 99);
	color: white;
}

.btn {
	white-space: nowrap;
}

.input2 {
	border: none;
	outline: none !important;
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
								placeholder="이름 입력" id="keyword" autofocus
								style="width: 200px; height: 30px; display: inline;">&nbsp;
							<img src="resources/images/search.jpg" id="searchIcon">
						</div>
						<div id="header3">
							<button type="button" class="btn btn-outline-success btn-green"
								data-toggle="modal" data-target="#enrollPatient">신규환자등록</button>
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
													style="color: white; background: rgb(29, 92, 99)"
													href="list.mj?cpage=${ p }">${ p }</a></li>
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

		<div class="modal" id="enrollPatient">
			<div class="modal-dialog">
				<div class="modal-content" style="background: white !important;">

					<div class="modal-header" style="font-weight: bold; margin: auto;">
						환자등록
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body" align="center">
						<form action="insert.pt" method="post">
							<table class="table-bordered">
								<tr>
									<td>이름</td>
									<td><input type="text" name="patientName" required
										class="input2"></td>
								</tr>
								<tr>
									<td>주민등록번호</td>
									<td><input type="text" name="idNo" required class="input2"></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="text" name="phone" required
										class="input2"></td>
								</tr>
								<tr>
									<td>보호자 연락처</td>
									<td><input type="text" name="protector" class="input2"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="address" required
										class="input2"></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><input type="text" name="memo" class="input2"></td>
								</tr>
							</table>
							<br>
							<button type="submit" class="btn btn-sm btn-secondary button"
								style="background: rgb(29, 92, 99) !important; color: white !important;">등록하기</button>
						</form>
					</div>

				</div>
			</div>
		</div>

		<script>
		
			$(function() {
				$("#patientList>tbody>tr").click(function() {
					var popupWidth = 500;
					var popupHeight = 690;

					var popupX = (window.screen.width / 2) - (popupWidth / 2);
					var popupY= (window.screen.height / 2) - (popupHeight / 2);
					
					window.open("updatePage.pt?chartNo="+ $(this).children('.chartNo').text(), "popup",'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
				})
			})
			
			$(function() {
				$("#patientList>tbody>tr>td>button").click(function() {
					location.href = "detail.pt?chartNo=" + $(this).val();
				})
			})

			let click = document.getElementById('searchIcon');

			click.addEventListener('click', function() {
				let keyword = document.getElementById('keyword').value;
				location.href = "searchList.pt?keyword=" + keyword;
			});

			let input = document.getElementById("keyword");

			input.addEventListener("keydown", function(event) {
				if (event.key == "Enter") {
					event.preventDefault();
					click.click();
				}
			});
		</script>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>