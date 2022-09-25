<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 로고 -->
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
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
#chartArea {
	padding-left:40px;
}
#chartArea * {
	font-size:1rem;
}
/* 사원 조회 테이블 스타일 */
#org-mem {
	height: 95%;
}
#org-mem hr {
  width: 90%;
  margin-left: 35px;
}
#org-mem>p {
  font-size:1rem;
}

#mem-tb {
  width:90%;
  margin-left:35px;
  text-align:center;
}

#mem-tb tr {
  height:50px;
  font-size:1rem;
}

#mem-tb td, #mem-tb th{
  vertical-align:middle !important;
  font-size:1rem;
}

#mem-tb img {
  border-radius:50%;
  width:70px;
  height:70px;
}

.jobNo {
  width:20%;
}
.empName{
  width:15%;
}

/* 테이블 내의 아이콘 */
#mem-tb i {
  font-size:17px;
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
  height:40px;
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
        <div class="wrap11" id="att-area">

            <div class="row">

                <!-- 조직도 영역 (왼쪽) -->
                <div class="col-4">
                    <div class="org-wrap" id="org-chart" style="width:80%; margin-right:20px;">
                        <br>
                        <h4><b><i class="mdi mdi-hospital-building"></i>율제병원</b></h4>
                        <ul id="chartArea">
                          로딩중...
                        </ul>
                    </div>
                </div>
                
                
                <!-- 부서별 사원 조회 영역 (오른쪽) -->
                <div class="col-8">
                    <div class="org-wrap" id="org-mem" style="width:90%; margin-left:10px;">
                        <h4 style="padding-top:30px;"><b></b></h4>
                        <p style="float:right;"></p>
                        <br><br>
                        <hr>

                        <table id="mem-tb" class="table">
                            
                        </table>
                        <br><br>
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
						
						txt += '<li class="nav-item" onclick="selectMem(0,0);">';
						txt +=     '<a class="nav-link" data-bs-toggle="collapse" aria-expanded="false" aria-controls="ui-basic">';
						txt +=         '<i class="mdi mdi-account"></i> ';
						txt +=         '<span class="menu-title">' + mlist[i].jobName + " " + mlist[i].empName + '</span>';
						txt +=     '</a>';
						txt += '</li>';
					}
				}
				$("#chartArea").empty();
				$('#chartArea').append(txt);
				
				// 상위부서 담기
				var num = 0; // 상위부서 개수를 담을 변수 
				for(let i=0; i<dlist.length; i++){
					
					// 상위부서인 경우 == level이 1, upperNo이 0
					var upper = "";
					if(dlist[i].level == 1 && dlist[i].upperNo == 0){
						upper = '<li class="nav-item" id="nav' + dlist[i].deptNo + '">';
						//upper += 	'<a class="nav-link" data-bs-toggle="collapse" href="#dept' + dlist[i].deptNo + '" aria-expanded="false" aria-controls="ui-basic">';
						upper += 	'<a class="nav-link" data-bs-toggle="collapse" href="#dept' + dlist[i].deptNo + '" aria-expanded="false" aria-controls="ui-basic" onclick="selectMem(' + 0 + ',' + dlist[i].deptNo + ')">';
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
				//console.log(num); // num == 4(상위부서 개수)
				
				// 하위부서 담기
				for(let i=0; i<dlist.length; i++){
					var lower = "";
					var emp = "";
					
					// 하위부서 담기
					for(let j=1; j<=num; j++){
						// 하위부서 존재 == level이 2, upperNo이 상위부서번호(1 or 2) => 하위부서 영역 만들기
						if(dlist[i].level == 2 && dlist[i].upperNo == j){
							
                            lower = '<li class="nav-item">';
                            
                         // 해당 부서에 사원이 있는지 검사 
                           	let result = 0;
                            for(let j=0; j<mlist.length; j++){
                            	
                            	if(mlist[j].deptNo == dlist[i].deptNo){
                            		result++;
                            	}
                            }
                           	// 사원이 있다면 -> 사원 조회 함수 실행
                           	if(result > 0){
	                            lower +=	'<a class="nav-link" data-bs-toggle="collapse" href="#dept' + dlist[i].upperNo + '-' + dlist[i].deptNo + 
	                            			'" aria-expanded="false" aria-controls="ui-basic" onclick="selectMem(' + dlist[i].upperNo + ',' + dlist[i].deptNo + ');">';
                           	}else{ // 사원이 없다면 -> 사원 조회 함수 실행 x
	                            lower += '<a class="nav-link" data-bs-toggle="collapse"' + 'href="#dept' + dlist[i].upperNo + '-' + dlist[i].deptNo + '" aria-expanded="false" aria-controls="ui-basic">';
                           	}
                           	
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
	
	//------------- 부서 별 사원 정보 조회 --------------
	function selectMem(upperNo,deptNo){
		
		// console.log(upperNo + "," + deptNo);
		$.ajax({
			url:"select.me",
			type:"POST",
			data:{
				upperNo:upperNo,
				deptNo:deptNo
			},
			success:function(map){
				
				// 부서별 사원 수
				var listCount = map.listCount;
				// 부서별 사원
				var list = map.list;
				
				// 부서명, 인원 수 넣어주기
				if(list[0].deptName == null){
				// 병원장일 경우
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> " + list[0].jobName);
				}else if(upperNo == 0 && deptNo > 2){
				// 원무/경영지원부
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> " + list[0].deptName);
				}else if(upperNo == 0 && deptNo == 1){
				// 진료부
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> 진료부");
				}else if(upperNo == 0 && deptNo == 2){
				// 간호부
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> 간호부");
				}else if(upperNo != 0){
				// 진료부 간호부 상세 과
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> " + list[0].deptName);
				}else{
				// 병원장일 경우
					$('#org-mem>h4>b').html("<i class='mdi mdi-check-circle-outline'></i> " + list[0].jobName);
				}
				$('#org-mem>p').html("총 인원 : " + listCount + "명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				
				// 부서별 사원 조회 결과 담기
				var txt = ""
				
				if(list == null){
					txt += '<td colspan="4" style="text-align:center;">조회 내역이 없습니다.</td>';
				}else{
					for(let i=0; i<list.length; i++){
						txt +=	'<tr>';
				        txt +=       '<td><img src="' + list[i].path + '"></td>';
				        txt +=       '<th>' + list[i].jobName + '</th>';
				        txt +=       '<td>' + list[i].empName + '</td>';
				        txt +=       '<td>' + list[i].phone + '</td>';
				        txt +=  '</tr>';
					}
				}
				$('#mem-tb').empty();
				$('#mem-tb').append(txt);
				
				// 
				
			},error:function(){
				console.log("부서별 사원 조회용 ajxa통신 실패");
			}
		})
		
		// 하위부서 없는 부서일 경우
		//if(upperNo == 0 && deptNo != 0){
		//	location.href="#dept"+deptNo;
			
		//}else if(upperNo != 0 && deptNo != null){
		// 하위부서 있는 부서일 경우
		//	location.href="#dept"+upperNo+"-"+deptNo;
		//}
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