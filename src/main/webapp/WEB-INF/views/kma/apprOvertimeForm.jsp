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
						전자결재 &nbsp;|&nbsp; <b>연장근무 신청</b>
					</p>
					<hr>
					<br>
					<div class="appr-table-wrapper" style="margin-left:20px;">
						<button type="button" class="btn btn-success appr-write-btn">
							<i class="mdi mdi-arrow-up-bold" style="color: white;"></i>&nbsp;
							<span>결재요청</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green"
							style="width: 130px;">
							<i class="mdi mdi-account-plus menu-icon"></i>&nbsp; <span>결재라인
								지정</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green"
							style="width: 130px;">
							<i class="mdi mdi-application menu-icon"></i>&nbsp; <span>결재양식
								선택</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green">
							<i class="mdi mdi-download menu-icon"></i>&nbsp; <span>임시저장</span>
						</button>
						<table class="table table-bordered appr-table">
							<tr>
								<th width="250px;">문서보존기간</th>
								<td>&nbsp;5년</td>
							</tr>
							<tr>
								<th>결재자</th>
								<td></td>
							</tr>
							<tr>
								<th>참조자</th>
								<td></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" placeholder="제목을 입력해주세요"></td>
							</tr>
						</table>
						<br>
						<br>
						<br>
						<h3 align="center" style="font-weight: 550;">상세정보 입력</h3>
						<br>
						<br>
						<table class="table table-bordered appr-table">
							<tr>
								<th width="250">신청자</th>
								<td><input type="text" placeholder="이름을 입력해주세요"></td>
							</tr>
							<tr>
								<th>소속부서</th>
								<td><input type="text" placeholder="부서명을 입력해주세요"></td>
							</tr>
							<tr>
								<th>근무날짜</th>
								<td><input type="date"></td>
							</tr>
							<tr>
								<th>근무시작시간</th>
								<td><input type="time" style="width: 105px;"></td>
							</tr>
							<tr>
								<th>근무종료시간</th>
								<td><input type="time" style="width: 105px;"></td>
							</tr>
							<tr>
								<th>총근무시간</th>
								<td><input type="number" value="1"></td>
							</tr>
							<tr>
								<th>근무사유</th>
								<td><input type="text" placeholder="사유를 입력해주세요"
									style="width: 800px;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>