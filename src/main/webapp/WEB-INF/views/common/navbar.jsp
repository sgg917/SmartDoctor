<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Purple Admin</title>
<!-- 모달 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
<link rel="shortcut icon" href="resources/images/favicon2.ico" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css"></link>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">









<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous"> 












</head>
<body>

	<!-- alert -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo goodeelogo" href="home.jy"><img src="resources/images/logo.png" alt="logo" style="width:250px; height:57px;"/></a>
          <a class="navbar-brand brand-logo-mini" href="home.jy"><img src="resources/images/favicon2.jpg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
            
            <li class="nav-item d-none d-lg-block full-screen-link">
              <a class="nav-link">
                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
              </a>
            </li>
            <!-- 채팅아이콘 -->
            <li class="nav-item d-none d-lg-block full-screen-link" style="cursor:pointer;" >
              <button class="nav-link" onclick="window.open('chatview.do','chatview','_blank');" style="background-color:white; border:0px;"> 
                <i class="mdi mdi-comment-processing-outline" id="fullscreen-button"  ></i>
              </button>
            </li>
            <!-- 메일 아이콘 -->
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="mdi mdi-email-outline"></i>
                <span class="count-symbol bg-warning"></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
                <h6 class="p-3 mb-0">Messages</h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="assets/images/faces/face4.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Mark send you a message</h6>
                    <p class="text-gray mb-0"> 1 Minutes ago </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="assets/images/faces/face2.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Cregh send you a message</h6>
                    <p class="text-gray mb-0"> 15 Minutes ago </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <img src="assets/images/faces/face3.jpg" alt="image" class="profile-pic">
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject ellipsis mb-1 font-weight-normal">Profile picture updated</h6>
                    <p class="text-gray mb-0"> 18 Minutes ago </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <h6 class="p-3 mb-0 text-center">4 new messages</h6>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                <i class="mdi mdi-bell-outline"></i>
                <span class="count-symbol bg-danger"></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
                <h6 class="p-3 mb-0">Notifications</h6>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-success">
                      <i class="mdi mdi-calendar"></i>
                    </div>
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject font-weight-normal mb-1">Event today</h6>
                    <p class="text-gray ellipsis mb-0"> Just a reminder that you have an event today </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-warning">
                      <i class="mdi mdi-settings"></i>
                    </div>
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject font-weight-normal mb-1">Settings</h6>
                    <p class="text-gray ellipsis mb-0"> Update dashboard </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item preview-item">
                  <div class="preview-thumbnail">
                    <div class="preview-icon bg-info">
                      <i class="mdi mdi-link-variant"></i>
                    </div>
                  </div>
                  <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
                    <h6 class="preview-subject font-weight-normal mb-1">Launch Admin</h6>
                    <p class="text-gray ellipsis mb-0"> New admin wow! </p>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <h6 class="p-3 mb-0 text-center">See all notifications</h6>
              </div>
            </li>
            <li class="nav-item nav-logout d-none d-lg-block">
              <a class="nav-link" href="logout.me">
                <i class="mdi mdi-power"></i>
              </a>
            </li>
          
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
        
        
        
        
        
        
        
        
        
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            
              <c:choose>
              	<c:when test="${ empty loginUser }">
              		<div align="center">
              			<a href="login.me" class="btn btn-block btn-gradient-primary btn-sm auth-form-btn font-weight-medium" style="background: RGB(29, 92, 99); color: white; width: 75%; height: 50px; font-weight: bold; line-height: 40px; font-size: 15px;">로그인</a>
              		</div>
              	</c:when>
              	
              	<c:otherwise>
              	<li class="nav-item nav-profile">
              		<a href="#" class="nav-link">
	                <div class="nav-profile-image">
	                  <img src="<c:out value='${ loginUser.path }' default='resources/profile_images/eunwoo.jpg'/>" alt="profile"><!--사용자 프로필사진-->
	                  <span class="login-status online"></span>
	                  <!--change to offline or busy as needed-->
	                </div>
	                <div class="nav-profile-text d-flex flex-column">
	                  <span class="font-weight-bold mb-2">${ loginUser.empName }</span>
	                  <table>
	                  	<tr>
	                  		<td>
	                  			<span class="text-secondary text-small">${ loginUser.deptName }</span>
	                  		</td>
	                  		<td>
	                  			<span class="text-secondary text-small">${ loginUser.jobName }</span>
	                  		</td>
	                  	</tr>
	                  </table>
	                  
	                </div>
	                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
	              </a>
	              <a href="logout.me" class="btn btn-block btn-gradient-primary btn-sm auth-form-btn font-weight-medium" style="background: RGB(29, 92, 99); color: white; width: 100%; height: 50px; font-weight: bold; line-height: 40px; font-size: 15px;">로그아웃</a>
	              <div align="center">
	              	<a href="changePwd.me" style="text-decoration: none; color: rgb(29, 92, 99);">비밀번호 변경</a>
              	  </div>
              	</li>
              	</c:otherwise>
              
              </c:choose>
              

            <li class="nav-item">
              <a class="nav-link" href="redirect:/">
                <span class="menu-title">메인화면</span>
                <i class="mdi mdi-home menu-icon"></i>
              </a>
            </li>
            <!-- 화면 테스트용 네비바 
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#numberzero" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">화면테스트용(지워야됨)</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-cat"></i>
              </a>
              <div class="collapse" id="numberzero">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="exercise.jy">진료 대기(지워야됨)</a></li>
                  <li class="nav-item"> <a class="nav-link" href="enrollForm.op">수술실 예약(지워야됨)</a></li>
                  <li class="nav-item"> <a class="nav-link" href="enrollfrom.pr">입원실 예약(지워야됨)</a></li>
                  <li class="nav-item"> <a class="nav-link" href="chatPage.ch">채팅화면(지워야됨)</a></li>
                </ul>
              </div>
            </li>
                 테스트용네비바 끝 -->
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#numberone" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">진료</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-stethoscope menu-icon"></i>
              </a>
              <div class="collapse" id="numberone">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="waiting.pt">진료 대기</a></li>
                  <c:if test="${ loginUser.jobNo eq '2' }">
                  	<li class="nav-item"> <a class="nav-link" href="enroll.tmt">진료 입력</a></li>
                  </c:if>
                  <!-- <li class="nav-item"> <a class="nav-link" href="detail.op">수술실 예약 조회</a></li>
                  <li class="nav-item"> <a class="nav-link" href="">입원실 예약 조회</a></li> -->
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#number3" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">원무</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-cart-plus menu-icon"></i>
              </a>
              <div class="collapse" id="number3">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="reception.mj">접수</a></li>
                  <li class="nav-item"> <a class="nav-link" href="list.mj">환자조회</a></li>
                  <li class="nav-item"> <a class="nav-link" href="rsvWaiting.mj">예약대기</a></li>
                  <li class="nav-item"> <a class="nav-link" href="room.mj">입원실현황</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pay.mj">수납</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#number5" aria-expanded="false" aria-controls="ui-basic">
                  <span class="menu-title">근태관리</span>
                  <i class="menu-arrow"></i>
                  <i class="mdi mdi-alarm-check menu-icon"></i>
                </a>
                <div class="collapse" id="number5">
                  <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="list.att?no=${ loginUser.empNo }">출퇴근 관리</a></li>
                    <li class="nav-item"> <a class="nav-link" href="list.vac?no=${ loginUser.empNo }">휴가 관리</a></li>
                    <li class="nav-item"> <a class="nav-link" href="goCalendar.att">월간 근태 체크</a></li>
                    <c:if test="${ loginUser.status eq 'A' }">
	                    <li class="nav-item"> <a class="nav-link" href="allList.att">사원 근태 관리</a></li>
	                    <li class="nav-item"> <a class="nav-link" href="allList.vac">사원 휴가 관리</a></li>
                    </c:if>
                  </ul>
                </div>
              </li>
               <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#number8" aria-expanded="false" aria-controls="general-pages">
                <span class="menu-title">전자결재</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
              </a>
              <div class="collapse" id="number8">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="apprEnrollForm.si">결재문 작성</a></li>
                  <li class="nav-item"> <a class="nav-link" href="apprStandbyList.si">결재대기 문서</a></li>
                  <li class="nav-item"> <a class="nav-link" href="apprReportList.si">기안문서함</a></li>
                  <li class="nav-item"> <a class="nav-link" href="apprGetList.si">결재문서함</a></li>
                  <li class="nav-item"> <a class="nav-link" href="apprReferList.si">참조문서함</a></li>
                  <li class="nav-item"> <a class="nav-link" href="apprStorageList.si">임시저장함</a></li>
                  <c:if test="${ loginUser.status eq 'A' }">
                  	<li class="nav-item"> <a class="nav-link" href="formList.si">결재양식 관리</a></li>
                  </c:if>
                </ul>
              </div>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#numbertwo" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">캘린더</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-calendar-clock menu-icon"></i>
              </a>
              <div class="collapse" id="numbertwo">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="hospitalCalender.mj">병원 캘린더</a></li>
                  <li class="nav-item"> <a class="nav-link" href="personalCalender.mj">개인 캘린더</a></li>
                </ul>
              </div>
            </li> -->
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#number4" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title">메일</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-email-outline menu-icon"></i><!--아이콘 바꿔줘야함-->
              </a>
              <div class="collapse" id="number4">
                <ul class="nav flex-column sub-menu">
                	<li class="nav-item"> <a class="nav-link" href="enrollForm.mil">메일쓰기</a></li>
                  	<li class="nav-item"> <a class="nav-link" href="list.mil?currentPage=1&mailOwn=${loginUser.empNo }">받은메일함</a></li>
                    <li class="nav-item"> <a class="nav-link" href="flist.mil?currentPage=1&mailOwn=${loginUser.empNo }">보낸메일함</a></li>
                    <!--<li class="nav-item"> <a class="nav-link" href="">임시메일함</a></li>-->
                    <li class="nav-item"> <a class="nav-link" href="ilist.mil?currentPage=1&mailOwn=${loginUser.empNo }">중요보관함</a></li>
                    <li class="nav-item"> <a class="nav-link" href="dlist.mil?currentPage=1&mailOwn=${loginUser.empNo }">휴지통</a></li>
                    <!--  <li class="nav-item"> <a class="nav-link" href="">주소록</a></li>-->
                </ul>
              </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="collapse" href="#number7" aria-expanded="false" aria-controls="ui-basic">
                  <span class="menu-title">조직도</span>
                  <i class="menu-arrow"></i>
                  <i class="mdi mdi-clipboard-account menu-icon"></i>
                </a>
                <div class="collapse" id="number7">
                  <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="orgChart.me">조직도 조회</a></li>
                    <c:if test="${ loginUser.status eq 'A' }">
                   		<li class="nav-item"> <a class="nav-link" href="adOrgChart.me">조직도 수정</a></li>
                    </c:if>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
              <a class="nav-link" href="list.no">
                <span class="menu-title">공지사항</span>
                <i class="mdi mdi-hospital menu-icon"></i>
              </a>
            </li>
            
            <c:if test="${ loginUser.status eq 'A' }">
	            <li class="nav-item">
	              <a class="nav-link" href="enroll.me">
	                <span class="menu-title">직원가입</span>
	                <i class="mdi mdi-account-multiple-plus menu-icon"></i>
	              </a>
	            </li>
            </c:if>
            
          </ul>
        </nav>
        
        
        
        
    <!-- plugins:js -->
    <script src="resources/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="resources/vendors/chart.js/Chart.min.js"></script>
	<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="resources/js/off-canvas.js"></script>
	<script src="resources/js/hoverable-collapse.js"></script>
	<script src="resources/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="resources/js/dashboard.js"></script>
	<script src="resources/js/todolist.js"></script>
	<!-- End custom js for this page -->

</body>
</html>