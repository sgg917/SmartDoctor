<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 로고 -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<meta charset="UTF-8">
<title>월간 근태 체크</title>
<!-- fullCalender theme -->
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css'
	rel='stylesheet'>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css'
	rel='stylesheet'>
<!-- fullCalender CDN -->
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
/* --- 공통 ---*/
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
/* ---------- */
#calendar-wrapper {
	width: 90%;
	margin: auto;
	padding-top: 50px;
	padding-bottom: 80px;
}
.fc-toolbar-chunk button {
	background:#1D5C83 !important;
	border-color:#1D5C83 !important;
}
.fc-toolbar-chunk button:hover {
	background:#1A3C40 !important;
	border-color:#1A3C40 !important;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />

	<!-- partial !!!여기서부터 메인 시작!!! -->
	<div class="main-panel">
		<div class="content-wrapper">
			<h3><b>월간 근태 체크</b></h3>
			<br><hr><br>
			<div class="wrap11" id="att-area">
				<div id="calendar-wrapper">
					<div id='calendar' width="90%">로딩중...</div>
				</div>
			</div>

		</div>
		<!-- content-wrapper ends -->
		<!-- partial:partials/_footer.html -->
		<footer class="footer">
			<jsp:include page="../common/footer.jsp" />
		</footer>
		<!-- partial -->
	</div>
	
	<script>
	
		$(function(){

			$.ajax({
				url:"calendar.att",
				data:{
					empNo:${loginUser.empNo}
				},
				type:"POST",
				success:function(map){
					
					// 근태 리스트
					var list = map.list;
					
					// 넘겨줄 값 리스트로 다시 담기
					var data = [];
					for(let i=0; i<list.length; i++){
						
						// 출근한 날 출퇴근 시간 표시
						if(list[i].status == '정상' || list[i].status == '지각'){
							let start = {
									title : '출근',
									start : list[i].attDate + 'T' + list[i].startTime,
									end : list[i].attDate + 'T' + list[i].startTime,
									allDay : false,
									editable : false,
										}
							let end = {
									title : '퇴근',
									start : list[i].attDate + 'T' + list[i].endTime,
									end : list[i].attDate + 'T' + list[i].endTime,
									allDay : false,
									editable : false
									  }
							data.push(start);
							data.push(end);
						}
						
						// 휴가 표시
						if(list[i].status == '휴가'){
							let vac = {
									title : '휴가',
									start : list[i].attDate,
									editable : false
									  }
							data.push(vac);
						}
						
					}
					
					// 캘린더 렌더링
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						headerToolbar : {
							left : 'today',
							center : 'title',
							right : 'prev,next'
						},
						expandRows : true,
						timeZone : 'local',
						initialView : 'dayGridMonth',
						themeSystem : 'bootstrap5',
						locale : 'ko',
						events : data,
						eventColor : '#417D7A',
						eventTimeFormat : {
							hour : '2-digit',
							minute : '2-digit',
							meridiem : false
						}
					});
					$('#calendar').empty();
					calendar.render();
				},
				error:function(){
					console.log("월간 근태 조회용 ajax통신 실패");
				}
			})
			
		})
	</script>

</body>
</html>