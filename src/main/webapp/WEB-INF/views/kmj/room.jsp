<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon-16x16.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<style>
.wrap11 {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

.button {
	width: 20px;
	height: 20px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 50px;
	border: 0;
}

.detail {
	width: 60px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
}

.bggray {
	background-color: lightgray !important;
}

b {
	font-size: 20px;
}

.title {
	border-radius: 7px;
	height: 50px;
}

.table {
	width: 100%;
}

.innerArea {
	width: 1000px;
	height: auto;
	margin: auto;
}

#tableArea {
	height: 100%;
	width: auto;
	text-align: center;
	overflow: auto;
}

#tableArea>table {
	width: 100%;
	box-sizing: border-box;
}
</style>


</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">
				<br> <br> <br>

				<div class="innerArea">
					<table class="table bggray title">
						<tr height="40">
							<td><b>입원실 현황</B></td>
						</tr>
					</table>
					<br>
					
					<form action="room.mj" method="post">
						<div align="center">
							<button type="submit" name="cDate" class="button" value="${preDate}">&lt;</button>
							${showDate}
							<button type="submit" name="cDate" class="button" value="${nextDate}">&gt;</button>
						</div>
					</form>
					
					<br>
					<div id="tableArea" align="center">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>날짜 / 호</th>
									<c:forEach var="r" items="${ roomList }">
										<th>${r.proomNo }호${r.capacity }인실</th>
									</c:forEach>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="d" items="${ dayList }">
									<tr>
										<td>${ d.date }</td>
										<td>
											<c:forEach var="b" items="${ bookingList }">
													<c:choose>
														<c:when test="${ d.date == b.date and b.proomNo == '102' }">
															${ fn:replace(b.nameList, ',', '<br>') }
														</c:when>
														<c:otherwise>
														
														</c:otherwise>
													</c:choose>
	
												</c:forEach>
										</td>

										<td>
											<c:forEach var="b" items="${ bookingList }">
													<c:choose>
														<c:when test="${ d.date == b.date and b.proomNo == '104' }">
															${ fn:replace(b.nameList, ',', '<br>') }
														</c:when>
														<c:otherwise>
														
														</c:otherwise>
													</c:choose>
	
												</c:forEach>
										</td>
										
										<td>
											<c:forEach var="b" items="${ bookingList }">
													<c:choose>
														<c:when test="${ d.date == b.date and b.proomNo == '202' }">
															${ fn:replace(b.nameList, ',', '<br>') }
														</c:when>
														<c:otherwise>
														
														</c:otherwise>
													</c:choose>
	
												</c:forEach>
										</td>
										
										<td>
											<c:forEach var="b" items="${ bookingList }">
													<c:choose>
														<c:when test="${ d.date == b.date and b.proomNo == '204' }">
															${ fn:replace(b.nameList, ',', '<br>') }
														</c:when>
														<c:otherwise>
														
														</c:otherwise>
													</c:choose>
	
												</c:forEach>
										</td>
								</c:forEach>

							</tbody>
						</table>
					</div>

				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>