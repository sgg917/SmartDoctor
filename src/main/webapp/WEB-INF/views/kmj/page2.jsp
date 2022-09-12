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
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
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
    grid-template-areas:
        'header header'
        'side-a side-b'
        'footer footer';
    justify-content: center;
}
 .rvlvd-side-a{
    grid-area: side-a;       
 }
 .rvlvd-side-b{
    grid-area: side-b;
 }
.button{
            width: 100%;
            height: 100%;
            background-color: rgb(29, 92, 99);
            color: white;
            border-radius: 7px;
            border: 0;
        }
        
        input{
            width: 100%;
            box-sizing: border-box;
        }

        .bggray{
            background-color: lightgray;
        }
        select{
            width: 100%;
            height: 100%;
        }
        textarea{
            width: 100%;
            height: 120px; 
            box-sizing: border-box;
            resize: none;
        }
        .click{
            width: 70px;
            height: 30px;
        }
        .title{
            border-radius: 7px;
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
							<tr height="40"><td width="400">환자접수</td></tr>
						</table>
						<br>
						<table class="table">
							<tr>
								<th colspan="2" height="30" width="200" style="text-align: left; padding-bottom: 5px;">인적정보</th>
								<td width="100" style="padding: 5px;"><button type="button" class="button" style="height:30px" >환자검색</button></td>
								<td width="100" style="padding: 5px;"><button type="button" class="button" style="height:30px">환자접수</button></td>
							</tr>
							<tr>
								<td width="100" class="bggray">이름</td>
								<td colspan="3"><input type="text"></td>
							</tr>
							<tr>
								<td class="bggray">주민번호</td>
								<td colspan="3"><input type="text"></td>
							</tr>
							<tr>
								<td class="bggray">최초내원일</td>
								<td colspan="3"><input type="text"></td>
							</tr>
							<tr>
								<td class="bggray">최근내원일</td>
								<td colspan="3"><input type="text"></td>
							</tr>
							<tr>
								<td class="bggray">최근진료과</td>
								<td colspan="3"><input type="text"></td>
							</tr>
						</table>
						<br><br><br><br>
				
						<table class="table">
							<tr>
								<th colspan="6" height="22" width="400" style="text-align: left; padding-bottom: 5px;">접수정보</th>
							</tr>
							<tr>
								<td width="100" class="bggray">진료과</td>
								<td>
									<select name="" id="">
										<option value="">정형외과</option>
										<option value="">내과</option>
									</select>
								</td>
								<td width="100" class="bggray">교수</td>
								<td>
									<select name="" id="">
										<option value="">김교수</option>
										<option value="">박교수</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="bggray" height="120">증상</td>
								<td colspan="3"><textarea name="" id=""></textarea></td>
							</tr>
						</table>
						<br>
						<button class="click button" style="width: 110px;">접수</button>
					</div>
            
            
					<div class="rvlvd-side-b">
						<table class="table bggray title">
							<tr height="40"><td width="400">진료관리</td></tr>
						</table>
						<br>
						<table class="table">
							<tr height="30">
								<td width="120" style="padding: 5px;"><button class="button"
										style="height: 30px !important;">진료대기</button></td>
								<td width="280" style="padding: 5px;"><select name=""
									id="">
										<option value="" align="center">전체</option>
										<option value="" align="center">외과</option>
										<option value="" align="center">내과</option>
										<option value="" align="center">정신과</option>
										<option value="" align="center">마취과</option>
								</select></td>
							</tr>
							<tr height="150px">
								<td colspan="2">
									<table align="center" width="100%">
										<thead>
											<tr>
												<th style="padding: 0;" align=><label for="c">전체</label>
													<input type="checkbox" id="c" style="width: 15px;">
												</th>
												<th>순번</th>
												<th>이름</th>
												<th>성별</th>
												<th>나이</th>
												<th>진료과</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input type="checkbox"></td>
												<td>2</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td><input type="checkbox"></td>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td><input type="checkbox"></td>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td><input type="checkbox"></td>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>

										</tbody>
									</table>
								</td>
							</tr>
						</table>
						<br>
						<button class="click button" style="width: 110px;">상태변경</button>
						<br><br><br>
						<table class="table" style="margin-top: 4px;">
							<tr>
								<td width="120" style="padding: 5px;"><button class="button"
										style="height: 30px !important;">진료대기</button></td>
								<td width="280" style="padding: 5px;"><select name=""
									id="">
										<option value="" align="center">전체</option>
										<option value="" align="center">외과</option>
										<option value="" align="center">내과</option>
										<option value="" align="center">정신과</option>
										<option value="" align="center">마취과</option>
								</select></td>
							</tr>
							<tr height="150px">
								<td colspan="2">
									<table align="center" width="100%">
										<thead>
											<tr>
												<th>순번</th>
												<th>이름</th>
												<th>성별</th>
												<th>나이</th>
												<th>진료과</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>2</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
											<tr>
												<td>3</td>
												<td>박서준</td>
												<td>남</td>
												<td>25</td>
												<td>내과</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
              <br><br>
		  </div>
		</div>
	<jsp:include page="../common/footer.jsp"/>		
</body>
</html>