<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 로고 -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
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
	height: 33px;
	border-style: none;
	border-radius: 7px;
	font-weight: 600;
}

.btn-gradient-primary {
	background:#1D5C83 !important;
}

/* 조건 검색 테이블 스타일 */
#memAtt-condition {
	margin-top: 50px;
}
#memAtt-condition tr * {
	font-size:1rem;
}

/* 사원 근태 조회 테이블 스타일 */
#memAtt {
	text-align: center;
}
th {
	font-weight: bold !important;
	background: #f2f2f2 !important;
}
#memAtt th, #memAtt td {
	font-size:1rem !important;
}
#memAtt>tbody>tr:hover {
	cursor: pointer;
}
#memAtt tr {
	height:40px !important;
}

/* 페이징 스타일 */
.page-item {
	background:none;
	color:rgb(65, 125, 122);
}
.page-item .active {
	background:rgb(65, 125, 122) !important;
	color:white;
}
.pagination ul {
	font-size:1rem;
}
.page-link {
	padding: 0.7rem 1rem !important;
}

/* 근태 정보 수정 모달 스타일 */
#updateAttModal .modal-body * {
	font-size:1rem !important;
}
#updateAttModal input {
	height:40px !important;
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

			<div class="wrap11" id="att-area">

				<!-- 조건 검색 테이블 -->
				<div class="form-group" style="margin-left: 80px;">
					<table id="memAtt-condition">
						<tr height="40px">
							<td width="100px;"><select class="form-control"
								name="condition" id="condition">
									<option name="condition" value="dept_name">부서명</option>
									<option name="condition" value="emp_name">이름</option>
							</select></td>
							<td width="200px;"><input class="form-control" type="text"
								name="keyword" placeholder="키워드를 입력해 주세요.">
							</td>
							<td width="100px;" style="text-align:right;">
								<button class="green-btn small-btn" onclick="searchAllAtt(1);">조회</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- 조건 검색 테이블 끝-->

				<!-- 사원 근태 조회 테이블 -->
				<table id="memAtt" class="table"
					style="width:1400px; margin: 10px 80px;">
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
						<c:choose>
							<c:when test="${ empty list }">
								<tr>
									<td colspan="7" style="text-align:center;">
										조회 내역이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${ list }">
									<!-- 결근인 근태 정보는 수정 불가 -->
									<c:choose>
										<c:when test="${ a.status eq '결근' }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="open-modal" data-bs-toggle="modal" data-bs-target="#updateAttModal">
										</c:otherwise>
									</c:choose>
										<input type="hidden" value="${ a.empNo }">
										<td class="attDate">${ a.attDate }</td>
										<td class="deptName">${ a.deptName }</td>
										<td class="empName">${ a.empName }</td>
										<td class="startTime">${ a.startTime }</td>
										<td class="endTime">${ a.endTime }</td>
										<c:choose>
											<c:when test="${ a.totalTime eq '0' }">
												<td class="totalTime">${ a.totalTime }</td>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${ a.totalTime lt 60 }">
														<td class="totalTime">${ a.totalTime }</td>
													</c:when>
													<c:otherwise>
														<td class="totalTime">${ Math.ceil(a.totalTime/60) }</td>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<td class="status">${ a.status }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- 사원 근태 조회 테이블 끝-->
				<br>
				<!-- 사원 근태 조회 페이징-->
				<!-- 테이블 페이징 -->
				<div class="pagination" style="width: 100%;">
					<ul class="pagination" id="pageArea" style="margin: auto;">
					
						<c:if test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link" href="allList.att?cpage=${pi.currentPage-1}">&lt;</a></li>
						</c:if>
					
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							
							<c:choose>
								<c:when test="${ p eq pi.currentPage }">
									<li class="page-item active"><a class="page-link" href="allList.att?cpage=${p}">${p}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="allList.att?cpage=${p}">${p}</a></li>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
							
						<c:if test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link" href="allList.att?cpage=${pi.currentPage+1}">&gt;</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 사원 근태 조회 페이징 끝-->
				
				<br>
				<br>
			</div>
		</div>

		<script>
			$(function() {
				$('.open-modal').click(function() {
					// input 요소에 근태 정보 넣어주기
					$('input[type=hidden]').val( $(this).children('input[type=hidden]').val() );
					$('input[name=attDate]').val( $(this).children(".attDate").text() );
					$('input[name=deptName]').val( $(this).children('.deptName').text() );
					$('input[name=empName]').val( $(this).children('.empName').text() );
					$('input[name=startTime]').val( $(this).children('.startTime').text() );
					$('input[name=endTime]').val( $(this).children('.endTime').text() );
					$('input[name=totalTime]').val( $(this).children('.totalTime').text() );
					$('option[value=' + $(this).children(".status").text() + ']').attr('selected', true);
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
						<h4 class="modal-title" style="margin:10px auto;">
							<b>근태 정보 수정</b>
						</h4>
					</div>

					<!-- Modal body -->
					<div class="modal-body" style="background: white;">
						<form class="forms-sample" action="update.att" method="post">
							<input type="hidden" name="empNo">
							<input type="hidden" name="modifyNo" value="${ loginUser.empNo }">
							<div class="form-group row">
								<label for="attDate" class="col-sm-3 col-form-label">날짜</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="attDate" readonly>
								</div>
							</div>
							<div class="form-group row">
								<label for="deptName" class="col-sm-3 col-form-label">부서</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" name="deptName" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="empName" class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="empName" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label for="startTime" class="col-sm-3 col-form-label">출근시간</label>
								<div class="col-sm-9">
									<input type="time" class="form-control" id="startTime" name="startTime">
								</div>
							</div>
							<div class="form-group row">
								<label for="endTime" class="col-sm-3 col-form-label">출근시간</label>
								<div class="col-sm-9">
									<input type="time" class="form-control" id="endTime" name="endTime">
								</div>
							</div>
							<div class="form-group row">
								<label for="totalTime" class="col-sm-3 col-form-label">근무시간</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="totalTime" name="totalTime">
								</div>
							</div>
							<div class="form-group row">
								<label for="status" class="col-sm-3 col-form-label">상태</label>
								<div class="col-sm-9">
									<div class="input-group">
										<select name="status" id="status" class="form-control"
											style="height: 40px;">
											<option name="status" value="정상">정상</option>
											<option name="status" value="지각">지각</option>
											<option name="status" value="휴가">휴가</option>
											<option name="status" value="결근">결근</option>
										</select>
									</div>
								</div>
							</div>
							<br>
							<button type="submit" class="btn btn-gradient-primary me-2" style="margin-left: 120px;">수정</button>
							<button type="button" class="btn btn-light" data-bs-dismiss="modal" >취소</button>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- 근태 정보 수정 모달 끝 -->

		<script>
			//-------------------- 전사 근태 검색 ajax ---------------------
			searchAllAtt = function(no){
			
			//function searchAllAtt(no){
				
				// 키워드 입력 칸이 빈칸이면 검색 불가능
				if($('input[name=keyword]').val() == null || $('input[name=keyword]').val() == "" ){
					alert("키워드를 입력해 주세요.");
					return false;
				}
				
				$.ajax({
					url:"allSearch.att",
					type:"POST",
					data:{
						cpage:no,
						type:$('option[name=condition]:selected').val(),
						keyword:$('input[name=keyword]').val()
					},
					success:function(map){
						
						//console.log(map);
						
						// 검색 결과 변수에 담기
						var newPi = map.pi;
						var newList = map.list;
						//console.log(newPi.currentPage);
						
						var txt = "";
						var ptxt = "";
						
						if(newList == null || newList == ""){
							txt += '<tr>';
							txt += 	'<td colspan="7" style="text-align:center;">';
							txt +=		'조회 내역이 없습니다.';
							txt +=	'</td>';
							txt += '</tr>';
						}else {
							for(let i=0; i<newList.length; i++){
								
								// 결근인 근태 정보는 수정 불가
								if(newList[i].status == '결근'){
									txt += '<tr>'
								}else{
									txt += '<tr class="open-modal" data-bs-toggle="modal" data-bs-target="#updateAttModal">';
								}
								
								txt += '<input type="hidden" value="' + newList[i].empNo + '">';
								txt += '<td class="attDate">' + newList[i].attDate + '</td>';
								if(newList[i].deptName == null){
									txt += '<td class="deptName"> </td>';
								}else{
									txt += '<td class="deptName">' + newList[i].deptName + '</td>';
								}
								txt += '<td class="empName">' + newList[i].empName + '</td>';
								txt += '<td class="startTime">' + newList[i].startTime + '</td>';
								txt += '<td class="endTime">' + newList[i].endTime + '</td>';
								
								if(newList[i].totalTime == '0'){
									txt += '<td class="totalTime">' + newList[i].totalTime + '</td>';
								}else{
									if(newList[i].totalTime < 60){
										txt += '<td class="totalTime">' + newList[i].totalTime + '</td>';
									}else{
										txt += '<td class="totalTime">' + Math.ceil(newList[i].totalTime/60) + '</td>';
									}
								}
								
								txt += '<td class="status">' + newList[i].status + '</td>';
								txt += '</tr>';
							}
						}
						
						if(newPi.currentPage != 1){
							ptxt += '<li class="page-item"><a class="page-link" onclick="searchAllAtt(' + (newPi.currentPage-1) + ');">&lt;</a></li>';
						}
						
						for(let p=newPi.startPage; p<=newPi.endPage; p++){
							
							if(p == newPi.currentPage){
								ptxt += '<li class="page-item active"><a class="page-link" onclick="searchAllAtt(' + p + ');">' + p + '</a></li>';
							}else{
								ptxt += '<li class="page-item"><a class="page-link" onclick="searchAllAtt(' + p + ');">' + p + '</a></li>';
							}
						}
						
						if(newPi.currentPage != newPi.maxPage){
							ptxt += '<li class="page-item"><a class="page-link" onclick="searchAllAtt(' + (newPi.currentPage+1) + ');">&gt;</a></li>';
						}
						
						$('#memAtt>tbody').empty();
						$('#memAtt>tbody').append(txt);
						$('#pageArea').empty();
						$('#pageArea').append(ptxt);
						
					},error:function(){
						console.log("전사 근태 검색 ajax통신 실패");
					}
				})
				
			}
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