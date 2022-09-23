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
<style>
.wrap11 {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

.rvlvd {
	width: 100%;
	height: 100%;
	display: grid;
	grid-gap: 25px;
	grid-template-columns: 400px 400px;
	grid-template-rows: 0.5fr 8fr 0.5fr;
	grid-template-areas: 'header header' 'side-a side-b' 'footer footer';
	justify-content: center;
}

.rvlvd-side-a {
	grid-area: side-a;
}

.rvlvd-side-b {
	grid-area: side-b;
}

.button {
	width: 100%;
	height: 100%;
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

input {
	width: 100%;
	box-sizing: border-box;
}

select {
	width: 100%;
	height: 100%;
}

textarea {
	width: 100%;
	height: 120px;
	box-sizing: border-box;
	resize: none;
}

.click {
	width: 70px;
	height: 30px;
}

.title {
	border-radius: 7px;
}

.list {
	margin-top: 10px;
	height: 250px;
	border: 1px;
	overflow: auto;
	box-sizing: border-box;
}

.list>table>tbody>tr {
	height: 45px;
}

.maintitle {
	height: 30px !important;
	cursor: default !important;
}

input {
	border: none;
	outline: none !important;
}


</style>


</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">

				<div class="rvlvd">

					<div class="rvlvd-side-a">
						<table class="table bggray title">
							<tr height="40">
								<td width="400"><b>환자접수</b></td>
							</tr>
						</table>
						<br>
						<table class="table">
							<tr>
								<th colspan="2" height="30" width="200"
									style="text-align: left; padding-bottom: 5px; padding-left: 17px; font-size: 17px;">인적정보</th>
								<td width="100" style="padding: 5px;">
									<button type="button" class="button"  style="height: 30px" onclick="openPopupWindow();" >환자조회</button>
								</td>
								<td width="100" style="padding: 5px;">
									<button type="button" class="button" style="height: 30px"
										data-toggle="modal" data-target="#enrollPatient">환자등록</button>
								</td>
							</tr>
							<tr>
								<td width="100">이름</td>
								<td colspan="5" style="text-align: left;">${p.patientName}
									<input type="hidden" value="${p.chartNo}" id="chartNo">
								</td>
							</tr>
							<tr>
								<td>주민번호</td>
								<td colspan="5" style="text-align: left;">${p.idNo}</td>
							</tr>
							<tr>
								<td style="padding-left: 5px; padding-right: 5px;">최초내원일</td>
								<td width="110" style="padding-right: 5px; text-align: left;">${p.firstVisit}</td>
								<td style="padding-left: 5px; padding-right: 5px;">최근내원일</td>
								<td style="padding-left: 5px; padding-right: 5px;">${p.lastVisit}</td>
							</tr>
							<tr>
								<td>최근진료과</td>
								<td colspan="3" style="text-align: left;">${p.lastDep}</td>
							</tr>
							<tr>
								<td>메모</td>
								<td colspan="5" style="text-align: left;">${p.memo}</td>
							</tr>
						</table>
						<br> <br> <br> <br> <br> <br> <br>

						<table class="table">
							<tr>
								<th colspan="4" height="30" width="200"
									style="text-align: left; padding-bottom: 5px; padding-left: 17px; font-size: 17px;">접수정보</th>
							</tr>
							<tr>
								<td width="100">진료과</td>
								<td><select name="deptNo" id="deptNo">
										<option value="">선택</option>
										<c:forEach var="d" items="${ deptList }">
											<option value="${ d.deptNo }">${ d.deptName }</option>
										</c:forEach>
								</select></td>
								<td width="70" style="padding-left: 0;">교수</td>
								<td style="padding-left: 0;"><select name="empNo"
									id="empNo">
										<option value="">선택</option>
										<c:forEach var="p" items="${ profList }">
											<option value="${ p.empNo }">${ p.empName }</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td height="120">증상</td>
								<td colspan="3"><textarea name="diagnosisContent"
										id="diagnosisContent"></textarea></td>
							</tr>
						</table>
						<br>
						<button class="click button" style="width: 110px;"
							onclick="ajaxEnrollTreatment();">접수</button>
					</div>


					<div class="rvlvd-side-b">
						<table class="table bggray title">
							<tr height="40">
								<td width="400"><b>진료관리</B></td>
							</tr>
						</table>
						<br>
						<table class="table">
							<tr height="30">
								<td width="120" style="padding: 5px;"><button
										class="button maintitle">진료대기</button></td>

								<td width="280" style="padding: 5px;"><select name="waitingDeptNo"
									id="deptNo">
										<option value="">전체</option>
										<c:forEach var="d" items="${ deptList }">
											<option value="${ d.deptNo }">${ d.deptName }</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						

						<div class="list">
	
							<table align="center" width="100%" id="waitingListArea">
								<thead>
									<tr>
										<th style="padding: 0;"><label for="selectAll">전체</label> <input
											type="checkbox" id="selectAll" style="width: 15px;" onclick='selectAll(this)'></th>
										<th>순번</th>
										<th>이름</th>
										<th>성별</th>
										<th>나이(만)</th>
										<th>진료과</th>
									</tr>
								</thead>
								<tbody>


								</tbody>
							</table>
						</div>
						
						<br>
						<button class="click button" style="width: 110px;" onclick="ajaxChangePatientStatus();">상태변경</button>

						
						<br> <br>

						<table class="table" style="margin-top: 6px;">
							<tr height="30">
								<td width="120" style="padding: 5px;">
									<button class="button maintitle">진료중</button>
								</td>
								<td width="280" style="padding: 5px;"><select name="ingDeptNo"
									id="deptNo">
										<option value="">전체</option>
										<c:forEach var="d" items="${ deptList }">
											<option value="${ d.deptNo }">${ d.deptName }</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>

						<div class="list">
							<table align="center" width="100%" id="ingListArea">
								<thead>
									<tr>
										<th>순번</th>
										<th>이름</th>
										<th>성별</th>
										<th>나이(만)</th>
										<th>진료과</th>
									</tr>
								</thead>
								<tbody>


								</tbody>
							</table>
						</div>
					</div>
					<br> <br>
				</div>
			</div>

	
			<div class="modal" id="enrollPatient">
				<div class="modal-dialog">
					<div class="modal-content" style="background:white !important;">

						<div class="modal-header" style="font-weight: bold; margin:auto;">
							환자등록
							<button type="button" class="close" style="float:right !important;" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body" align="center">
							<form action="insert.pt" method="post">
								<table class="table-bordered">
									<tr>
										<td>이름</td>
										<td><input type="text" name="patientName" required></td>
									</tr>
									<tr>
										<td>주민등록번호</td>
										<td><input type="text" name="idNo" required></td>
									</tr>
									<tr>
										<td>연락처</td>
										<td><input type="text" name="phone" required></td>
									</tr>
									<tr>
										<td>보호자 연락처</td>
										<td><input type="text" name="protector"></td>
									</tr>
									<tr>
										<td>주소</td>
										<td><input type="text" name="address" required></td>
									</tr>
									<tr>
										<td>메모</td>
										<td><input type="text" name="memo"></td>
									</tr>
								</table>
								<br>
								<button type="submit" class="btn btn-sm btn-secondary" style="background : rgb(29,92,99)!important; color:white !important;">등록하기</button>
							</form>
						</div>

					</div>
				</div>
			</div>


			<script>
				
				$(function(){
					ajaxSelectClinicList();
				})
				
				// 환자 조회용 ajax 함수
				/*
				function openModal() {

					$.ajax({
						url : "list.pt",
						data : {
							cpage : 0
						},
						success : function(data) {

							
							let list = data.list;
							let pi = data.pi;
							
							console.log(list);
							console.log(pi);
							
							let value = "";
							for (let i = 0; i < list.length; i++) {

								value += "<tr>"
										+ "<td><input type='radio' name='chartNo' value='" + list[i].chartNo + "'></td>"
										+ "<td>" + list[i].patientName
										+ "</td>" + "<td>"
										+ list[i].idNo + "</td>"
										+ "</tr>";

							}

							$("#patientListArea tbody").html(value);

							$('#searchPatient').modal('show');

						},
						error : function() {
							console.log("환자 조회용 ajax 통신 실패");
						}
					})

				}
*/

				// 진료 접수
				function ajaxEnrollTreatment() {
					$.ajax({
						url : "insert.tr",
						data : {
							chartNo : $("#chartNo").val(),
							deptNo : $("#deptNo").val(),
							empNo : $("#empNo").val(),
							diagnosisContent : $("#diagnosisContent").val(),
							fee : 15000
						},
						success : function(result) {
							console.log(result);
							location.href = "reception.mj";

						},
						error : function() {
							console.log("ajax통신 실패");
						}
					});
				}

				// 진료 대기, 진료중 환자 조회    	
				function ajaxSelectClinicList(){ 
					
					$.ajax({
						url:"clist.pt",
						success:function(data){
							
							//console.log(wlist);
							let wlist = data.wlist;
							let plist = data.plist;
							
							let waitingValue = "";
							
							for(let i=0; i<wlist.length; i++){
								waitingValue += "<tr><td><input type='checkbox'name='change' value='" + wlist[i].chartNo + "'></td>"
											+"<td>" + (i+1) + "</td>"
									        +"<td>" + wlist[i].patientName + "</td>"
									        +"<td>" + wlist[i].gender + "</td>"
									        +"<td>" + wlist[i].age + "</td>"
									        +"<td>" + wlist[i].deptName + "</td>"
									        +"</tr>";
							}
							
							let ingValue = "";
							
							for(let i=0; i<plist.length; i++){
								ingValue += "<tr>"
											+"<td>" + (i+1) + "</td>"
									        +"<td>" + plist[i].patientName + "</td>"
									        +"<td>" + plist[i].gender + "</td>"
									        +"<td>" + plist[i].age + "</td>"
									        +"<td>" + plist[i].deptName + "</td>"
									        +"</tr>";
								}
							
							
							$("#waitingListArea tbody").html(waitingValue);
							$("#ingListArea tbody").html(ingValue);
							
							
						},error:function(){
							console.log("진료 대기 환자 조회용 ajax통신 실패");
						}
					})
					
				}
				
				// 진료중으로 상태변경
				function ajaxChangePatientStatus() {
					
					let changeArray = new Array();
					
					$('input:checkbox[name=change]:checked').each(function() {
						changeArray.push(this.value);
				    });

					$.ajax({
						url : "change.pt",
						data : {
							changeArray : changeArray
						},
						success : function(result) {
							console.log(result);
							location.href = "reception.mj";
						},
						error : function() {
							console.log("ajax통신 실패");
						}
					});
				}
				
				// 전체 체크
				function selectAll(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('change');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				
				// 환자 선택 팝업창 띄우기
				function openPopupWindow(){
					window.open("selectList.pt", "popup", "width=500, height=650")
				}
				
				
			</script>

			<jsp:include page="../common/footer.jsp" />
</body>
</html>