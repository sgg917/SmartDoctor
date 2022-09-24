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

b {
	font-size: 20px;
}

.button {
	width: 50px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
}

.bggray {
	background-color: lightgray;
}

.title {
	border-radius: 7px;
	height: 50px;
}

.table {
	width: 100%;
}

input {
	width: 100%;
	height: 100%;
}

.innerArea {
	height: 110%;
	width: 400px;
	margin: auto;
}

#tableArea {
	height: 100%;
	width: 100%;
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
	<!-- alert -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">
				<br> <br> <br>

				<div class="innerArea">
					<form name="popupForm" action="update.pt" method="get">
					<input type="hidden" name="chartNo" value="${p.chartNo }">
						<table class="table bggray title">
							<tr height="40">
								<td><b>환자정보</B></td>
							</tr>
						</table>
						<br>
						<div id="tableArea" align="center">
							<table class="table" id="patientList">
								<tr>
									<td style="width:30%">이름</td>
									<td><input style="border:none;" type="text" name="patientName" disabled value="${p.patientName }"></td>
								</tr>
								<tr>
									<td>주민등록번호</td>
									<td><input style="border:none;" type="text" name="idNo" disabled value="${p.idNo }"></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="text" name="phone" required value="${p.phone }"></td>
								</tr>
								<tr>
									<td>보호자 연락처</td>
									<td><input type="text" name="protector" value="${p.protector }"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="address" required value="${p.address }"></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><input type="text" name="memo" value="${p.memo }"></td>
								</tr>
							</table>
							<br>
							<button type="submit" class="button">수정</button>
							<button type="button" class="button bggray" style="color:black" onclick="window.close()">닫기</button>
							<br><br>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
		
			function selfCloseSubmit() {

				var f = document.forms.popupForm;
				opener.name = "parentPage";
				f.target = opener.name;
				f.submit();
				self.close();
			}

		</script>
</body>
</html>