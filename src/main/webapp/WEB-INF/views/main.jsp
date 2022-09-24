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
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon-16x16.png">



<style>
.content11 {
	height: 500px;
	width: 100%;
	background-color: #F2F2F2;
	border: 1px solid blue;
}

.stretch-card>.card {
	height: 150px;
}

.bg-gradient-success {
	background: linear-gradient(to right, #84d9d2, #07cdae) !important;
}

.btn1 {
	width: 80px;
	height: 30px;
	border: 0px;
	border-radius: 5px;
	background: rgb(65, 125, 122);
	color: white;
	font-size: 15px;
}

</style>


</head>
<body>

	<div class="container-scroller">

		<!-- 이부분은 팝업 배너입니다 작업하실때는 제외 하셔도 됩니다! -->
		<div class="row p-0 m-0 proBanner" id="proBanner">
			<div class="col-md-12 p-0 m-0">
				<div
					class="card-body card-body-padding d-flex align-items-center justify-content-between">
					<div class="ps-lg-1">
						<div class="d-flex align-items-center justify-content-between">
							<p class="mb-0 font-weight-medium me-3 buy-now-text">서버 일시점검
								안내</p>
						</div>
					</div>
					<div class="d-flex align-items-center justify-content-between">
						<button id="bannerClose" class="btn border-0 p-0">
							<i class="mdi mdi-close text-white me-0"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!--팝업배너 끝-->

		<jsp:include page="common/navbar.jsp" />

		<div class="main-panel">
			<div class="content-wrapper">
				<!-- 이 안에서 작업해 주세요 -->

				<!-- 내원 환자 수 카드 -->
				<div class="row" id="patientCountArea">
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-danger card-img-holder text-white">
							<div class="card-body">
								<!-- <img src="../assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" /> -->
								<h4 class="font-weight-bold mb-3">
									오늘 내원 환자 수 <i class="mdi mdi-chart-line mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5" id="day">48</h2>
							</div>
						</div>
					</div>
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-info card-img-holder text-white">
							<div class="card-body">
								<!-- <img src="../assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" /> -->
								<h4 class="font-weight-bold mb-3">
									이번 주 내원 환자 수 <i
										class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5" id="week">245</h2>
							</div>
						</div>
					</div>
					<div class="col-md-4 stretch-card grid-margin">
						<div class="card bg-gradient-success card-img-holder text-white">
							<div class="card-body">
								<!-- <img src="../assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" /> -->
								<h4 class="font-weight-bold mb-3">
									이번 달 내원 환자 수 <i class="mdi mdi-diamond mdi-24px float-right"></i>
								</h4>
								<h2 class="mb-5" id="month">1308</h2>
							</div>
						</div>
					</div>
				</div>
				<!-- 내원 환자 수 카드 끝 -->







				<!-- 진료과별 차트 -->
				<div class="row">
					<div class="col-md-7 grid-margin stretch-card">
						<div class="card" style="height: 100%;">
							<div class="card-body">
								<div class="clearfix">
									<h4 class="card-title float-left">월간 방문자 수</h4>
									<div id="visit-sale-chart-legend"
										class="rounded-legend legend-horizontal legend-top-right float-right"></div>
								</div>
								<canvas id="visit-sale-chart" class="mt-4"></canvas>
							</div>
						</div>
					</div>
					<div class="col-md-5 grid-margin stretch-card">
						<div class="card" style="height: 100%;">
							<div class="card-body">
								<h4 class="card-title">진료과별 내원객 수</h4>
								<canvas id="traffic-chart"></canvas>
								<div id="traffic-chart-legend"
									class="rounded-legend legend-vertical legend-bottom-left pt-4"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 진료과별 차트 끝 -->








				<!-- 투두리스트 + 날씨 -->
				<div class="row">
					<div class="col-md-5 grid-margin stretch-card">
						<div class="card" style="height: 100%;">
							<div class="card-body">
								<h4 class="card-title text-white">Todo</h4>
								<div class="add-items d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="할일을 적어주세요">
									<button class="add btn1 font-weight-bold todo-list-add-btn"
										id="add-task">add</button>
								</div>
								<div class="list-wrapper">
									<ul
										class="d-flex flex-column-reverse todo-list todo-list-custom">
										<li>
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 점심 시간 전 메일 송신
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
										<li class="completed">
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox" checked> 원무부에 전화걸기
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
										<li>
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 교수님께 홍길동 환자 관련
													여쭤보기
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
										<li>
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 도너츠 사가기
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
										<li class="completed">
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox" checked> 학회 정보
													찾아보기
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
										<li>
											<div class="form-check">
												<label class="form-check-label"> <input
													class="checkbox" type="checkbox"> 논문 퇴고하기
												</label>
											</div> <i class="remove mdi mdi-close-circle-outline"></i>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-7 grid-margin stretch-card">
						<div class="card" style="height: 100%;">
							<div class="card-body">
								<iframe width="100% " height="245"
									src="https://forecast.io/embed/#lat=37.5662&lon=126.9785&name=서울&color=#F6A8A6&font=arial&units=si"
									frameborder="0"></iframe>
								<script>/*<![CDATA[*/
$(document).ready(function(){setTimeout(function(){window.location.reload(1)},300000)})
/*]]>*/</script>
								<script src="//code.jquery.com/jquery-latest.min.js"></script>
							</div>
						</div>
					</div>
				</div>

				<!-- 투두리스트 + 날씨 끝 -->
				
				
				
				<!-- 공지사항 시작 -->
				<div class="row">
					<div class="col-md-12 grid-margin stretch-card">
						<div class="card" style="height: 100%;">
							<div class="card-body">
							<div style="float: left;">
		                    	<h2 style="float: left;">공지사항</h2>
		                    	<br>
		                    </div>
                    
					<br><br><br><br>
					

                    <table id="noticeList" class="table table-hover">

                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성일</th>
                          <th>조회수</th>
                        </tr>
                      </thead>
                      
                      <tbody>
	                      <c:choose>
	                      	<c:when test="${ empty list }">
	                      		<tr>
	                      			<td colspan="4">현재 공지사항이 없습니다.</td>
	                      		</tr>
	                      	</c:when>
	                      	<c:otherwise>
	                      		<c:forEach var="n" items="${ list }">
	                      			<tr>
			                          <td class="no">${ n.noticeNo }</td>
			                          <td>${ n.noticeTitle }</td>
			                          <td>${ n.enrollDate }</td>
			                          <td>${ n.count }</td>
			                        </tr>
	                      		</c:forEach>
	                      	</c:otherwise>
	                      </c:choose>
                      </tbody>
                      
                     <script>
                      	$(function(){
                      		$("#noticeList>tbody>tr").click(function(){
                      			location.href = "detail.no?no=" + $(this).children(".no").text();
                      		})
                      	})
                      </script>
                      
                    </table>
							
							
							
							
							
							
							
							</div>
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="common/footer.jsp" />
		</div>


	</div>

</body>
</html>