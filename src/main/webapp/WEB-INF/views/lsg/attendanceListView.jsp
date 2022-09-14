<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	 background:RGB(29, 92, 99) !important;
	 color:white !important;
}
.green-btn:hover {
	background:#1A3C40 !important;
	color:white !important;
}
.green-btn:disabled {
	background:gray !important;
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
						
						<!-- 날짜, 상태 조회는 ajax -->
						<input type="date" id="startDate" name="startDate"> ~ <input type="date" id="endDate" name="endDate">
						<br><br>
						<input type="checkbox" id="y" name="status" value="Y"> <label for="y">정상</label> &nbsp;&nbsp; 
						<input type="checkbox" id="l" name="status" value="L"> <label for="l">지각</label> &nbsp;&nbsp;
						<input type="checkbox" id="e" name="status" value="E"> <label for="e">조퇴</label> &nbsp;&nbsp; 
						<input type="checkbox" id="n" name="status" value="N"> <label for="n">결근</label> &nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
						<button type="button" onclick="searchAtt(1);" class="small-btn green-btn">조회</button>

						<br>
						<br>

						<table class="table" id="attTable" style="width: 550px;">
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
							<ul class="pagination" id="pageArea" style="margin: auto;">
							
								<c:if test="${ pi.currentPage ne 1 }">
									<li class="page-item"><a class="page-link" href="list.att?cpage=${pi.currentPage-1}&no=${loginUser.empNo}">&lt;</a></li>
								</c:if>
							
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									
									<c:choose>
										<c:when test="${ p eq pi.currentPage }">
											<li class="page-item active"><a class="page-link" href="list.att?cpage=${p}&no=${loginUser.empNo}">${p}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="list.att?cpage=${p}&no=${loginUser.empNo}">${p}</a></li>
										</c:otherwise>
									</c:choose>
									
								</c:forEach>
									
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<li class="page-item"><a class="page-link" href="list.att?cpage=${pi.currentPage+1}&no=${loginUser.empNo}">&gt;</a></li>
								</c:if>
								
							</ul>
						</div>

					</div>
					<!-- 근태 상세 조회 영역 끝 -->

					<!-- 출퇴근 사이드바 영역 -->
					<div class="col-4">
						<div id="att-sidebar">
							<h5>TODAY</h5>
							<p id="today">2022.08.26 금요일</p>
							<button id="startAttBtn" class="small-btn green-btn" onclick="startAtt();">출근</button>
							&nbsp;
							<button id="endAttBtn" class="small-btn green-btn" data-bs-toggle="modal" data-bs-target="#endAttModal">퇴근</button>
							<br><br>
							<button class="small-btn green-btn" style="width: 150px;" onclick="location.href='apprOvertimeForm.si';">연장근무 신청</button>
							<hr>
							<p id="sTime" style="height:15px">출근 &nbsp;&nbsp;&nbsp;&nbsp;</p>
							<p id="eTime" style="height:15px">퇴근 &nbsp;&nbsp;&nbsp;&nbsp;<p>
							<hr>
							<table id="att-count">
									<tr>
										<th>정상</th>
										<th>지각</th>
									</tr>
									<tr>
										<th>
											<c:out value="${y}"/>
										</th>
										<th>
											<c:out value="${l}"/>
										</th>
									</tr>
									<tr>
										<th>조퇴</th>
										<th>결근</th>
									</tr>
									<tr>
										<th>
											<c:out value="${e}"/>
										</th>
										<th>
											<c:out value="${n}"/>
										</th>
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
							<div class="modal-body" style="text-align:center;">
								<br>
								<c:set var="current" value="<%= new java.util.Date() %>"/>
								<p><fmt:formatDate value="${current}" type="time" pattern="HH:mm"/></p>
								<p>퇴근하시겠습니까?</p>
								
							</div>
	
							<!-- Modal footer -->
							<div class="modal-footer" style="justify-content:center;">
								<form action="end.att" method="POST">
									<input type="hidden" name="no" value="${ loginUser.empNo }">
									<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
									<button class="btn green-btn">확인</button>
								</form>
							</div>
					</div>
				</div>
			</div>
			<!-- 퇴근 Modal 끝 -->
		</div>
		
		<script>
		
			// ----------- 페이지 로딩되자마자 실행할 내용 ------------
			$(function(){
				
				// 오늘 날짜 표시
				var today = new Date();
				
				var year = today.getFullYear();
				var month = today.getMonth() + 1;
				
				if(month.toString().length == 1){
					month = '0' + month;
				}
				var date = today.getDate();
				
				if(date.toString().length == 1){
					date = '0' + date;
				}
				var day = today.getDay();
				if(day == '0'){
					day = "일요일";
				}else if(day == '1'){
					day = "월요일";
				}else if(day == '2'){
					day = "화요일";
				}else if(day == '3'){
					day = "수요일";
				}else if(day == '4'){
					day = "목요일";
				}else if(day == '5'){
					day = "금요일";
				}else{
					day = "토요일";
				}
				
				$('#today').html(year + "." + month + "." + date + " " + day);
				
				// 출퇴근 여부 체크
				checkAtt();
				
			})
			
			// ----------- 출퇴근 여부 체크 함수 -------------
			function checkAtt(){
				$.ajax({
					url:"check.att",
					data:{
						no:${loginUser.empNo}
					},
					type:"POST",
					success:function(check){
						
						// 출퇴근 여부("YY", "YN", "NN") 담기
						var attResult = check.attResult;
						
						// 출근 시간 담기 (출근 시간 or NULL)
						var sTime = check.startTime;
						
						// 퇴근 시간 담기 (퇴근 시간 or NULL)
						var eTime = check.endTime;
						
						//console.log(attResult);
						
						// 출퇴근함 => 출퇴근 버튼 비활성화, 출퇴근 시간 표시
						if(attResult == 'YY'){
							
							$('#startAttBtn').attr('disabled', true);
							$('#endAttBtn').attr('disabled', true);
							
							$('#sTime').html("출근 &nbsp;&nbsp;&nbsp;&nbsp;" + sTime);
							$('#eTime').html("퇴근 &nbsp;&nbsp;&nbsp;&nbsp;" + eTime);
							
						}else if(attResult == 'YN'){
						// 출근만 함 => 출근 버튼 비활성화, 출근 시간 표시
						
							$('#startAttBtn').attr('disabled', true);
							$('#sTime').html("출근 &nbsp;&nbsp;&nbsp;&nbsp;" + sTime);
							$('input[name=startTime]').value(sTime);
						}
						
					},
					error:function(){
						console.log("출퇴근 여부 체크용 ajax 통신 실패");
					}
				})
			}
			// ------------------------------------------
			
			// -------------- 근태 검색 함수 ---------------
			function searchAtt(page){
				
				// 선택한 체크박스(정상/지각/조퇴/결근)를 담을 배열
				var status = new Array();
				
				// 체크된 체크박스 배열에 담기
				$('input[name="status"]:checked').each(function(){
					status.push($(this).val()); // ['Y', 'L', 'E']
				})
				
				// 콘솔창에 배열 출력해보기
				//console.log(status);
				
				// 근태 검색 ajax
				$.ajax({
					url:"search.att",
					data:{
						cpage:page,
						empNo:${loginUser.empNo},
						startDate:$('input[name=startDate]').val(),
						endDate:$('input[name=endDate]').val(),
						statusArr:status
					},
					type:"POST",
					success:function(map){
						
						//console.log(map);
						
						// map에서 페이징/근태 정보 꺼내서 변수에 담기
						const newPi = map.pi;
						const newList = map.newList;
						
						// 검색 결과를 담을 변수
						var txt = "";
						// 검색 결과 페이징 처리 변수
						var ptxt = "";
						
						// 검색 결과 담기
						if(newList.length == 0){ // 리스트 비어있으면 '조회 결과가 없습니다.'
							
							txt +=  	"<tr>";
							txt += 			'<td colspan="4" style="text-align:center;">조회 결과가 없습니다.</td>';
							txt +=		"</tr>";
							
						}else{ // 리스트 비어있지 않으면 조회 결과 보여주기
							
							for(var i=0; i<newList.length; i++){
								
								txt +=	'<tr>' +
											'<td>' + newList[i].attDate + '</td>' + 
											'<td>' + newList[i].startTime + '</td>' + 
											'<td>' + newList[i].endTime + '</td>';
												
								if(newList[i].status == 'Y'){
									
									txt += '<td>정상</td>';
									
								}else if(newList[i].status == 'L'){
									
									txt += '<td>지각</td>';
									
								}else if(newList[i].status == 'E'){
									
									txt += '<td>조퇴</td>';
									
								}else{
									
									txt += '<td>결근</td>';
								}
								
								txt += '</tr>';
							}	
						}
						
						// 검색 결과 페이징 처리
						if(newPi.currentPage != 1){
							
							ptxt += '<li class="page-item"><a class="page-link" href="searchAtt(' + newPi.currentPage-1 + ')">&lt;</a></li>';
						}
						
						for(var p = newPi.startPage; p <= newPi.endPage; p++){
							
							if(p == newPi.currentPage){
								
								ptxt += '<li class="page-item active"><a class="page-link" href="searchAtt(' + p + '">' + p + '</a></li>';
								
							}else{
								ptxt += '<li class="page-item"><a class="page-link" href="searchAtt(' + p + ')">' + p + '</a></li>';
							}
							
						}
						
						if(newPi.currentPage != newPi.maxPage){
							
							ptxt += '<li class="page-item"><a class="page-link" href="searchAtt(' + newPi.currentPage+1 + ')">&gt;</a></li>';
						}
						
						// 각 영역에 코드 넣어주기
						$('#attTable>tbody').empty().append(txt);
						$('#pageArea').empty().append(ptxt);
						
					},
					error:function(){
						console.log("근태 검색용 ajax 통신 실패");
					}
				})
			}
			
			// ------------ 출근 insert 함수 -------------
			function startAtt(){
				$.ajax({
					url:"insert.att",
					type:"post",
					data:{
						no:${loginUser.empNo}
					},
					success:function(startTime){
						
						//console.log(startTime);
						$('#startWork').html("출근 &nbsp;&nbsp;&nbsp;&nbsp;" + startTime);
						$('#startAttBtn').attr('disabled', true);
					},
					error:function(){
						console.log("출근용 ajax 통신 실패");
					}
				})
			}
		</script>
		<!-- content-wrapper ends -->
		<!-- partial:partials/_footer.html -->

		<jsp:include page="../common/footer.jsp" />

		<!-- partial -->
	</div>
	<!-- main-panel ends -->

</body>
</html>