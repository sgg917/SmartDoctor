<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 근태 관리</title>
<style>
.wrap11 {
	width: 100%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
}

#att-area {
	padding-bottom: 80px;
	padding-top: 20px;
}

/* 버튼 스타일 */
.green-btn {
	background: RGB(29, 92, 99);
	color: white;
}

.green-btn:hover {
	background: #1D5C83;
	color: white;
}

.small-btn {
	width: 70px;
	height: 30px;
	border-style: none;
	border-radius: 7px;
	font-weight: 400;
}

/* 조건 검색 테이블 스타일 */
#memAtt-condition {
	margin-top: 50px;
}

/* 사원 근태 조회 테이블 스타일 */
#memAtt {
	text-align: center;
}

th {
	font-weight: bold !important;
	background: #f2f2f2 !important;
}

/* 페이징 스타일 */
.page-item {
	background: none;
	color: rgb(65, 125, 122);
}

.page-item .active {
	background: rgb(65, 125, 122) !important;
	color: white;
}

/* 사원 근태 리스트 테이블 스타일 */
#memAtt>tbody>tr:hover {
	cursor: pointer;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />

	<!-- partial !!!여기서부터 내용 작성!!! -->
	<div class="main-panel">
		<div class="content-wrapper">
			<h3>
				<b>사원 근태 관리</b>
			</h3>
			<br>
			<hr>

			<div class="container card wrap11" id="att-area">

				<!-- 조건 검색 테이블 -->
				<div class="form-group" style="margin-left: 80px;">
					<table id="memAtt-condition">
						<tr height="30px">
							<td width="100px;"><select class="form-control"
								name="condition" id="condition">
									<option class="" value="deptName">부서명</option>
									<option value="userName">이름</option>
							</select></td>
							<td width="200px;"><input class="form-control" type="text"
								name="keyword" placeholder="키워드를 입력해 주세요." style="height: 25px;">
							</td>
							<td width="100px;" style="text-align: right;">
								<button class="green-btn small-btn">조회</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- 조건 검색 테이블 끝-->

				<!-- 사원 근태 조회 테이블 -->
				<table id="memAtt" class="table"
					style="width: 1000px; margin: 0px 80px;">
					<thead>
						<tr>
							<th width="20%">날짜</th>
							<th width="15%">부서</th>
							<th width="15%">이름</th>
							<th width="15%">출근 시간</th>
							<th width="15%">퇴근 시간</th>
							<th width="15%">근무 시간</th>
							<th width="5%">상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2022-08-01</td>
							<td>원무부</td>
							<td>홍길동</td>
							<td>8:57</td>
							<td>18:00</td>
							<td>8시간</td>
							<td>정상</td>
						</tr>
						<tr>
							<td>2022-08-01</td>
							<td>원무부</td>
							<td>홍길동</td>
							<td>8:57</td>
							<td>18:00</td>
							<td>8시간</td>
							<td>정상</td>
						</tr>
						<tr>
							<td>2022-08-01</td>
							<td>원무부</td>
							<td>홍길동</td>
							<td>8:57</td>
							<td>18:00</td>
							<td>8시간</td>
							<td>조퇴</td>
						</tr>
						<tr>
							<td>2022-08-01</td>
							<td>원무부</td>
							<td>홍길동</td>
							<td>8:57</td>
							<td>18:00</td>
							<td>8시간</td>
							<td>지각</td>
						</tr>
						<tr>
							<td>2022-08-01</td>
							<td>원무부</td>
							<td>홍길동</td>
							<td>8:57</td>
							<td>18:00</td>
							<td>8시간</td>
							<td>결근</td>
						</tr>
					</tbody>
				</table>
				<!-- 사원 근태 조회 테이블 끝-->
				<br>
				<!-- 사원 근태 조회 페이징-->
				<div class="pagination" style="width: 100%;">
					<ul class="pagination" style="margin: auto;">
						<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
					</ul>
				</div>
				<!-- 사원 근태 조회 페이징 끝-->
				<br>
				<br>
			</div>
		</div>

		<script>
			$(function() {
				$('#memAtt>tbody>tr').click(function() {
					$('#updateAttModal').modal('show');
				})
			})
		</script>

		<!-- 근태 정보 수정 모달  -->
		<div class="modal fade" id="updateAttModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header" style="background: white;">
						<h4 class="modal-title">
							<b>근태 정보 수정</b>
						</h4>
					</div>

					<!-- Modal body -->
					<div class="modal-body" style="background: white;">
						<form class="forms-sample" action="" method="post">
							<div class="form-group row">
								<label for="date" class="col-sm-3 col-form-label">날짜</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="date" name=""
										value="2022-08-20" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="department" class="col-sm-3 col-form-label">부서</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="department"
										name="" value="원무부" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="userName" class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="userName" name=""
										value="홍길동" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="startTime" class="col-sm-3 col-form-label">출근시간</label>
								<div class="col-sm-9">
									<input type="time" class="form-control" id="startTime" name="">
								</div>
							</div>
							<div class="form-group row">
								<label for="endTime" class="col-sm-3 col-form-label">출근시간</label>
								<div class="col-sm-9">
									<input type="time" class="form-control" id="endTime" name="">
								</div>
							</div>
							<div class="form-group row">
								<label for="attTime" class="col-sm-3 col-form-label">근무시간</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="attTime">
								</div>
							</div>
							<div class="form-group row">
								<label for="status" class="col-sm-3 col-form-label">상태</label>
								<div class="col-sm-9">
									<div class="input-group">
										<select name="" id="status" class="form-control"
											style="height: 50px;">
											<option value="Y">정상</option>
											<option value="L">지각</option>
											<option value="E">조퇴</option>
											<option value="N">결근</option>
										</select>
									</div>
								</div>
							</div>
							<br>
							<button type="submit" class="btn btn-gradient-primary me-2"
								style="margin-left: 90px;">수정</button>
							<button class="btn btn-light" data-dismiss="modal">취소</button>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- 근태 정보 수정 모달 끝 -->

		<script>
			$('.row .p-0 .m-0 .proBanner .d-flex')
		</script>

		<!-- content-wrapper ends -->
		<!-- !!!내용 작성 끝!!! -->

		<!-- partial:partials/_footer.html -->

		<jsp:include page="../common/footer.jsp"/>

		<!-- partial -->

	</div>
	<!-- main-panel ends -->

</body>
</html>