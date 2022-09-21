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

<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">


<style>
.content11 {
	height: 500px;
	width: 100%;
	background-color: #F2F2F2;
	border: 1px solid blue;
}

.stretch-card > .card {
 	height:150px;
}

.bg-gradient-success {
	background: linear-gradient(to right, #84d9d2, #07cdae) !important;
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
							<p class="mb-0 font-weight-medium me-3 buy-now-text">서버 일시점검 안내</p>
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
	                    <h4 class="font-weight-normal mb-3">오늘 내원 환자 수 <i class="mdi mdi-chart-line mdi-24px float-right"></i>
	                    </h4>
	                    <h2 class="mb-5" id="day">15</h2>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-4 stretch-card grid-margin">
	                <div class="card bg-gradient-info card-img-holder text-white">
	                  <div class="card-body">
	                     <!-- <img src="../assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" /> -->
	                    <h4 class="font-weight-normal mb-3">이번 주 내원 환자 수 <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
	                    </h4>
	                    <h2 class="mb-5" id="week">1,253</h2>
	                  </div>
	                </div>
	              </div>
	              <div class="col-md-4 stretch-card grid-margin">
	                <div class="card bg-gradient-success card-img-holder text-white">
	                  <div class="card-body">
	                     <!-- <img src="../assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" /> -->
	                    <h4 class="font-weight-normal mb-3">이번 달 내원 환자 수 <i class="mdi mdi-diamond mdi-24px float-right"></i>
	                    </h4>
	                    <h2 class="mb-5" id="month">40,949</h2>
	                  </div>
	                </div>
	              </div>
	            </div>
				<!-- 내원 환자 수 카드 끝 -->
				
				
				
				
			
              

				<!-- 진료과별 차트 -->
				<div class="row">
		            <div class="col-md-7 grid-margin stretch-card">
		              <div class="card">
		                <div class="card-body">
		                  <h4 class="card-title">Sale Overview</h4>
		                  <canvas id="sales-chart"></canvas>
		                </div>
		              </div>
		            </div>
	           </div>
	           <!-- 진료과별 차트 끝 -->
			</div>
			<jsp:include page="common/footer.jsp" />
		</div>


	</div>

</body>
</html>