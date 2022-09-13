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
	width: 20px;
	height: 20px;
	background-color: rgb(29, 92, 99);
	color: white;
	border-radius: 50px;
	border: 0;
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
	background-color: lightgray !important;
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
	height: auto;
	margin: auto;
}

#tableArea{
	height: 100%;
	width: auto;
	text-align: center;
	overflow: auto;
}
#tableArea>table{
	width: 100%;
	box-sizing: border-box;
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
							<td><b>입원실 현황</B></td>
						</tr>
					</table>
					<br>

					<div align="center">
						<button type="button" class="button">&lt;</button> 2022년 9월 <button type="button" class="button">&gt;</button>
					</div>

					<br>
					<div id="tableArea" align="center">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>날짜 / 호</th>
									<th>1101호 2인실 (F)</th>
									<th>1102호 4인실 (F)</th>
									<th>1301호 2인실 (M)</th>
									<th>1302호 4인실 (M)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>박은빈</td>
									<td class="bggray">
										박은빈
										<br>
										천우희
										<br>
										박민영
										<br>
										강하늘
									</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>2</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>3</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>4</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>5</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>6</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>7</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>8</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>9</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>10</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>11</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>12</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>13</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>14</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>15</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td class="bggray">
										박은빈
										<br>
										천우희
									</td>
								</tr>
								<tr>
									<td>16</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>

								<tr>
									<td>17</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>18</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>19</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>20</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>21</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>22</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>23</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td class="bggray">
										박은빈
										<br>
										천우희
										<br>
										박민영
										<br>
										강하늘
									</td>
								</tr>
								<tr>
									<td>24</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>25</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>26</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>27</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>28</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>29</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>30</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>
								<tr>
									<td>31</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
									<td>박은빈</td>
								</tr>

							</tbody>
						</table>
					</div>
					
				</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>