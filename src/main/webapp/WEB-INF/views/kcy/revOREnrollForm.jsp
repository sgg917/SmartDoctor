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
	background-color: #F2F2F2;
	text-align: center;
	border-radius: 30px 10px;
}

.mymodal2 .modal-backdrop {
  /* display: block; 검은색레이어*/
  display: none;
  /* background clickable */
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
						<!-- 숨겨서 넘길 값--> 
						<input type="hidden" id="clinicNo1" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
						<input type="hidden" id="surgeryNo1" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
						<input type="hidden" id="leadTime1" class="form-control" value="${ c.leadTime }" name="leadTime">
						<input type="hidden" id="bookingNo1" class="form-control" value="${ c.bookingNo }" name="bookingNo">
	
						<br>
						<h3> <b>차트번호 ${c.clinicNo} 수술실 예약</b> </h3>
						<hr>
						<br><br>
						<div class="wrap22">
							<div class="part1">
								<table class="table1">
									<tr>
										<td colspan="2" width="600px">
											<div class="smallbtn1">입력</div>
											<div style="display: inline-block; margin-left: 30px;">
												<h3>예약일자<c:set var="ymd" value="<%=new java.util.Date()%>" />
													<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
												</h3>
											</div>
											<hr>
										</td>
									</tr>
									<tr>
										<th>차트번호</th>
										<td><input readonly name="clinicNo" value="${c.clinicNo}" type="text"
											style="width: 300px; background-color:#F2F2F2;"></td>
									</tr>
									<tr>
										<th>수진자명</th>
										<td><input type="text" name="patentName" style="width: 300px;  background-color:#F2F2F2;" readonly value="${ c.patientName }"></td>
									</tr>
									<tr>
										<th>수술실</th>
										<td>
										<select name="roomName" id="roomName" style="width: 300px;">
												<option value="x">선택안함</option>
												<option value="operatingA">operatingA</option>
												<option value="operatingB">operatingB</option>
												<option value="operatingC">operatingC</option>
												<option value="operatingD">operatingD</option>
										</select> 
				                   
										</td>
									</tr>
									<tr>
										<th>예약날짜</th>
										<td>
										<input type="date" class="datepicker" name="surDate" style="width: 225px; height: 25.2px;">
									   <select class="surStartTime" style="width: 70px; height: 25.2px;" name="surStartTime" id="surStartTime">
										<c:set var="breakPoint" value="0" />
										<c:forEach var="i" begin="9" end="22">
											<c:forEach var="j" begin="0" end="1">
												<c:if test="${(i == 24) && (j == 1)}">    
													<c:set var="breakPoint" value="1" />                                    
												</c:if>
												<c:if test="${breakPoint == 0}">                           
													<option value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />">
													<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
												</c:if>
											</c:forEach>
										</c:forEach>
								   </select>
								   
								   <br>
								   </td>
									</tr>
									<tr>
										<th>예상완료시각</th>
										<td><input type="text" readonly style="width: 300px;  background-color:#F2F2F2;" name="surEndTime" id="surEndTime"></td>
									</tr>
									<tr>
										<th>담당의</th>
										<td><input type="text" style="width: 300px;" name="doctorName" value="${c.docName}"></td>
									</tr>
									<tr>
										<th>특이사항</th>
										<td>
										<textarea style="width: 300px; height: 100px; resize: none;"name="memo"></textarea>
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












	<!-- 수술실 상세조회 모달 -->
	<div class="modal fade insertModal" id="myModal1">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    </div>
	    </div>
  	</div>
	
	
	
	
	
	
	
	
	
	
	<!-- 
	<div class="modal fade insertModal" id="myModal1">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="wrap112">
		
				<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
				<input type="hidden" id="surgeryNo" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
				<input type="hidden" id="leadTime" class="form-control" value="${ c.leadTime }" name="leadTime"> 
				<br>
				<h3> <b>수술실 예약 조회</b> </h3>
				<hr>
				<div class="wrap221" style="width:100%">
					<div class="part1" style="width:100%">
						<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">조회</div>
									<div style="display: inline-block; margin-left: 30px;">
										<h3>${c.surDate}</h3>
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
								<td><input type="text" style="width: 300px;" readonly value="${c.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" readonly value="${c.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="date" style="width: 300px;" name="surDate" readonly value="${c.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td>
									<input type="time" style="width: 300px;" name="surStartTime" id="surStartTime" readonly value="${c.surStartTime }">
								</td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ c.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ c.docName }" name="doctorName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo" readonly>${c.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
	
						<br>
						<br>
	
						<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: rgb(65, 125, 122);" data-toggle="modal" data-target="#myModal2" onclick="ModalClose()">수정</button>
	           			<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: red">수술취소</button>
	         			<button type="button" class="btn btn-secondary" style="height: 30px; width: 100px; padding:0%; color:black;" onclick="ModalClose()">뒤로가기</button>
						<br><br><br><br><br>
						
					</div>
				</div>
				</div>
		    </div>
	    </div>
  	</div>
	-->







	<!-- 수술실 수정 모달-->
	<div class="modal fade insertModal mymodal2" id="myModal2">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="wrap112">
		
				<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
				<input type="hidden" id="surgeryNo" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
				<input type="hidden" id="leadTime" class="form-control" value="${ c.leadTime }" name="leadTime">
				<input type="hidden" id="bookingNo" class="form-control" value="${ c.bookingNo }" name="bookingNo">
				<br>
				<h3> <b>수술실 예약 수정</b> </h3>
				<hr>
				<div class="wrap221" style="width:100%">
					<div class="part1" style="width:100%">
						<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">수정</div>
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
								<td><input type="text" style="width: 300px;" readonly value="${c.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" value="${c.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="text" style="width: 300px;" name="surDate"  value="${c.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td><input type="text" style="width: 300px;" name="surStartTime" id="surStartTime" value="${c.surStartTime }"></td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ c.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ c.docName }" name="doctorName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo">${c.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
	
						<br>
						<br>
	
						<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: rgb(65, 125, 122);">수정</button>
	           			<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: red">수술취소</button>
	         			<button type="button" class="btn btn-secondary" style="height: 30px; width: 100px; padding:0%; color:black;" data-dismiss="modal">뒤로가기</button>
						<br><br><br><br><br>
						
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
				success : function(list) {

					//console.log(list);

					let data = [];/* 내가 넘겨주고자 하는 값을 리스트로 다시 담아줘야함! */
					for (let i = 0; i < list.length; i++) {
						let obj = {
							title : list[i].bookingNo,
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
						slotMinTime: '09:00',
					    slotMaxTime: '23:00',
						selectable : true,
						droppable : true,
						editable : true,
						events : data,
						eventClick:function(arg) {
							ModalOpen(arg);
						}
						
					});

					calendar.render();
					// ------------------------------------------------------------

				},
				error : function() {
					console.log("통신 실패")
				}

			})

		});
	
		
		//애는 중복 못하게 하지말고 select에서 if절로 이미 예약이 있는 시간대는 고르지 못하게 할 것!!!!!!!
		$("input[name=surDate]").change(function(){
			//수술실 선택 후 날짜까지 선택한 순간
		     
		   // db에 넣기
		   $.ajax({
		      url:"overlap.op",
		      data:{
		    	  	 surgeryRoom:$("#roomName").val(),
		    	  	 surDate:$(this).val()
		    	  	 
		            },
		      type:"POST",
		      success:function(result){
		         console.log(result); // 현재선택된 수술방이랑 현재선택된 날짜에 예약되어있는 리스트
		         console.log(result[0].surEndTime);
		         
		        
                 for(let j=result[0].surStartTime; j<=result[0].surEndTime; j++){
                    $("select option[value*='"+ j + "']").prop('disabled',true).css("background", "lightgrey");
                 }
		         
		      },
		      error: function(){
		         alert("오류로 인한 예약실패");
		       }
		   });
		  })
		
		
		
		//수술정보 상세조회
		$(".modal-content").load("detail.op2");
		
		function ModalOpen(arg){
			
			console.log(arg);
			console.log(arg.event._def.title);  // 예약번호
			
			//해당 예약번호를 넘겨서 해당 수술예약 정보 상세 조회하는 ajax
			//ajax success function 에서 조회된 정보를 #myModal1인 모달 div안 input요소에 value값으로 뿌리는
			$.ajax({
		      url:"detail.op",
		      data:{ clinicNo : arg.event._def.title },
		      success:function(surgery){
		 	  	  	console.log(surgery);
			 	  	$('input[name=clinicNo]').attr('value',surgery.clinicNo);
			 	  	$('input[name=docName]').attr('value',surgery.docName);
			 	  	$('input[name=patientName]').attr('value',surgery.patientName);
			 	  	$('input[name=roomName]').attr('value',surgery.roomName);
			 	  	$('input[name=surDate]').attr('value',surgery.surDate);
			 	  	$('input[name=surEndTime]').attr('value',surgery.surEndTime);
			 	  	$('input[name=surStartTime]').attr('value',surgery.surStartTime);
		      },
		      error: function(){
		         alert("조회 실패");
		       }
		   });
		    
			$('#myModal1').modal('show');
		  }
		
		//모달 숨기기
		function ModalClose(){
			$("#myModal1").modal("hide");
		}
		
		
	</script>
	<!-- 계속 새로운 일정이 들어가면 또 새로 바로 띄워주게하기위해서 ajax를 function으로 빼줘서 사용하는것이 좋음-->


	<!-- 예상 완료시간 조회 -->
	<script>
	
		$(".surStartTime").change(function(){
				var timeSArr = $(".surStartTime>option:selected").text().split(":");			
				var timeLArr = "${c.leadTime}".split(":");
				
				let hour = Number(timeSArr[0]) + Number(timeLArr[0]);
				let min = Number(timeSArr[1]) + Number(timeLArr[1]);
				if(min < 10){
					min = "0" + min;
				}
				
				console.log(hour + ":" + min)
				document.getElementById("surEndTime").value = hour + ":" + min;		
								
		})
	
	
		
	</script>
	
	
</body>
</html>