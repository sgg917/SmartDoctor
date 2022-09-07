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
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>

<style>
.content11 {
	height: 500px;
	width: 100%;
	background-color: #F2F2F2;
	border: 1px solid blue;
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
							<p class="mb-0 font-weight-medium me-3 buy-now-text">공지 넣으면
								좋을것같아요</p>
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
				메인 내용 담기
			</div>
			<jsp:include page="common/footer.jsp" />
		</div>


	</div>

	<!-- plugins:js -->
	<script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="resources/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/todolist.js"></script>
	<!-- End custom js for this page -->

</body>
</html>