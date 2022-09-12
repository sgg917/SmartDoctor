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

.calender1 {
	width: 90%;
	height: 650px;
	margin: auto;
	color: rgb(65, 125, 122);
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

.button {
	width: 110px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
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
					<br><br>
					<div id='calendar' class="calender1"></div>
					<div align="right" style="padding-right: 80px; padding-top: 10px;">
						<button class="button">+ 일정추가</button>
					</div>
				</div>


			</div>
			<jsp:include page="../common/footer.jsp" />
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
	
		
		
		function clickRevBtn(){
		     
		   // db에 넣기
		   $.ajax({
		      url:"insert.op",
		      data:{surgeryNo:surgeryNo,
		    	  	clinicNo:clinicNo, 
		    	  	roomName:roomName, 
		    	  	surDate:surDate, 
		    	  	surEndTime:surEndTime,
		    	  	doctorName:doctorName,
		    	  	memo:memo
		            },
		      type:"POST",
		      dataType:"JSON",
		      success:function(json){
		         
		         
		         // 예약일로 입력한 값이 db에서 중복되는지 안되는지로 나눔
		         if (json.n == 1) {
		            alert("수술실 예약 되었습니다.");
		            
		         }else if (json.n == -1) {
		            // 중복된 예약(시간)으로 예약에 실패했을 때
		            alert("해당 시간에는 이미 예약이 있습니다.");
		         }
		         else{
		            // db오류
		            alert("DB 오류");
		         }
		         location.reload();
		         
		      },
		      error: function(){
		         alert("오류로 인한 예약실패");
		       }
		   });
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