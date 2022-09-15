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
	width: 70px;
	height: 30px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 7px;
	border: 0;
	cursor: pointer;
	margin-left: 10px;
}
.button2 {
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
	color: black;
}
.bggray2 {
	background-color: rgb(243, 243, 243);
	color: black;
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

.innerArea{
	width: 1000px;
	height: 100%;
	margin: auto;
}

#tableArea1{
	height: 20%;
	width: 100%;
	/* border: 1px solid black; */
	text-align: center;
	overflow: auto;
}

#tableArea2{
	height: 350px;
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
#buttonArea {
	height: 30px;
}
#buttonArea>div{
	height: 100%;
	box-sizing: border-box;
	float: left;
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
				<div id="printArea">
					<div class="innerArea">
						<table class="table bggray title">
							<tr height="40" style="text-align: center;">
								<td><b>영수증 출력</B></td>
							</tr>
						</table>
						<br><br><br><br>

						
							<div id="tableArea1" align="center">
								<table class="table table-bordered">
									<thead>
										<tr class="bggray2">
											<th width="25%">수납번호</th>
											<th width="25%">이름</th>
											<th width="25%">기간</th>
											<th width="25%">진료내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>강개똥</td>
											<td>2022-01-02 ~ 2022-01-02</td>
											<td>
												질병명 : ###
												<br><br>
												수술명 : ###
											</td>
										</tr>
									</tbody>
								</table>

							</div>
							<br><br>

							<div id="tableArea2" align="center">
								<table class="table table-bordered">
									<thead>
										<tr class="bggray2">
											<th width="50%">항목</th>
											<th width="50%">금액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>진찰료</td>
											<td>15,000원</td>
										</tr>
										<tr>
											<td>
												입원료
											</td>
											<td>75,000원</td>
										</tr>
										<tr>
											<td>수술료</td>
											<td>150,000원</td>
										</tr>
										<tr>
											<td>
												식대
											</td>
											<td>54,000원</td>
										</tr>
									</tbody>
									<tfoot class="bggray2">
										<th>총 금액</th>
										<td>294,000원</td>
									</tfoot>
								</table>
								<div id="noticeArea" align="left">
									<span>※ 요금안내 ※ 입원료(1일) - 2인실 100,000원 / 4인실 50,000원, 식대 : 1일 - 15000원</span>
								</div>
							<br>
						</div>


					</div>


				</div>
				<div id="buttonArea" style="width: 100%; box-sizing: border-box;">
					<div style="width: 60%; height: 30px; float: left; padding-right: 75px;" align="right">
						<button class="button">수납</button>
						<button onclick="printPage();" class="button">출력</button>
					</div>
					<div style="width: 22%; height: 30px; float: left;" align="right">
						<button class="button2 bggray">뒤로가기</button>
					</div>
				</div>
				<br><br><br><br>

			</div>
		</div>
		<script>
			function printPage(){
				var initBody;
				window.onbeforeprint = function(){
				initBody = document.body.innerHTML;
				document.body.innerHTML =  document.getElementById('printArea').innerHTML;
				};
				window.onafterprint = function(){
				document.body.innerHTML = initBody;
				}; 
				window.print();
				return false;
			}
		</script>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>