<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조직도 조회</title>
<style>
/* --- 공통 ---*/
.wrap11{
width: 100%;
background-color: white;
border-radius: 10px 20px 30px 40px;
box-shadow: 3px 3px 3px 3px lightgray;
}

#att-area{
  padding-bottom:80px;
  padding-top:20px;
}

body{
  font-family: 'IBM Plex Sans KR', sans-serif;
  font-family: 'Nanum Gothic', sans-serif;
  font-size:15px;
}
/* ---------- */

/* 조직도 영역 스타일 */
.org-wrap {
  /* height:500px; */
  margin:auto;
  margin-top:50px;
  padding-bottom:50px;
  background:rgb(243, 243, 243); 
  border-radius:5px;
}

.org-wrap>h4 {
    text-align:center;
    padding-top:10px;
    padding-bottom:10px;
}
.org-wrap a,span{
	color:black !important;
}

li {
  list-style:none;
}
.nav-link {
    color:black;
}

/* 사원 조회 테이블 스타일 */
#org-mem hr {
  width: 90%;
  margin-left: 35px;
}

#mem-tb {
  width:90%;
  margin-left:35px;
  text-align:center;
}

#mem-tb tr {
  height:50px;
}

#mem-tb img {
  border-radius:50%;
}

/* 초록 버튼 */
.green-btn {
  background:RGB(29, 92, 99);
  color:white;
}
.green-btn:hover {
  background:#1D5C83;
  color:white;
}
/* 작은 버튼 */
.small-btn {
  width:70px;
  height:30px;
  border-style:none;
  border-radius:7px;
  font-weight:400;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp"/>

	<!-- partial !!!여기서부터 메인 시작!!! -->
    <div class="main-panel">
      <div class="content-wrapper">
        <h3><b>조직도 조회</b></h3>
        <hr>
        <br>
        <div class="container card wrap11" id="att-area">

            <div class="row">

                <!-- 조직도 영역 (왼쪽) -->
                <div class="col-4">
                    <div class="org-wrap" id="org-chart" style="width:80%; margin-right:10px;">
                        <br>
                        <h4><b><i class="mdi mdi-hospital-building"></i>율제병원</b></h4>
                        <ul>
                          
                          <c:forEach var="m" items="${ mlist }">
                          
                          <!-- 병원장 -->
                          	<c:if test="${ m.jobName eq '병원장' }">
	                          <li class="nav-item">
	                            <a class="nav-link" data-bs-toggle="collapse" aria-expanded="false" aria-controls="ui-basic">
	                                <i class="mdi mdi-account"></i>
	                              <span class="menu-title">${m.jobName} ${m.empName}</span>
	                            </a>
	                          </li>
                          	</c:if>
                          	
                          	<!-- 부서 -->
                          	<c:if test="${ m.level eq 1 }">
                      			<!-- 상위부서 -->
		                          <li class="nav-item">
		                            <a class="nav-link" data-bs-toggle="collapse" href="#dept"+1 aria-expanded="false" aria-controls="ui-basic">
		                                <i class="mdi mdi-chevron-double-right"></i>
		                              <span class="menu-title">${ m.deptName }</span>
		                            </a>
								
								<c:choose>
									<!-- 하위부서가 있을 경우 (진료부, 간호부) -->
									<c:when test="${ m.level eq 2 and m.upperNo eq 1 }">
									
										
										<!-- 진료부 하위요소 -->
			                            <div class="collapse" id="dept"+1>
			                                <ul class="nav flex-column sub-menu" style="padding-left:30px;">
			                                    <!-- 일반외과 -->
			                                    <li class="nav-item">
			                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-1" aria-expanded="false" aria-controls="ui-basic">
			                                            <i class="mdi mdi-chevron-double-right"></i>
			                                            <span class="menu-title">일반외과</span>
			                                        </a>
			                                    </li>
			                                    <div class="collapse" id="dept1-1">
			                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
			                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
			                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
			                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
			                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
			                                        </ul>
			                                    </div>
			                                    <!-- 일반외과 끝 -->
			                                </ul>
			                            </div>
			                            <!-- 진료부 하위요소 끝-->
									</c:when>
									<!-- 하위부서가 없는 경우 (원무부, 경영지원부) -->
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								
	                            <!-- 진료부 하위요소 -->
	                            <div class="collapse" id="dept1">
	                                <ul class="nav flex-column sub-menu" style="padding-left:30px;">
	                                    <!-- 일반외과 -->
	                                    <li class="nav-item">
	                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-1" aria-expanded="false" aria-controls="ui-basic">
	                                            <i class="mdi mdi-chevron-double-right"></i>
	                                            <span class="menu-title">일반외과</span>
	                                        </a>
	                                    </li>
	                                    <div class="collapse" id="dept1-1">
	                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
	                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
	                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
	                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
	                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
	                                        </ul>
	                                    </div>
	                                    <!-- 일반외과 끝 -->
	                                </ul>
	                            </div>
	                            <!-- 진료부 하위요소 끝-->
	
	                          </li>
	                          <!-- 진료부 끝 -->
                          	</c:if>
                          	</c:forEach>
                          


                          <!-- 진료부-->
                          <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#dept1" aria-expanded="false" aria-controls="ui-basic">
                                <i class="mdi mdi-chevron-double-right"></i>
                              <span class="menu-title">진료부</span>
                            </a>

                            <!-- 진료부 하위요소 -->
                            <div class="collapse" id="dept1">
                                <ul class="nav flex-column sub-menu" style="padding-left:30px;">
                                    <!-- 일반외과 -->
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-1" aria-expanded="false" aria-controls="ui-basic">
                                            <i class="mdi mdi-chevron-double-right"></i>
                                            <span class="menu-title">일반외과</span>
                                        </a>
                                    </li>
                                    <div class="collapse" id="dept1-1">
                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
                                        </ul>
                                    </div>
                                    <!-- 일반외과 끝 -->
                                    <!-- 일반내과 -->
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-2" aria-expanded="false" aria-controls="ui-basic">
                                            <i class="mdi mdi-chevron-double-right"></i>
                                            <span class="menu-title">일반내과</span>
                                        </a>
                                    </li>
                                    <div class="collapse" id="dept1-2">
                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
                                        </ul>
                                    </div>
                                    <!-- 일반내과 끝 -->
                                    <!-- 정신과 -->
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-3" aria-expanded="false" aria-controls="ui-basic">
                                            <i class="mdi mdi-chevron-double-right"></i>
                                            <span class="menu-title">정신과</span>
                                        </a>
                                    </li>
                                    <div class="collapse" id="dept1-3">
                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
                                        </ul>
                                    </div>
                                    <!-- 정신과 끝 -->
                                    <!-- 이비인후과 -->
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="collapse" href="#dept1-4" aria-expanded="false" aria-controls="ui-basic">
                                            <i class="mdi mdi-chevron-double-right"></i>
                                            <span class="menu-title">이비인후과</span>
                                        </a>
                                    </li>
                                    <div class="collapse" id="dept1-4">
                                        <ul class="nav flex-column sub-menu" style="padding-left:20px;">
                                          <li class="nav-item"><a class="nav-link">이익준 교수</a></li>
                                          <li class="nav-item"><a class="nav-link">김말똥 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장겨울 전공의</a></li>
                                          <li class="nav-item"><a class="nav-link">장윤복 레지던트</a></li>
                                        </ul>
                                    </div>
                                    <!-- 이비인후과 끝 -->
                                </ul>
                            </div>
                            <!-- 진료부 하위요소 끝-->

                          </li>
                          <!-- 진료부 끝 -->

                          <!-- 간호부 -->
                          <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#dept2" aria-expanded="false" aria-controls="ui-basic">
                                <i class="mdi mdi-chevron-double-right"></i>
                              <span class="menu-title">간호부</span>
                            </a>

                            <div class="collapse" id="dept2">
                              <ul class="nav flex-column sub-menu" style="padding-left:30px;">
                                <li class="nav-item"><a class="nav-link">김길동</a></li>
                                <li class="nav-item"><a class="nav-link">이길동</a></li>
                                <li class="nav-item"><a class="nav-link">박길동</a></li>
                                <li class="nav-item"><a class="nav-link">정길동</a></li>
                              </ul>
                            </div>

                          </li>
                          <!-- 간호부 끝 -->

                          <!-- 원무부 -->
                          <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#dept3" aria-expanded="false" aria-controls="ui-basic">
                                <i class="mdi mdi-chevron-double-right"></i>
                              <span class="menu-title">원무부</span>
                            </a>

                            <div class="collapse" id="dept3">
                              <ul class="nav flex-column sub-menu" style="padding-left:30px;">
                                <li class="nav-item"><a class="nav-link">김길동</a></li>
                                <li class="nav-item"><a class="nav-link">이길동</a></li>
                                <li class="nav-item"><a class="nav-link">박길동</a></li>
                                <li class="nav-item"><a class="nav-link">정길동</a></li>
                              </ul>
                            </div>

                          </li>
                          <!-- 원무부 끝 -->

                          <!-- 총무부 -->
                          <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="collapse" href="#dept4" aria-expanded="false" aria-controls="ui-basic">
                                <i class="mdi mdi-chevron-double-right"></i>
                              <span class="menu-title">총무부</span>
                            </a>

                            <div class="collapse" id="dept4">
                              <ul class="nav flex-column sub-menu" style="padding-left:30px;">
                                <li class="nav-item"><a class="nav-link">김길동</a></li>
                                <li class="nav-item"><a class="nav-link">이길동</a></li>
                                <li class="nav-item"><a class="nav-link">박길동</a></li>
                                <li class="nav-item"><a class="nav-link">정길동</a></li>
                              </ul>
                            </div>

                          </li>
                          <!-- 총무부 끝 -->

                        </ul>
                    </div>
                </div>
                <!-- 부서별 사원 조회 영역 (오른쪽) -->
                <div class="col-8">
                    <div class="org-wrap" id="org-mem" style="width:90%; margin-left:10px;">
                        <h4 style="padding-top:30px;"><b><i class="mdi mdi-check-circle-outline"></i> 일반외과</b></h4>
                        <p style="float:right;">총 인원 : 10명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                        <br><br>
                        <hr>

                        <table id="mem-tb" class="table">
                            <tr>
                                <td>
                                    <img src="assets/images/faces/face1.jpg">
                                </td>
                                <th>교수</th>
                                <td>이익준</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="assets/images/faces/face2.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>이길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="assets/images/faces/face3.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>강길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="assets/images/faces/face4.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>송길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="assets/images/faces/face5.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>한길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                        </table>
                        <br><br>
                        <!-- 페이징-->
                        <div class="pagination" style="width:100%;">
                            <ul class="pagination" style="margin:auto;">
                            <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul>
                        </div>
                        <!-- 페이징 끝-->

                    </div>
                </div>
            </div>

        </div>
      </div>

      <!-- !!! 메인 끝 !!! -->
      <!-- content-wrapper ends -->
      <!-- partial:partials/_footer.html -->
      <footer class="footer">
        <div class="container-fluid d-flex justify-content-between">
          <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © SMART DOCTOR 2022</span>
        </div>
      </footer>
      <!-- partial -->
    </div>
</body>
</html>