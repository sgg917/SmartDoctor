<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 휴가 관리</title>
<style>
.wrap11 {
	width: 100%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
}

/* 초록 버튼 */
.green-btn {
	background: RGB(29, 92, 99);
	color: white;
}

.green-btn:hover {
	background: #1D5C83;
	color: white;
}

/* 작은 버튼 */
.small-btn {
	width: 70px;
	height: 30px;
	border-style: none;
	border-radius: 7px;
	font-weight: 400;
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

/* 조건 검색 테이블 스타일 */
#mem-vac-condition {
	margin-top: 50px;
}

/* 연차 테이블 스타일 */
#mem-vacation {
	text-align: center;
}

th {
	font-weight: bold !important;
	background: #f2f2f2 !important;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />

	<!-- partial !!!여기서부터 메인 시작!!! -->
	<div class="main-panel">
		<div class="content-wrapper">
			<h3><b>사원 휴가 관리</b></h3>
			<br>
			<hr>

			<!-- wrap 영역 -->
			<div class="container card wrap11">
				<br>
				<!-- 조건 검색 테이블 -->
				<div class="form-group" style="margin-left: 80px;">
					<table id="mem-vac-condition">
						<tr height="30px">
							<td width="100px;">
								<select class="form-control" name="condition" id="condition">
									<option name="type" value="dept_name">부서명</option>
									<option name="type" value="user_name">이름</option>
								</select>
							</td>
							<td width="200px;">
								<input class="form-control" type="text" name="keyword"
									   placeholder="키워드를 입력해 주세요." style="height: 25px;">
							</td>
							<td width="100px;" style="text-align: right;">
								<button class="green-btn small-btn" onclick="searchVac(1);">조회</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- 조건 검색 테이블 끝-->

				<!-- 사원 연차 테이블 -->
				<table id="mem-vacation" class="table"
					style="width: 90%; margin: 0 auto;">
					<thead>
						<tr>
							<th>부서</th>
							<th>이름</th>
							<th>연차지급일수</th>
							<th>연차잔여일수</th>
							<th>내역조회</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ empty list }">
								<tr>
									<td colspan="5">조회 내역이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="m" items="${list}">
									<tr>
										<td>${ m.deptName }</td>
										<td>${ m.empName }</td>
										<td>${ m.vacAll }</td>
										
										<c:set var="remain" value="20"/>
										<c:forEach var="v" items="${vacList}">
											<c:choose>
												<c:when test="${ m.empNo eq v.empNo }">
													<c:set var="remain" value="${ v.vacRemain }"/>
												</c:when>
											</c:choose>
										</c:forEach>
										<td>
											<c:out value="${ remain }"/>
										</td>
										
										<td>
											<button class="green-btn small-btn btn-modal" onclick="selectVac(${m.empNo},'${m.empName}');" data-bs-toggle="modal" data-bs-target="#vacationModal">조회</button>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br>
				<!-- 사원 연차 테이블 끝 -->
				<!-- 테이블 페이징 -->
				<div class="pagination">
	                <ul class="pagination" id="pageArea" style="margin:auto;">
	                
                  	<c:if test="${ pi.currentPage ne 1 }">
						<li class="page-item"><a class="page-link" href="allList.vac?cpage=${pi.currentPage-1}">&lt;</a></li>
					</c:if>
			
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<li class="page-item active"><a class="page-link" href="allList.vac?cpage=${p}">${p}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="allList.vac?cpage=${p}">${p}</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					
                 	<c:if test="${ pi.currentPage ne pi.maxPage }">
                 		<li class="page-item"><a class="page-link" href="allList.vac?cpage=${pi.currentPage+1}">&gt;</a></li>
               		</c:if>
	                </ul>
	            </div>
				<!-- 테이블 페이징 끝 -->
				<br>
				<br>
				<br>
				<br>
			</div>

			<!-- 사원별 연차 내역조회 모달  -->
			<div class="modal" id="vacationModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header" style="background: white;">
							<h4 class="modal-title">
								<b>홍길동님의 연차내역</b>
							</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<!-- Modal body -->
						<div class="modal-body" style="background: white;">
							<table class="table">
								<thead>
									<tr>
										<th>No</th>
										<th>신청일</th>
										<th>휴가일</th>
										<th>사유</th>
										<th>결재상태</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<!-- 사원별 연차내역 조회 모달 끝 -->

		</div>
		
		<script>
		
			// ----------- 사원별 연차 리스트 조회 ajax ------------
			function selectVac(empNo, empName){
				
				//console.log("empNo : " + empNo);
				//console.log("empName : " + empName);
				
				$('.modal-title>b').text(empName + "님의 연차 내역");
				
				$.ajax({
					url:"memList.vac",
					type:"POST",
					data:{
						no:empNo
					},
					success:function(data){
						
						// 사원별 연차 리스트 담기
						var newList = data;
						
						console.log(newList);
						
						// 
						var txt = "";
						
						if( newList != null && newList.length != 0 ){
							
							for(var i=0; i<newList.length; i++){
								
								txt += "<tr>";
								txt += "<td>" + newList[i].appNo + "</td>";
								txt += "<td>" + newList[i].enrollDate + "</td>";
								
								if( newList[i].startDate == newList[i].endDate ){
									
									txt += "<td>" + newList[i].startDate + "</td>";
									
								}else{
									
									txt += "<td>" + newList[i].startDate + " ~ " + newList[i].endDate + "</td>";
									
								}
								
								txt += "<td>" + newList[i].vacCause + "</td>";
								txt += "<td>" + newList[i].status + "</td>";
								txt += "</tr>";
							}
							
						}else{
							txt += "<tr>";
							txt += "<td colspan='5' style='text-align:center;'>연차 사용 내역이 없습니다.</td>"
							txt += "</tr>";
						}
						
						// 모달창 테이블 tbody 내용
						$('.modal-body tbody').empty();
						$('.modal-body tbody').append(txt);
						
					},
					error:function(){
						console.log("사원별 연차 리스트 조회용 ajax 통신 실패");
					}
				})
			}
			
			// 키워드로 사원 검색 ajax
			function searchVac(no){
				
				// 키워드 입력 칸이 빈칸이면 검색 불가능
				if($('input[name=keyword]').val() == null || $('input[name=keyword]').val() == "" ){
					alert("키워드를 입력해 주세요.");
					return false;
				}
				
				$.ajax({
					url:"search.vac",
					type:"POST",
					data:{
						cpage:no,
						type:$('option[name=type]:selected').val(),
						keyword:$('input[name=keyword]').val()
					},
					success:function(map){
						
						// map에 담긴 데이터 뽑기
						var newList = map.list;
						var newPi = map.pi;
						var vlist = map.vlist;
						
						// 검색 결과를 담을 변수
						var txt = "";
						// 검색 결과를 페이징 처리할 변수
						var ptxt = "";
						
						//console.log(newList);
						//console.log(newPi);
						//console.log(vlist);
						
						// 검색 결과
						if( newList == null || newList == "" ){
							
							txt += "<tr><td colspan='5'>조회 내역이 없습니다.</td></tr>";
							
						}else{
							
							for(var m=0; m<newList.length; m++){
								
								txt += "<tr>";
								txt += "<td>" + newList[m].deptName + "</td>";
								txt += "<td>" + newList[m].empName + "</td>";
								txt += "<td>" + newList[m].vacAll + '</td>';
								
								// 연차 잔여일수를 담을 변수 (디폴트 20)
								var remain = 20;
								
								for(var v=0; v<vlist.length; v++){
									
									if( newList[m].empNo == vlist[v].empNo ){
										
										remain = vlist[v].vacRemain;
									}
								}
								
								txt += "<td>" + remain + "</td>";
								txt += "<td>" ;
								txt +=	'<button class="green-btn small-btn btn-modal" onclick="selectVac(' + newList[m].empNo + ",'" + newList[m].empName + "');" + '"' + 'data-bs-toggle="modal" data-bs-target="#vacationModal">조회</button>';
								txt += "</td>";
								txt += "</tr>";
								
							}
						}
						
						// 테이블 페이징 
	                  	if(newPi.currentPage != 1){
	                  		
	                  		ptxt += '<li class="page-item"><a class="page-link" href="allList.vac?cpage=' + newPi.currentPage-1 + '">&lt;</a></li>';
	                  	}
	                  	
	                  	for(var p=newPi.startPage; p<=newPi.endPage; p++){
	                  		
	                  		if(p == newPi.currentPage){
	                  			
	                  			ptxt += '<li class="page-item active"><a class="page-link" href="allList.vac?cpage=' + p + '">' + p + '</a></li>';
	                  			
	                  		}else{
	                  			
	                  			ptxt += '<li class="page-item"><a class="page-link" href="allList.vac?cpage=' + p + '">' + p + '</a></li>';
	                  			
	                  		}
	                  		
	                  	}
	                  	
						if(newPi.currentPage != newPi.maxPage){
	                  		
	                  		ptxt += '<li class="page-item"><a class="page-link" href="allList.vac?cpage=' + newPi.currentPage+1 + '">&gt;</a></li>';
	                  	}
						
						$('#mem-vacation>tbody').empty();
						$('#mem-vacation>tbody').append(txt);
						$('#pageArea').empty();
						$('#pageArea').append(ptxt);
						
					},error:function(){
						
						console.log("키워드로 사원 검색용 ajax 통신 실패");
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