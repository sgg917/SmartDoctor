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
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon-16x16.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
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
	width: 110px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
	cursor: pointer;
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
	background-color: lightgray;
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

input {
	height: 100%;
	border: 1px solid black;
	border-radius: 5px;
}

#searchbar {
	height: 30px;

}
#searchbar>div{
	height: 100%;
	box-sizing: border-box;

	float: left;
}
.innerArea{
	width: 1000px;
	height: 700px;
	margin: auto;
}

#tableArea{
	height: 220px;
	width: 100%;
	/* border: 1px solid black; */
	text-align: center;
	overflow: auto;
}
#tableArea>table{
	width: 100%;
	box-sizing: border-box;
}
#pagingArea{width:fit-content;margin:auto;}

#tableArea>.table>tbody>tr:hover{
   	background:#E1F0FF;
    }

</style>


</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">
				<br><br><br>

				<div class="innerArea">
					<table class="table bggray title">
						<tr height="40">
							<td><b>입원실 / 수술실 예약 대기</B></td>
						</tr>
					</table>
					<br>

					<div align="left">
						<button type="button" class="button" style="cursor: default;">입원실</button>
					</div>

					<br>
					<div id="tableArea" align="center">
						<table class="table" id="PRoomWaitingArea">
							<thead>
								<tr>
									<th width="85px">차트번호</th>
									<th width="60px">이름</th>
									<th width="50px">성별</th>
									<th width="100px">주민등록번호</th>
									<th width="100px">진료과</th>
									<th width="100px">예약</th>
								</tr>
							</thead>
							<tbody>


							</tbody>
						</table>
					</div>
					<br>

					<div align="left">
						<button type="button" class="button" style="cursor: default;">수술실</button>
					</div>

					<br>
					<div id="tableArea" align="center">
						<table class="table" id="SurgeryWaitingArea">
							<thead>
								<tr>
									<th width="85px" style="padding: 0;">차트번호</th>
									<th width="60px">이름</th>
									<th width="50px">성별</th>
									<th width="100px">주민등록번호</th>
									<th width="100px">진료과</th>
									<th width="100px">예약</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<br>

				</div>
				<br><br>
			</div>
		</div>
		
		<script>
		
			$(function(){
				ajaxSelectWaitingList();
			})
			
			// 예약 대기 환자 조회 	
			function ajaxSelectWaitingList(){ 
				
				$.ajax({
					url:"rsvWaitinglist.pt",
					success:function(data){
						
						let slist = data.slist;
						let plist = data.plist;
						
						let surgeryValue = "";
						
						for(let i=0; i<slist.length; i++){
							
							surgeryValue += "<tr><td>" + slist[i].chartNo + "</td>"
										+"<td>" + slist[i].patientName + "</td>"
								        +"<td>" + slist[i].gender + "</td>"
								        +"<td>" + slist[i].idNo + "</td>"
								        +"<td>" + slist[i].deptName + "</td>"
								        +"<td><button class='button' name='rsvSurgery' value='" + slist[i].clinicNo + "'>예약하기</button></td>"
								        +"</tr>";
								        
						}
						
						let pRoomValue = "";
						
						for(let i=0; i<plist.length; i++){
							
							pRoomValue += "<tr><td>" + plist[i].chartNo + "</td>"
										+"<td>" + plist[i].patientName + "</td>"
								        +"<td>" + plist[i].gender + "</td>"
								        +"<td>" + plist[i].idNo + "</td>"
								        +"<td>" + plist[i].deptName + "</td>"
								        +"<td><button class='button' name='rsvPRoom' value='"  + plist[i].clinicNo + "'>예약하기</button></td>"
								        +"</tr>";
								        
							}
						
						$("#SurgeryWaitingArea tbody").html(surgeryValue);
						$("#PRoomWaitingArea tbody").html(pRoomValue);
						
						
					},error:function(){
						console.log("예약 대기 환자 조회용 ajax통신 실패");
					}
				})
				
			}
			
		// => 동적으로 만들어진 요소에 이벤트 부여 방법!!!!!

		$(document).on("click","button[name=rsvSurgery]",function(){
		
			ajaxUpdateAndgotoSurgery($(this).attr('value'));
			
		})
		
		$(document).on("click","button[name=rsvPRoom]",function(){

			ajaxUpdateAndgotoPRoom($(this).attr('value'));

		})
		
		function ajaxUpdateAndgotoSurgery(value){
			
			$.ajax({
				url : "updateSurgery.cl",
				data : {
					clinicNo : value
				},
				success : function(clinicNo) {
					console.log(clinicNo);
					location.href = "enrollForm.op?clinicNo=" + clinicNo;

				},
				error : function() {
					console.log("ajax통신 실패");
				}
			});
			
		}
		
		function ajaxUpdateAndgotoPRoom(clinicNo){
			
			$.ajax({
				url : "updateEnter.cl",
				data : {
					clinicNo : clinicNo
				},
				success : function(clinicNo) {
					console.log(clinicNo);
					location.href = "enrollForm.pr?clinicNo=" + clinicNo;

				},
				error : function() {
					console.log("ajax통신 실패");
				}
			});
			
		}
		</script>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>