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

.mdi-settings {
  float:right;
}

/* 사원 조회 테이블 스타일 */
#org-mem hr {
  width: 90%;
  margin-left: 35px;
}

#org-mem i {
	cursor:pointer;
}

#mem-tb {
  width:90%;
  margin-left:35px;
  text-align:center;
}

#mem-tb tr {
  height:60px;
}

#mem-tb img {
  border-radius:50%;
  width:60px;
  height:60px;
}

.jobNo {
  width:20%;
}
.empName{
  width:15%;
}

.table td, .table th {
  vertical-align:middle !important;
}

/* 테이블 내의 아이콘 */
#mem-tb i {
  font-size:17px;
}


/* input 요소 글씨 크기 */
.form-control {
	font-size:13px !important;
	margin-top:15px;
}
      
/* 초록 버튼 */
.green-btn {
  background:RGB(29, 92, 99) !important;
  color:white !important;
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
.medium-btn {
  width:100px;
  height:40px;
  border-style:none;
  border-radius:7px;
  font-weight:400;
}

/* 모달 버튼 */
.btn-primary {
	background:#417D7A !important;
}
.btn-danger {
  background:red !important;
  color:white !important;
}

/* input 요소 배경색 변경 */
input, select {
	background:white !important; 
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp"/>

	<!-- partial !!!여기서부터 메인 시작!!! -->
    <div class="main-panel">
      <div class="content-wrapper">
        <h3><b>조직도 수정</b></h3>
        <hr>
        <br>
        <div class="container card wrap11" id="att-area">

            <div class="row">

                <!-- 조직도 영역 (왼쪽) -->
                <div class="col-4">
                    <div class="org-wrap" id="org-chart" style="width:80%; margin-right:10px;">
                        <br>
                        <h4><b><i class="mdi mdi-hospital-building"></i> 율제병원</b></h4>
                        <ul id="chartArea">
                         	로딩중...
                        </ul>
                        <span style="margin-left:30px;"><i class="mdi mdi-plus" data-bs-toggle="modal" data-bs-target="#insertDeptModal"></i></span>
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
						txt +=         '<i class="mdi mdi-account"></i> &nbsp;';
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
						upper += 		'<i class="mdi mdi-settings"></i>';
						upper +=		'<input type="hidden" value="' + dlist[i].deptNo + '">';
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
                            lower += 		'<i class="mdi mdi-settings"></i>';
                            lower += 		'<input type="hidden" value="' + dlist[i].deptNo + '">';
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
		
		//console.log(upperNo + "," + deptNo);
		
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
						txt += '<tr>';
						
						txt += '<input type="hidden" name="empNo" value="' + list[i].empNo + '">';
						txt += '<input type="hidden" name="deptNo" value="' + list[i].deptNo + '">';
                        txt += 	'<td>';
                        txt +=    '<img class="profileImg" src="' + list[i].path + '">';
                        txt +=	  '<input type="file" name="path" style="display:none;"';
                        txt +=  '</td>';
                        txt += 	'<th class="jobNo">';
                        txt +=	  '<input type="hidden" value="' + list[i].jobNo + '">';
                        txt +=    '<select class="form-control" name="jobNo" id="select">';
                        if(upperNo == 0 && deptNo == 0){
                        	txt += '<option name="jobNo" value="1">병원장</option>';
                        }else if(upperNo == 1 || deptNo == 1){
	                        txt += '<option name="jobNo" value="2">교수</option>';
	                        txt += '<option name="jobNo" value="3">레지던트</option>';
	                        txt += '<option name="jobNo" value="4">인턴</option>';
                        }else if(upperNo == 2 || deptNo == 2){
                        	txt += '<option name="jobNo" value="5">간호사</option>';
                        }else{
                        	txt += '<option name="jobNo" value="6">부장</option>';
                        	txt += '<option name="jobNo" value="7">팀장</option>';
                        	txt += '<option name="jobNo" value="8">사원</option>';
                        }
                        txt +=    '</select>';
                        txt += 	'</th>';
                        txt += 	'<td class="empName"><input class="form-control" type="text" name="empName" value="' + list[i].empName + '" required></td>';
                        txt +=  '<td class="email"><input class="form-control" type="email" name="email" value="' + list[i].email + '" required></td>';
                        txt +=  '<td style="vertical-align:middle;">';
                        txt += 		'<i class="deleteBtn mdi mdi-close" data-bs-toggle="modal" data-bs-target="#deleteMemModal" data-id="' + list[i].empNo + '"></i>';
                    	txt +=  	' <i class="updateBtn mdi mdi-account-settings"></i>';
                    	txt += 	'</td>';
                        txt += '</tr>';
                    	
					}
				}
				
				$('#mem-tb').empty();
				$('#mem-tb').append(txt);
				
				// 해당 사원의 직급이 기본적으로 선택되어 있게
				$('select[name=jobNo]').each(function(i, value1){ // 전체 select 순차적으로 접근
					$(this).children(i).each(function(j, value2){
						if( $(this).parent().siblings('input[type=hidden]').val() == $(this).val() ){
							$(this).attr("selected", true);
						}
					})
				})
				
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
	
	<!-------------------- 모달 영역 -------------------->
	<!-- 사원 삭제 모달 -->
	<div class="modal fade" id="deleteMemModal">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	    
	      <!-- Modal body -->
	      <div class="modal-body" style="text-align:center; margin:20px 10px;">
	        해당 사원을 삭제하시겠습니까?
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer" style="margin:auto;">
	      	<form id="deleteEmpForm" action="deleteEmp.me" method="POST">
	      		<input type="hidden" name="empNo">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button class="btn btn-danger" style="background:red; color:white;">삭제</button>
	        </form>
	      </div>
	
	    </div>
	  </div>
	</div>
	<!-- 사원 삭제 모달 끝 -->
	
	<!-- alert 대체용 모달 -->
	<div class="modal fade" id="alertModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content" style="background:white;">
				<!-- Modal body -->
				<div class="modal-body" style="text-align:center; margin:20px 10px;">
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="justify-content:center;">
					<button type="button" class="btn medium-btn green-btn" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- alert 대체용 모달 끝 -->
	
	<!-- 부서명 수정/삭제 모달 -->
     <div class="modal fade" id="deptModal">
       <div class="modal-dialog">
         <div class="modal-content" style="background:white;">
     
             <!-- Modal Header -->
             <div class="modal-header" style="text-align:center;">
             <h4 class="modal-title" style="width:100%;">부서 수정</h4>
             <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
             </div>
     
             <!-- Modal body -->
             <div class="modal-body">
                 <div class="form-group row">
                     <label for="department" class="col-sm-3 col-form-label" style="margin-top:20px; text-align:right;">부서명</label>
                     <div class="col-sm-9">
                         <input type="email" class="form-control" id="department" name="deptName" style="margin-top: 25px;">
                         <input type="hidden" name="deptNo">
                     </div>
                 </div>
             </div>
     
             <!-- Modal footer -->
             <div class="modal-footer" style="justify-content: center;">
             <button type="button" class="updateDeptBtn btn btn-primary">수정</button>
             <button type="button" class="deleteDeptBtn btn btn-danger">삭제</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
             </div>
     
         </div>
       </div>
     </div>
     <!-- 부서명 수정/삭제 모달 끝 -->
     
     <!-- 부서 추가 모달 -->
		<div class="modal fade" id="insertDeptModal">
		  <div class="modal-dialog">
		    <div class="modal-content" style="background:white;">
		
		      <!-- Modal Header -->
		      <div class="modal-header" style="text-align:center;">
		        <h4 class="modal-title" style="width:100%;">부서 추가</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<div class="row">
			         <label for="department" class="col-sm-3 col-form-label" style="margin-top:20px; text-align:right;">부서명</label>
	                 <div class="col-sm-9">
	                     <input type="text" class="form-control" id="department" name="deptName" 
	                     	placeholder="부서명을 입력해 주세요." style="margin-top:25px; width:250px; height:40px;">
	                 </div>
                 </div>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer" style="justify-content: center;">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" onclick="insertDept();" class="btn btn-primary">추가</button>
		      </div>
		
		    </div>
		  </div>
		</div>
	<!-- 부서 추가 모달 끝 -->
	<!---------------------- 모달 영역 끝 -------------------->
	
	<!------------------ 스크립트 영역 ---------------->
	
	<script>
	// ---------------- alert 대체용 모달 '확인' 클릭 이벤트 ----------------
	$('#alertModal .green-btn').click(function(){
		location.reload();
	})
	
	// ---------------- 사원 삭제 모달 불러오기 ---------------
	//$(".deleteBtn").click(function(){
	$(document).on("click", ".deleteBtn", function(){
		
		var data = $(this).data("id");
		console.log(data);
		$('.modal-footer #deleteEmpForm>input[name=empNo]').val(data);
	})
	
	// ---------------- 사원 수정 함수 ---------------
	//$(".updateBtn").click(function(){
	$(document).on("click", ".updateBtn", function(){
	
		//console.log( $(this).parent().siblings('input[name=empNo]').val() );
		//console.log( $(this).parent().siblings('.jobNo').children('select[name=jobNo]').val() ); 
		//console.log( $(this).parent().siblings('.empName').children('input[name=empName]').val() ); 
		//console.log( $(this).parent().siblings('.email').children('input[name=email]').val() ); 
		//console.log( $(this).parent().siblings('input[name=deptNo]').val() );
		
		$.ajax({
			url:"updateEmp.me",
			type:"POST",
			data:{
				empNo:parseInt($(this).parent().siblings('input[type=hidden]').val()),
				jobNo:parseInt($(this).parent().siblings('.jobNo').children('select[name=jobNo]').val()),
				empName:$(this).parent().siblings('.empName').children('input[name=empName]').val(),
				email:$(this).parent().siblings('.email').children('input[name=email]').val(),
				deptNo:$(this).parent().siblings('input[name=deptNo]').val()
			},
			success:function(str){
				
				console.log(str);
				
				// alert 대체용 모달에 문자열 전해주기
				$('#alertModal .modal-body').html(str);
				$('#alertModal').modal('show');
				
			},error:function(){
				console.log("사원 정보 수정용 ajax통신 실패");
			}
		});
	})
	
	// ----------------- 부서 수정/삭제 모달 띄우기 ------------------
	$(document).on("click", ".mdi-settings", function(){
		
		$('#deptModal input[name=deptName]').attr("placeholder", $(this).siblings('span').text() ); // 부서명
		$('#deptModal input[type=hidden]').val( $(this).siblings('input[type=hidden]').val() ); // 부서코드
		$('#deptModal').modal('show');
		
	})
	
	// ----------------- 부서 수정 함수 ------------------
	$(document).on("click", ".updateDeptBtn", function(){
	
		$('#deptModal').modal('hide');
		var deptName = $('#deptModal input[name=deptName]').val();
		var deptNo = $('#deptModal input[type=hidden]').val();
		
		//console.log("deptName : " + deptName + ", deptNo : " + deptNo);
		
		$.ajax({
			url:"update.de",
			type:"POST",
			data:{
				deptName:deptName,
				deptNo:deptNo
				
			},success:function(str){
				
				// alert 대체용 모달에 문자열 전해주기
				$('#alertModal .modal-body').html(str);
				$('#alertModal').modal('show');
				
			},error:function(){
				console.log("부서명 수정용 ajax통신 실패");
			}
		});
	})
	
	// ----------------- 부서 삭제 함수 ------------------
	$(document).on("click", ".deleteDeptBtn", function(){
		
		// 부서 수정/삭제 모달 숨기기
		$('#deptModal').modal('hide');
		
		// 부서코드 넣어주기
		var deptNo = $('#deptModal input[type=hidden]').val();
		
		$.ajax({
			url:"delete.de",
			type:"POST",
			data:{
				deptNo:deptNo
			},success:function(str){
				
				// alert 대체용 모달에 문자열 전해주기
				$('#alertModal .modal-body').html(str);
				$('#alertModal').modal('show');
				
			},error:function(){
				console.log("부서 삭제용 ajax통신 실패");
			}
		});
	})
	
	//---------------------- 부서 추가 함수 --------------------
	function insertDept(){
		
		//console.log($('#insertDeptModal input[name=deptName]').val());	
	
		// 부서 추가 모달 숨기기
		$('#insertDeptModal').modal('hide');
		
		// 부서 추가 ajax
		$.ajax({
			url:"insert.de",
			type:"post",
			data:{
				deptName:$('#insertDeptModal input[name=deptName]').val()
			},
			success:function(str){
				
				// alert 대체용 모달에 문자열 전해주기
				$('#alertModal .modal-body').html(str);
				$('#alertModal').modal('show');
				
			},error:function(){
				console.log("부서 추가용 ajax통신 실패");
			}
		
		})
	}
	
	// -------------- 프로필 변경 ----------------
	// 프로필 사진 클릭 시 첨부파일 선택 가능
	$(document).on("click", ".profileImg", function(){
		$(this).siblings('input[type=file]').click();
    })
    
    $(document).on("change", "input[type=file]", function(){
		// 선택한 파일 변수에 담기
    	const uploadFile = $(this)[0].files[0];
		
		//console.log(uploadFile);
		
		var formData = new FormData();
		formData.append("uploadFile", uploadFile);
		
		$.ajax({
			url:"uploadProfile.me",
			type:"POST",
			data: {
				uploadFile:formData,
				empNo:$(this).parents("input[name=empNo]").val()
			},
			contentType: false,
			processData: false,
			success:function(){
				
			},
			error:function(){
				console.log("프로필이미지 변경용 ajax통신 실패");
			}
		})
		
		
		
    })
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