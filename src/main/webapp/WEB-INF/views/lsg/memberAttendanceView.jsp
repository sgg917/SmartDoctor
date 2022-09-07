<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 관리</title>
<style>
.wrap11 {
	width: 100%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
}

/* 초록 버튼 */
.green-btn {
	 background:RGB(29, 92, 99);
	 color:white;
}
.green-btn:hover {
	background:#1D5C83;
	color:white;
}

/* 작은 버튼 */
.small-btn {
	width:70px;
	height:30px;
	border-style:none;
	border-radius:7px;
	font-weight:400;
}

/* 조건 테이블 스타일 */
input[type=date] {
	border:1px solid lightgray;
	border-radius:5px;
	width:150px;
	height:30px;
}

/* 테이블 스타일 */
th {
	font-weight:bold !important;
}

#att-area .col-4 {
	display:table-cell;
	vertical-align: middle;
}
#att-sidebar {
	display:inline-block;
	margin-top:50px;
	margin-left:80px;
	padding:30px;
	background:#F2F2F2;
	width:220px;
	height:500px;
	border-radius:7px;
}
#att-count {text-align:center;}
#att-count th {width:80px;}
#att-count tr {height:50px;}

/* 페이징 스타일 */
.page-item {
	background:none;
	color:rgb(65, 125, 122);
}
.page-item .active {
	background:rgb(65, 125, 122) !important;
	color:white;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />

	<!-- partial !!!여기서부터 메인 시작!!! -->
	<div class="main-panel">
		<div class="content-wrapper">
			<h3><b>출퇴근 관리</b></h3>
			<br>
			<hr>

			<div class="container card wrap11" id="att-area">
				<div class="row" style="width: 100%">

					<!-- 근태 상세 조회 영역 -->
					<div class="col-8" style="padding: 50px 70px;">
						<h5><b>조건별 근태 조회</b></h5>
						<br>
						<br>
						<!-- 날짜 조회는 ajax -->
						<form action="" method="post">
							<input type="date" id="" name=""> ~ <input type="date" id="" name=""> <br><br>
							<input type="checkbox" id="y" name="status" value="Y">
							<label for="y">정상</label> &nbsp;&nbsp; 
							<input type="checkbox" id="l" name="status" value="L"> <label for="l">지각</label> &nbsp;&nbsp;
							<input type="checkbox" id="e" name="status" value="E"> <label for="e">조퇴</label> &nbsp;&nbsp; 
							<input type="checkbox" id="n" name="status" value="N"> <label for="n">결근</label> &nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<button class="small-btn green-btn">조회</button>
						</form>

						<br>
						<br>

						<table class="table" style="width: 550px;">
							<thead>
								<tr style="background: #f2f2f2;">
									<th>날짜</th>
									<th>출근시간</th>
									<th>퇴근시간</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="4" style="text-align:center;">
												아직 근태 정보가 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${ list }"> 
											<tr>
												<td>${ a.attDate }</td>
												<td>${ a.startTime }</td>
												<td>${ a.endTime }</td>
												
												<c:choose>
													<c:when test="${ a.status eq 'Y' }">
														<td>정상</td>
													</c:when>
													<c:when test="${ a.status eq 'L' }">
														<td>지각</td>
													</c:when>
													<c:when test="${ a.status eq 'E' }">
														<td>조퇴</td>
													</c:when>
													<c:otherwise>
														<td>결근</td>
													</c:otherwise>
												</c:choose>
												
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<br>

						<!-- 테이블 페이징 -->
						<div class="pagination" style="width: 550px;">
							<ul class="pagination" style="margin: auto;">
							
								<c:if test="${ pi.currentPage ne 1 }">
									<li class="page-item"><a class="page-link" href="list.att?cpage=${pi.currentPage-1}&no=21015860">&lt;</a></li>
								</c:if>
							
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									
									<c:choose>
										<c:when test="${ p eq pi.currentPage }">
											<li class="page-item active"><a class="page-link" href="list.att?cpage=${p}&no=21015860">${p}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.att?cpage=${p}&no=21015860">${p}</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
									
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<li class="page-item"><a class="page-link" href="list.att?cpage=${pi.currentPage+1}&no=21015860">&gt;</a></li>
								</c:if>
								
							</ul>
						</div>

					</div>
					<!-- 근태 상세 조회 영역 끝 -->

					<!-- 출퇴근 사이드바 영역 -->
					<div class="col-4">
						<div id="att-sidebar">
							<h5>TODAY</h5>
							2022.08.26 금요일<br>
							<br>
							<button class="small-btn green-btn" onclick="startAtt();">출근</button>
							&nbsp;
							<button class="small-btn green-btn" data-bs-toggle="modal"
								data-bs-target="#endAttModal">퇴근</button>
							<br>
							<br>
							<button class="small-btn green-btn" style="width: 150px;">연장근무
								신청</button>
							<hr>
							<p>
								출근 &nbsp;&nbsp;&nbsp;&nbsp; 08:57 <br> 퇴근
								&nbsp;&nbsp;&nbsp;&nbsp; 18:01
							</p>
							<hr>
							<table id="att-count">
								<tr>
									<th>정상</th>
									<th>지각</th>
								</tr>
								<tr>
									<th>10</th>
									<th>2</th>
								</tr>
								<tr>
									<th>조퇴</th>
									<th>결근</th>
								</tr>
								<tr>
									<th>0</th>
									<th>0</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 퇴근 Modal -->
			<div class="modal fade" id="endAttModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal body -->
						<div class="modal-body" style="text-align: center;">
							18:00<br> 퇴근하시겠습니까?
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<form action="" method="post">
								<input type="hidden" name="" value="사원번호"> <input
									type="hidden" name="" value="근태번호"> <input
									type="hidden" name="" value="18:01">
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn green-btn">확인</button>
							</form>
						</div>

					</div>
				</div>
			</div>
			<!-- 퇴근 Modal 끝 -->
		</div>
		<!-- content-wrapper ends -->
		<!-- partial:partials/_footer.html -->

		<jsp:include page="../common/footer.jsp" />

		<!-- partial -->
	</div>
	<!-- main-panel ends -->

</body>
</html>