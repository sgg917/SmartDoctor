<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SMART DOCTOR</title>
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


<!--@@ fullcalendar CDN 가져가세용~-->
<link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/lib/main.js'></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>


.table1 {
	margin: auto;
}

.smallbtn1 {
	border-radius: 10px 10px 10px 10px;
	width: 50px;
	height: 20px;
	background-color: rgb(26, 188, 156);
	font-size: 0.8em;
	display: inline-block;
}

th {
	height: 50px;
	text-align: left;
}

.part1 {
	width: 50%;
	float: left;
	margin: auto;
}



.wrap221 {
	width: 95%;
	margin: auto;
}

/* 풀캘린더 style */
#calendar{
	color:black;
}

.fc .fc-button{
	height:30px;
	padding:1;
	font-size:0.8em;
}

.fc .fc-toolbar-title{
	font-size:1.5em;
}


/* 모달 style */
.modal-body{
	width:730px;
	background-color: #F2F2F2;
	text-align: center;
	border-radius: 30px 10px;
}



</style>




</head>


</head>
<body>

	
				
	<div class="modal-body">
		<div class="wrap112">

			<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
			<input type="hidden" id="bookingNo" class="form-control" value="${ c.bookingNo }" name="bookingNo">
			<br>
			<h3>
				<b>입원실 예약 조회</b>
			</h3>
			<hr>
			<div class="wrap221" style="width: 100%">
				<div class="part1" style="width: 100%">
					<table class="table1" style="width: 100%">
						<tr>
							<td colspan="2">
								<div class="smallbtn1">조회</div>
								<div style="display: inline-block; margin-left: 30px;">
									<h3>${c.enterDate}</h3>
								</div>
							</td>
						</tr>
						<tr>
							<th>차트번호</th>
							<td><input readonly name="clinicNo"
								value="${ c.clinicNo }" type="text" style="width: 300px;"></td>
						</tr>
						<tr>
							<th>수진자명</th>
							<td><input name="patientName" type="text" style="width: 300px;" readonly
								value="${c.patientName }"></td>
						</tr>
						<tr>
							<th>입원실</th>
							<td><input name="roomName" type="text" style="width: 300px;" readonly
								value="${c.roomName }"></td>
						</tr>
						<tr>
							<th>입원날짜</th>
							<td><input type="date" style="width: 300px;"
								name="enterDate" readonly value="${c.enterDate }"><br></td>
						</tr>
						<tr>
							<th>퇴원날짜</th>
							<td><input type="date" style="width: 300px;"
								name="leaveDate" readonly
								value="${c.leaveDate }"></td>
						</tr>
						<tr>
							<th>담당의</th>
							<td><input type="text" style="width: 300px;" readOnly
								value="${ c.docName }" name="docName"></td>
						</tr>
						<tr>
							<th>특이사항</th>
							<td><textarea
									style="width: 300px; height: 100px; resize: none;"
									name="memo" readonly>${c.memo}</textarea></td>
						</tr>


					</table>

					<br> <br>

					<button type="button" class="btn btn-secondary"
						style="height: 30px; width: 100px; padding: 0%; color: black;"
						onclick="ModalClose()">뒤로가기</button>
					<br>
					<br>
					

				</div>
			</div>
		</div>
	</div>
			
		
	




</body>
</html>