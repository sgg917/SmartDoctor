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
.wrap111 {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

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

.calender1 {
	width: 48%;
	height: 650px;
	float: right;
	margin-right: 10px;
	color: rgb(65, 125, 122);
}

.wrap22 {
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
.wrap112{
	width:700px;
	background-color: white;
	text-align: center;
	border-radius: 30px 10px;
}



</style>




</head>


</head>
<body>

	<div class="container-scroller">



		<jsp:include page="../common/navbar.jsp" />

		<div class="main-panel">

			<div class="content-wrapper">
				<div class="wrap111">
					<form id="enrollForm" method="post" action="insert.op">
					
						<input type="hidden" id="bookingNo" class="form-control" value="${ op.bookingNo }" name="bookingNo">
						<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
						<input type="hidden" id="surgeryNo" class="form-control" value="${ s.surgeryNo }" name="surgeryNo"> 
						<input type="hidden" id="calendarNo" class="form-control" value="${ s.calendarNo }" name="calendarNo"> 
						<input type="hidden" id="leadTime" class="form-control" value="${ s.leadTime }" name="leadTime"> 
						<br>
						<h3> <b>차트번호 ${ op.clinicNo } 수술실 예약 조회</b> </h3>
						<hr>
						<br><br>
						<div class="wrap22">
							<div class="part1">
								
								<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">조회</div>
									<div style="display: inline-block; margin-left: 30px;">
										<h3>${op.surDate}</h3>
									</div>
								</td>
							</tr>
							<tr>
								<th>차트번호</th>
								<td><input readonly name="clinicNo" value="${ c.clinicNo }" type="text"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>수진자명</th>
								<td><input type="text" style="width: 300px;" readonly value="${p.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" readonly value="${op.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="date" style="width: 300px;" name="surDate" readonly value="${op.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td><input type="time" style="width: 300px;" name="surStartTime" id="surStartTime" readonly value="${op.surStartTime }"></td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ op.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ t.doctorName }" name="docName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo" readonly>${op.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
								<br>
								<br>

								<button type="submit" class="btn btn-danger"
									style="height: 30px; width: 100px; padding: 0%; color: black; border: 0; background-color: rgb(65, 125, 122);">예약</button>

								<br><br><br><br><br><br><br><br>
								
							</div>
							<div id='calendar' class="calender1"></div>
						</div>
						<br><br><br><br><br><br>
						

					</form>
				</div>
				
			</div>
			

			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>







	<!-- @@@@@@@@@@@@@@@@@@수정Modal -->
	<div class="modal fade insertModal" id="myModal">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="wrap112">
		
				<input type="hidden" id="bookingNo" class="form-control" value="${ op.bookingNo }" name="bookingNo">
				<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
				<input type="hidden" id="surgeryNo" class="form-control" value="${ s.surgeryNo }" name="surgeryNo"> 
				<input type="hidden" id="calendarNo" class="form-control" value="${ s.calendarNo }" name="calendarNo"> 
				<input type="hidden" id="leadTime" class="form-control" value="${ s.leadTime }" name="leadTime"> 
				<br>
				<h3> <b>차트번호 수술실 예약 조회</b> </h3>
				<hr>
				<div class="wrap221" style="width:100%">
					<div class="part1" style="width:100%">
						<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">조회</div>
									<div style="display: inline-block; margin-left: 30px;">
										<h3>${op.surDate}</h3>
									</div>
								</td>
							</tr>
							<tr>
								<th>차트번호</th>
								<td><input readonly name="clinicNo" value="${ c.clinicNo }" type="text"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>수진자명</th>
								<td><input type="text" style="width: 300px;" readonly value="${p.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" readonly value="${op.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="date" style="width: 300px;" name="surDate" readonly value="${op.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td><input type="time" style="width: 300px;" name="surStartTime" id="surStartTime" readonly value="${op.surStartTime }"></td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ op.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ t.doctorName }" name="docName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo" readonly>${op.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
	
						<br>
						<br>
	
						<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: rgb(65, 125, 122);">수정</button>
	           			<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: red">수술취소</button>
	         			<button type="button" class="btn btn-secondary" style="height: 30px; width: 100px; padding:0%; color:black;">뒤로가기</button>
						<br><br><br><br><br><br><br><br>
						
					</div>
				</div>
				</div>
		    </div>
	    </div>
  	</div>





	<script>
	
		$(function() {

			$.ajax({
				url : "list.ca",
				//data : {no:${c.calendarNo}},
				success : function(list) {

					//console.log(list);

					let data = [];/* 내가 넘겨주고자 하는 값을 리스트로 다시 담아줘야함! */
					for (let i = 0; i < list.length; i++) {
						let obj = {
							title : list[i].clinicNo,
							start : list[i].surDate,
							end : list[i].surDate,
							textColor : list[i].textColor,
							backgroundColor : list[i].backgroundColor
						};
						data.push(obj);
					}

					// -------------------- 캘린더 렌더링 --------------------
					var initialLocaleCode = 'ko';
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView : 'dayGridMonth',
						locale : 'ko', // 한국어 설정
						 headerToolbar: {
						    left: 'prev,next today',
						    center: 'title',
						    right: 'dayGridMonth,timeGridWeek,timeGridDay'
						},
						selectable : true,
						droppable : true,
						editable : true,
						eventClick: function(arg) {
							ModalOpen(arg);	//이벤트 클릭 시 모달 호출
					    },
						events : data
					});

					calendar.render();
					// ------------------------------------------------------------

				},
				error : function() {
					console.log("통신 실패")
				}

			})

		});
	
		function ModalOpen(arg){
			$('#myModal').modal('show');
		  }
	</script>
	<!-- 계속 새로운 일정이 들어가면 또 새로 바로 띄워주게하기위해서 ajax를 function으로 빼줘서 사용하는것이 좋음-->

	<script>
		var Sum = function(){			
			var date1 = document.getElementsById("surStartTime").value;			
			var date2 = document.getElementsById("leadTime").value;			
			var result = Date.parse(date1) + Date.parse(date2);			
			document.getElementsById("surEndTime").value=result;		
			}	
	</script>
</body>
</html>