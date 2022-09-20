<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap11 {
	width: 100%;
	height: 100% !important;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

.table1 {
	margin: auto;
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

.bggray {
	background-color: lightgray;
	color: black;
}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div class="main-panel">
		<div class="content-wrapper">
			<!-- 이 안에서 작업해 주세요 -->
			<div class="wrap11">
				<br>
				<br>
				<div>
					<div id="printArea"
						style="border: 1px solid black; width: 70%; margin: auto;">
						<table class="table-bordered" border="1"
							style="font-size: 0.7em; margin: auto; width: 100%; border-collapse: collapse;">
							<tr>
								<td colspan="9" style="height: 100px; text-align: center;">
									<br> <br>

									<h2>처방전</h2> <br> <!--
                      <b>[&nbsp;&nbsp;&nbsp;&nbsp;]건강보험 [&nbsp;&nbsp;&nbsp;&nbsp;]의료급여 [&nbsp;&nbsp;&nbsp;&nbsp;]산업재해보험 [&nbsp;&nbsp;&nbsp;&nbsp;]자동차보험 기타(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</b>
                          <br>
                          <br>
                          <br>
                          <span style="font-size: 0.8em; text-align: left;">[&nbsp;&nbsp;&nbsp;]에는 해당되는 곳에"<span class="mdi mdi-check"></span>" 표시를 합니다.</span>
                      -->
								</td>
							</tr>
							<tr>
								<td style="text-align: left; font-size: 1.3em;" colspan="9">기관번호
									: 37345206</td>
							</tr>
							<tr>
								<td colspan="2" height="50px;">발급 연월일 및 번호</td>
								<td colspan="3" width="200">${ps.preDate}- ${ps.preNo}호</td>
								<td width="30px" rowspan="3">의료기관</td>
								<td>명칭</td>
								<td colspan="2" width="100px">율제병원</td>
							</tr>
							<tr>
								<td rowspan="2" width="80">환자</td>
								<td>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
								<td colspan="3">${ps.patientName}</td>
								<td>전화번호</td>
								<td colspan="2">( 02 ) 2108 - 5900</td>
							</tr>
							<tr>
								<td>주민등록번호</td>
								<td colspan="3">${ps.idNo}</td>
								<td>팩스번호</td>
								<td colspan="3">( 02 ) 2108 - 5999</td>
							</tr>
							<tr>
								<td rowspan="2">질병분류번호</td>
								<td rowspan="2" colspan="2">${ps.diseasesCode}</td>
								<td rowspan="2" width="50">처방<br>의료인의<br>성명
								</td>
								<td rowspan="2" colspan="2" width="120"
									style="font-size: 0.8em; text-align: right;">
									${ps.docName} (서명 또는 날인)</td>
								<td>면허종류</td>
								<td colspan="2">의사</td>
							</tr>
							<tr>
								<td>면허번호</td>
								<td colspan="2">${ps.docNo}</td>

							</tr>
							<tr>
								<td colspan="9" style="text-align: center;">환자가 요구하면 질병분류 기호를 적지 않습니다.</td>
							</tr>
							<tr>
								<td colspan="2">처방 의약품의 명칭 및 코드</td>
								<td width="50">1회투여량</td>
								<td>1일 투여횟수</td>
								<td width="30">총 투약일수</td>
								<td>본인<br>부담율<br>구분코드
								</td>
								<td colspan="3">용법</td>
							</tr>
							
							<c:choose>
								<c:when test="${ empty mlist }">
									<tr>
										<td colspan="9" height=100px" style="text-align: center;">처방된 약이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="m" items="${ mlist }">
										<tr>
											<td colspan="2" height="30">${ m.medNo } ${ m.medName }</td>
											<td width="50">${ m.medNo }</td>
											<td>${ m.dosetime }</td>
											<td width="30">${ ps.injectDay }</td>
											<td></td>
											<td colspan="3">${ps.usage}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

							<tr>
								<td colspan="6">주사제 처방명세([&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]원
									내 조제, [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]원 외 처방 )</td>
								<td colspan="2" rowspan="2">본인부담<br>구분기호
								</td>
								<td rowspan="2">조제시<br>참고사항
								</td>
							</tr>
							<tr>
								<td colspan="2" height="30"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" height="30"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" height="30"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2" height="30"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr>
								<td>사용기간</td>
								<td colspan="2">발급일로부터 ( 7 )일간</td>
								<td style="font-size: 0.6em;" colspan="6">사용기간 내에 약국에 제출하여야
									합니다.</td>
							</tr>
							<tr>
								<td colspan="9" style="background-color: lightgray;">의약품 조제
									명세</td>
							</tr>
							<tr>
								<td rowspan="4">조제명세</td>
								<td>조제기관의<br>명칭
								</td>
								<td colspan="3"></td>
								<td rowspan="2" colspan="4" style="font-size: 0.6em;">처방의
									변경 , 수정 , 확인 , 대체 시<br>그 내용 등 기록
								</td>
							</tr>
							<tr>
								<td>조제약사</td>
								<td colspan="3" style="text-align: left;"><br>
								<p style="text-align: right; font-size: 1em;">(서명 또는 인)</p></td>
							</tr>
							<tr>
								<td>조제량<br>(조제일수)
								</td>
								<td colspan="3"></td>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>조제연월일<br>&nbsp;
								</td>
								<td colspan="3"></td>
								<td colspan="4"></td>
							</tr>
						</table>
						<br>
						<table class="table-bordered" border="1"
							style="font-size: 0.7em; margin: auto; width: 100%; border-collapse: collapse;">
							<tr>
								<td width="20">항목설명</td>
								<td style="text-align: left;">&nbsp;&nbsp;&nbsp;1. 본인부담률
									구분코드 : 국민건강보험법 시홍행 별표2 제 4호 및 제 6호에 따른 약제를 처방한 경우 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									본인이 부담할 비용의 부담률에 부여된 해당 구분 코드를 적습니다. <br>
									&nbsp;&nbsp;&nbsp;[구분코드]<br> &nbsp;&nbsp;&nbsp;·A : 100분의
									50 본인 부담, B : 100분의 80 본인 부담, D : 100분의 30본인 부담 <br>
									&nbsp;&nbsp;&nbsp;·U : 건강보험(의료급여) 100분의 100 본인부담, V : 보통 총
									100분의 100 본인부담, W : 비급여(보통만 해당) <br>
								<br>&nbsp;&nbsp;&nbsp;2.본인부담 구분기호 : 본인일부부담금 산합특례에 관한 기준,
									보건복지부장관이 합하여<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고지하는
									본인부담 산정특례 매상 특정기호를 적습니다.
								</td>
							</tr>
						</table>
					</div>

				</div>
				<br>
				<br>
				<div id="buttonArea" style="width: 100%; box-sizing: border-box;">
					<div
						style="width: 60%; height: 30px; float: left; padding-right: 75px;"
						align="right">
					</div>
					<div style="width: 25%; height: 30px; float: left;" align="right">
						<button onclick="printPage();" class="button">출력</button>
						<button class="button2 bggray" onclick="history.back()">뒤로가기</button>
					</div>
					<br>
					<br>
				</div>
				<br>
				<br>
			</div>
		</div>
		<script>
			function printPage() {
				var initBody;
				window.onbeforeprint = function() {
					initBody = document.body.innerHTML;
					document.body.innerHTML = document
							.getElementById('printArea').innerHTML;
				};
				window.onafterprint = function() {
					document.body.innerHTML = initBody;
				};
				window.print();
				location.reload();

				return false;
			}
		</script>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>