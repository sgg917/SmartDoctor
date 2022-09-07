<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/kma.css">
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>전체 문서함</b>
					</p>
					<hr>
					<br>
					<br>
					<div class="appr-table-wrapper">

						<div class="input-group appr-search-div">
							<select name="">
								<option>제목</option>
								<option>결재양식</option>
							</select> <input type="text" class="form-control"
								placeholder="검색어를 입력해주세요">
							<button class="btn appr-write-btn btn-sm" type="button">
								<img src="search.png" alt="">
							</button>
						</div>
						<table class="table" id="appr-all-table">
							<!-- 첨부는 제목 옆에 클립 -->
							<thead>
								<tr>
									<th>기안일</th>
									<th>완료일</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>기안부서</th>
									<th>현재 결재자</th>
									<th>최종 결재자</th>
									<th>문서번호</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2022-07-31</td>
									<td>2022-08-21</td>
									<td>휴가신청(기본)</td>
									<td>[교육]총무팀 강동원 팀장</td>
									<td>총무팀</td>
									<td>강동원</td>
									<td>강보람</td>
									<td>20220821083</td>
									<td>결재완료</td>
								</tr>
								<tr>
									<td>2022-07-31</td>
									<td>2022-08-21</td>
									<td>휴가신청(기본)</td>
									<td>[교육]총무팀 강동원 팀장</td>
									<td>총무팀</td>
									<td>강동원</td>
									<td>강보람</td>
									<td>20220821083</td>
									<td>결재완료</td>
								</tr>
								<tr>
									<td>2022-07-31</td>
									<td>2022-08-21</td>
									<td>휴가신청(기본)</td>
									<td>[교육]총무팀 강동원 팀장</td>
									<td>총무팀</td>
									<td>강동원</td>
									<td>강보람</td>
									<td>20220821083</td>
									<td>결재완료</td>
								</tr>
								<tr>
									<td>2022-07-31</td>
									<td>2022-08-21</td>
									<td>휴가신청(기본)</td>
									<td>[교육]총무팀 강동원 팀장</td>
									<td>총무팀</td>
									<td>강동원</td>
									<td>강보람</td>
									<td>20220821083</td>
									<td>결재완료</td>
								</tr>
							</tbody>
						</table>
						<nav aria-label="Page navigation example" class="appr-page">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
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