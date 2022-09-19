<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>