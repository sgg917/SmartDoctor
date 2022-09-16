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
                        <ul id="chartArea">
                          
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
                                    <img src="views/assets/images/faces/face1.jpg">
                                </td>
                                <th>교수</th>
                                <td>이익준</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="views/assets/images/faces/face2.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>이길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="views/assets/images/faces/face3.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>강길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="views/assets/images/faces/face4.jpg">
                                </td>
                                <th>레지던트</th>
                                <td>송길동</td>
                                <td>aaa@gmail.com</td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="views/assets/images/faces/face5.jpg">
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
      
	<script>
	$(function(){
		// 조직도 출력용 함수
		selectOrg();
	})
	
	function selectOrg(){
	
		$.ajax({
			url:"select.org",
			type:"get",
			success:function(map){
				
				// 부서 리스트 꺼내담기
				var dlist = map.dlist;
				
				// 사원 리스트 꺼내담기
				var mlist = map.mlist;
				
				// console.log(dlist); console.log(mlist);
				
				// 병원장 담기
				var txt = "";
				for(let i=0; i<mlist.length; i++){
					
					if(mlist[i].jobName == '병원장'){
						
						txt += '<li class="nav-item">';
						txt +=     '<a class="nav-link" data-bs-toggle="collapse" aria-expanded="false" aria-controls="ui-basic">';
						txt +=         '<i class="mdi mdi-account"></i> ';
						txt +=         '<span class="menu-title">' + mlist[i].jobName + " " + mlist[i].empName + '</span>';
						txt +=     '</a>';
						txt += '</li>';
					}
				}
				$("#chartArea").empty();
				$('#chartArea').append(txt);
				
				var num = 0; // 상위부서 개수를 담을 변수 
				// 상위부서 담기
				for(let i=0; i<dlist.length; i++){
					
					// 상위부서인 경우 == level이 1, upperNo이 0
					var upper = "";
					if(dlist[i].level == 1 && dlist[i].upperNo == 0){
						upper = '<li class="nav-item" id="nav' + dlist[i].deptNo + '">';
						upper += 	'<a class="nav-link" data-bs-toggle="collapse" href="#dept' + dlist[i].deptNo + '" aria-expanded="false" aria-controls="ui-basic">';
						upper += 		'<i class="mdi mdi-chevron-double-right"></i> ';
						upper += 		'<span class="menu-title">' + dlist[i].deptName + '</span>';
						upper += 	'</a>';
						upper += 	'<div class="collapse" id="dept' + dlist[i].deptNo + '">';
						upper += 		'<ul class="nav flex-column sub-menu" style="padding-left:30px;">';
						upper += 		'</ul>';
						upper += 	'</div>';
						upper += '</li>';
						
						$('#chartArea').append(upper);
						num++;
                    }
				}
				console.log(num); // num == 4(상위부서 개수)
				
				// 하위부서 or 사원 담기
				for(let i=0; i<dlist.length; i++){
					var lower = "";
					var emp = "";
					
					// 하위부서 담기
					for(let j=1; j<=num; j++){
						// 하위부서 존재 == level이 2, upperNo이 상위부서번호(1 or 2) => 하위부서 영역 만들기
						if(dlist[i].level == 2 && dlist[i].upperNo == j){
							
                            lower = '<li class="nav-item">';
                            lower +=	'<a class="nav-link" data-bs-toggle="collapse"' +
                            			'href="#dept' + dlist[i].upperNo + '-' + dlist[i].deptNo + '" aria-expanded="false" aria-controls="ui-basic">';
                            lower +=       '<i class="mdi mdi-chevron-double-right"></i> ';
                            lower +=        '<span class="menu-title">' + dlist[i].deptName + '</span>';
                            lower +=	'</a>';
                            lower += '</li>';
                            lower += '<div class="collapse" id="dept' + dlist[i].upperNo + '-' + dlist[i].deptNo + '">';
                            lower += 	'<ul class="nav flex-column sub-menu" style="padding-left:20px;">';
                            lower += 	'</ul>';
                        	lower += '</div>';
							
                            $('#dept' + j + '>ul').append(lower);
                        }
					}
				}
				
                // 사원 담기
                for(let i=0; i<mlist.length; i++){
                	
                	for(let j=0; j<dlist.length; j++ ){
                		
	                	if(mlist[i].deptNo == dlist[j].deptNo){
	                		
	                		emp = '<li class="nav-item"><a class="nav-link">' + mlist[i].empName + " " + mlist[i].jobName + '</a></li>';
	                		
	                		if(dlist[j].level == 2 && dlist[j].upperNo != 0){
	                		// 부서가 '과'일 경우
	                			$('#dept' + dlist[j].upperNo + "-" + dlist[j].deptNo + ">ul").append(emp);
	                		
	                		}else if(dlist[j].level == 1 && dlist[j].upperNo == 0){
	                		// 상위부서일 경우
	                		
								$('#dept' + dlist[j].deptNo + ">ul").append(emp);
	                		}
	                	}
                	}
                	
                }
						
				
			},error:function(){
				console.log("조직도 출력용 ajax통신 실패");
			}
		});
	}	
	</script>

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