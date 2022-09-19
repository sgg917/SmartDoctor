<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap11{
	width: 100%;
	height: 90%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
	}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />
	<div class="content-wrapper" style="height: 808px; text-align: center;">
		<div class="wrap11" style="width: 70%; height: 70%; margin: auto;">

			<div class="row">
				<div class="card">
					<div class="card-body">
					
						<h2 align="center">직원가입</h2>
				          <br><br>
				          <form class="forms-sample" action="insert.me" method="post" id="enrollForm" enctype="multipart/form-data">
				            <div class="form-group row">
				              <label for="empName" class="col-sm-3 col-form-label">이름</label>
				              <div class="col-sm-9">
				                <input type="text" class="form-control" id="empName" name="empName" placeholder="이름" required>
				              </div>
				            </div>
				            
				            <div class="form-group row">
				              <label for="phone" class="col-sm-3 col-form-label">핸드폰번호</label>
				              <div class="col-sm-9">
				                <input type="tel" class="form-control" id="phone" name="phone" placeholder="핸드폰번호" required>
				              </div>
				            </div>
				            
				            <div class="form-group row">
				              <label for="deptNo" class="col-sm-3 col-form-label">소속과</label>
				              <div class="col-sm-9">
				              	<select name="deptNo" class="custom-select form-control" style="height: 45px;" required>
                                    <option selected>선택</option>
                                    <option value="1">진료부</option>
                                    <option value="2">간호부</option>
                                    <option value="3">원무부</option>
                                    <option value="4">경영지원부</option>
                                    <option value="5">일반외과</option>
                                    <option value="6">일반내과</option>
                                    <option value="7">정신과</option>
                                    <option value="8">이비인후과</option>
                                    <option value="9">수술실</option>
                                    <option value="10">일반</option>
                                </select>
				              </div>
				            </div>
				            <div class="form-group row">
				              <label for="jobNo" class="col-sm-3 col-form-label">직급</label>
				              <div class="col-sm-9">
				              	<select name="jobNo" class="custom-select form-control" style="height: 45px;" required>
                                    <option selected>선택</option>
                                    <option value="1">병원장</option>
                                    <option value="2">교수</option>
                                    <option value="3">레지던트</option>
                                    <option value="4">인턴</option>
                                    <option value="5">간호사</option>
                                    <option value="6">부장</option>
                                    <option value="7">팀장</option>
                                    <option value="8">사원</option>
                                </select>
				              </div>
				            </div>
				            <div class="form-group row">
				              <label for="upfile" class="col-sm-3 col-form-label">프로필 사진</label>
				              <div class="col-sm-9">
				                <div class="input-group col-xs-12">
				                  <input type="file" id="upfile" name="upfile" class="form-control file-upload-info" placeholder="프로필 사진" required>
				                </div>
				              </div>
				            </div>
				            <div align="center">
				              <button type="submit" class="btn btn-gradient-primary me-2" style="background: rgb(29, 92, 99); width: 130px;">등록</button>
				              <button type="reset" class="btn btn-light" style="background: rgb(237, 230, 214); width: 130px;">초기화</button>
				            </div>
				          </form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>