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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>



<style>
.wrap11 {
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


</style>




</head>


</head>
<body>

	<div class="container-scroller">



		<jsp:include page="../common/navbar.jsp" />

		<div class="main-panel">

			<div class="content-wrapper">
				<div class="wrap11">
					<form id="enrollForm" method="post" action="insert.op">
						<input type="hidden" id="opNo" class="form-control"
							value="${ op.bookingNo }" name="bookingNo"> <input
							type="hidden" id="cNo" class="form-control"
							value="${ c.clinicNo }" name="clinicNo"> <input
							type="hidden" id="sNo" class="form-control"
							value="${ s.surgeryNo }" name="surNo"> <br>
						<!-- 이 안에서 작업해 주세요 -->
						<h3>
							<b>차트번호 수술실 예약</b>
						</h3>
						<hr>
						<br> <br>
						<div class="wrap22">
							<div class="part1">
								<table class="table1">
									<tr>
										<td colspan="2" width="600px">
											<div class="smallbtn1">입력</div>
											<div style="display: inline-block; margin-left: 30px;">
												<h3>2022-08-30</h3>
											</div>
											<hr>
										</td>
									</tr>
									<tr>
										<th>차트번호</th>
										<td><input readonly name="clinic_no" value="" type="text"
											style="width: 300px;"></td>
									</tr>
									<tr>
										<th>수진자명</th>
										<td><input type="text" style="width: 300px;" readonly
											value=""></td>
									</tr>
									<tr>
										<th>수술실</th>
										<td><select name="roomName" id="roomName"
											style="width: 300px;">
												<option value="x">선택안함</option>
												<option value="a">operatingA</option>
												<option value="b">operatingB</option>
												<option value="c">operatingC</option>
												<option value="d">operatingD</option>
										</select> <!--
				                    <button onclick="test();">확인</button>
				                    <br>
				                    선택한 나라: <span id="result">선택안함</span> --> <script>
									function test() {
										//현재 선택된(selected 상태) option 요소 가져오기
										console.log($("option:selected").val());
										console.log($("option:selected").html());

										$("#result").html(
										$("option:selected").html());

									}
								</script></td>
									</tr>
									<tr>
										<th>예약날짜</th>
										<td><input type="date" style="width: 300px;"
											name="surDate"><br></td>
									</tr>
									<tr>
										<th>예약시각</th>
										<td><input type="time" style="width: 300px;"
											name="surTime"></td>
									</tr>
									<tr>
										<th>예상완료시각</th>
										<td><input type="text" readonly
											value="차트에서 소요시간 가져와서 + 로 완료시각 만들기" style="width: 300px;"
											name="surEnd"></td>
									</tr>
									<tr>
										<th>담당의</th>
										<td><input type="text" style="width: 300px;" readOnly
											value="${ t.doctorName }" name="docName"></td>
									</tr>
									<tr>
										<th>특이사항</th>
										<td><textarea type="text"
												style="width: 300px; height: 100px; resize: none;"
												name="memo"></textarea></td>
									</tr>


								</table>

								<br>
								<br>

								<button type="submit" class="btn btn-danger"
									style="height: 30px; width: 100px; padding: 0%; color: black; border: 0; background-color: rgb(65, 125, 122);">예약</button>

								<br><br>
								
							</div>
							<div id='calendar' class="calender1"></div>
							<br> <br> <br>
						</div>


					</form>
				</div>
			</div>


			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
<script src="js/main.js"></script>
<script src="js/locales-all.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

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
							title : list[i].calendarTitle,
							start : list[i].calendarStart,
							end : list[i].calenderEnd,
							textColor : list[i].textColor,
							backgroundColor : list[i].backgroundColor
						};
						data.push(obj);
					}

					// -------------------- 캘린더 렌더링 --------------------
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView : 'dayGridMonth',
						locale : 'ko', // 한국어 설정
						headerToolbar : {
							start : "",
							center : "prev title next",
							end : 'dayGridMonth,dayGridWeek,dayGridDay'
							
						},
						selectable : true,
						droppable : true,
						editable : true,
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
	</script>

<!-- 계속 새로운 일정이 들어가면 또 새로 바로 띄워주게하기위해서 ajax를 function으로 빼줘서 사용하는것이 좋음 -->

</body>
</html>