<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fancyTree -->
<link href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css" rel="stylesheet">
<style>
	.ap-md-bd{
		border: 1px solid #DFDFDF;
	}
	.ap-md-bd>td{
		border:none;
	}
	#ap-md-tr{
		border: 2px solid #DFDFDF;
	}
	#ap-md-tr>th{
		border:none;
	}
	#selectedLine>input{
		width:105px;
	}
	#tree{
		overflow:auto; 
		height:370px;
	}
	.appr-line-md{
		background:white; 
		width:800px; 
		margin:auto;
	}
	.appr-line-div{
		width:500px; 
		height:150px; 
		border: 1px solid #DFDFDF;
	}
	.appr-line-div>button{
		width:65px; 
		height:100%; 
		border: 1px solid #DFDFDF; 
		background:white; 
		float:left;
	}
	.appr-line-div>table{
		width:433px; 
		float:right;
	}
	.ap-md-th{
		background: rgb(244, 244, 244);
	}
	.ap-mdi-del{
		text-align: center; border:none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>연장근무 신청</b>
					</p>
					<hr>
					<br>
					<form id="insertOvertime" action="insertOvertime.si" method="post">
						<input type="hidden" value="" name="apprTotal">
						<input type="hidden" value="${ loginUser.empNo }" name="empNo">
						<div class="appr-table-wrapper" style="margin-left:20px;">
							<button type="submit" class="btn btn-success appr-write-btn">
								<i class="mdi mdi-arrow-up-bold" style="color: white;"></i>&nbsp;
								<span>결재요청</span>
							</button>
							<button type="button" class="btn btn-outline-success btn-green"
								data-bs-toggle="modal" data-bs-target="#lineModal"
								style="width: 130px;" onclick="selectLineList();">
								<i class="mdi mdi-account-plus menu-icon"></i>&nbsp; 
								<span>결재라인 지정</span>
							</button>
							<button type="button" class="btn btn-outline-success btn-green" 
								    style="width: 100px;" onclick="history.back();">
								<i class="mdi mdi-subdirectory-arrow-left menu-icon"></i>&nbsp; 
								<span>뒤로가기</span>
							</button>
							<table class="table table-bordered appr-table">
								<tr>
									<th width="250px;">문서보존기간</th>
									<td>&nbsp;5년</td>
								</tr>
								<tr>
									<th>결재자</th>
									<td id="line-name"></td>
								</tr>
								<tr>
									<th>참조자</th>
									<td id="ref-name"></td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="apprTitle" placeholder="제목을 입력해주세요"></td>
								</tr>
							</table>
							<br>
							<br>
							<br>
							<h3 align="center" style="font-weight: 550;">상세정보 입력</h3>
							<br>
							<br>
							<table class="table table-bordered appr-table">
								<tr>
									<th width="250">신청자</th>
									<td>${ loginUser.empName }</td>
								</tr>
								<tr>
									<th>소속부서</th>
									<td>${ loginUser.deptName }</td>
								</tr>
								<tr>
									<th>근무날짜</th>
									<td><input type="date" name="overDate"></td>
								</tr>
								<tr>
									<th>근무시작시간</th>
									<td><input type="time" name="startTime" style="width: 105px;"></td>
								</tr>
								<tr>
									<th>근무종료시간</th>
									<td>
										<input type="time" name="endTime" style="width: 105px;"> &nbsp;
										<button type="button" id="time-btn" class="btn btn-sm" style="background:#DFDFDF; height:25px; line-height:3px;">확인</button>
									</td>
								</tr>
								<tr>
									<th>총근무시간</th>
									<td><input type="number" name="totalTime"></td>
								</tr>
								<tr>
									<th>근무사유</th>
									<td><input type="text" name="overCause" placeholder="사유를 입력해주세요"
										style="width: 800px;"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<script>
		
		</script>
		
		<!-- 결재라인 모달창 -->
		<div class="modal fade" id="lineModal" tabindex="-1"
			aria-labelledby="lineModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
				<div class="modal-content appr-line-md" style="background:white; width:800px; margin:auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="lineModalLabel">결재라인 지정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered appr-modal-tb" id="appr-oz" style="float:left;">
							<tr>
								<th>조직도</th>
							</tr>
							<tr>
								<td style="height:370px;">
									<div id="tree">
									  <ul id="treeData">
									  
									  </ul>
									</div>
								</td>
							</tr>
						</table>
						<!-- <i class="mdi mdi-chevron-double-right"></i>-->
						<div class="apprLineWrapper" style="float:right;">
							<table class="table table-bordered appr-modal-tb" style="width: 500px;">
								<tr id="ap-md-tr">
									<th></th>
									<th>이름</th>
									<th>부서</th>
									<th>직급</th>
									<th style="text-align: center;">
										<i class="mdi mdi-delete-forever"></i>
									</th>
								</tr>
								<tr>
									<th colspan="5" class="ap-md-th">결재자</th>
								</tr>
							</table>
							<div class="appr-line-div">
								<button id="appr-line">
									<i class="mdi mdi-chevron-double-right"></i>
								</button>
								<table class="table table-bordered appr-modal-tb" id="apprLine">
									
								</table> 
							</div>
							<table class="table table-bordered appr-modal-tb" style="width: 500px;">
								<tr>
									<th colspan="5" class="ap-md-th">참조자</th>
								</tr>
							</table>
							<div class="appr-line-div">
								<button id="appr-line-ref">
									<i class="mdi mdi-chevron-double-right"></i>
								</button>
								<table class="table table-bordered appr-modal-tb" id="apprRef">
									
								</table> 
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-bs-dismiss="modal" style="width:100px; height:40px;">취소하기</button>
						<button type="button" class="btn btn-success btn-sm"
							style="background: RGB(29, 92, 99); color:white; width:100px; height:40px;" onclick="selectedApprLine();">선택하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 결재라인 모달창 end -->
		
		<!-- fancytree -->
		<script src="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/jquery.fancytree-all-deps.min.js"></script>
		<script>
			
			function selectLineList(){ // 결재라인 조직도 출력용 함수
				
				$.ajax({
					url: "apprLineList.si",
					async:false,
					success:function(map){
						
						let deptList = map.deptList; // [{}, {}]
						let empList = map.empList; // [{}, {}]
						
						let sourceArr = []; // 최종만들어야되는 배열
						
						for(let i in deptList){
							let dept = deptList[i];
							
							if(dept.upperNo == 0){
								let sourceUpperDept = {
									title:dept.deptName,
									key:dept.deptNo,
									folder:true,
									expanded:true,
									children:[]
								};
								sourceArr.push(sourceUpperDept);
							}else{
								let sourceLowerDept = {
									title:dept.deptName,
									key:dept.deptNo,
									folder:true,
									children:[]	
								};
								
								for(let j in sourceArr){
									if(sourceArr[j].key == dept.upperNo){
										sourceArr[j].children.push(sourceLowerDept);
									}
								}
							}
						}
						
						for(let i in empList){
							let emp = empList[i];
							let empInfo = emp.empName + "&nbsp;" + emp.jobName
							let sourceEmp = {
								title:empInfo,
								key:emp.empNo
							};
							
							for(let i in sourceArr){
								let dept = sourceArr[i];
								
								if(dept.key == emp.deptNo){
									dept.children.push(sourceEmp);
								}else{
									for(let j in dept.children){
										if(dept.children[j].key == emp.deptNo){
											dept.children[j].children.push(sourceEmp);
										}
									}
								}
							}
						}
						
						$("#tree").fancytree({
							source:sourceArr,
							activate: function(event, data){ // 데이터 활성화
							      
								let node = data.node
								//console.log(node.key);
								addApprLine(node.key); // empNo 넘기기
							}
						});
						
					},
					error:function(){
						console.log("결재라인 조직도 리스트 조회용 ajax통신 실패");
					}
				})
			}
			
			function addApprLine(empNo){ // 결재라인 결재참조자 추가 함수
				
				let member;
				$.ajax({
					url: "apprLineEmp.si",
					async:false,
					data: {empNo: empNo},
					success:function(emp){

						data = "<tr class='ap-md-bd'>"
								 + "<td style='display:none' class='empId'>" + emp.empNo + "</td>"
							 	 + "<td class='empName'>" + emp.empName + "</td>"
								 + "<td>" + emp.deptName + "</td>"
								 + "<td>" + emp.jobName + "</td>"
								 + "<td class='ap-mdi-del'><i class='mdi mdi-delete-forever al-del'></i></td>"
						 	 + "</tr>"
						 	 
						member = emp; 

					},
					error:function(){
						console.log("결재라인 사원 조회용 ajax통신 실패");
					}
				})
				
				$("#appr-line").off('click').on('click', function(){ // 결재자
					
					console.log($(".empId").text());
					console.log(member.empNo);
					
					if( $(".empId").text() == member.empNo ){ // 동일한 사원 선택 제한
						
						alert("중복된 대상입니다.");
						$("#appr-line").off('click');
					
					}else if( $("#apprLine").children(".ap-md-bd").length > 2 ){ // 3명 이상 선택 제한
						
						alert("최대 결재인원은 3명입니다.");
						$("#appr-line").off('click');
						
					}else{ 
						
						$("#apprLine").append(data);
					}
					
        		})
        		
        		$("#appr-line-ref").off('click').on('click', function(){ // 참조자
        			
					if( $("#apprRef").find(".ap-md-bd").children("td:eq(0)").text() == member.empNo ){ // 동일한 사원 선택 제한
						
						alert("중복된 대상입니다.");
						$("#appr-ref").off('click');
					
					}else if( $("#apprRef").children(".ap-md-bd").length > 2 ){ // 3명 이상 선택 제한
						
						alert("최대 결재인원은 3명입니다.");
						$("#appr-ref").off('click');
						
					}else{
						
						$("#apprRef").append(data);
					}
        			
        		})
        		
        		
			}
			
			$(document).on('click', '.al-del', function(){ // 결재라인 지정 삭제
				
				$(this).closest('tr').remove();
			})
			
			function selectedApprLine(){ // 결재라인 지정 '선택하기' 버튼 클릭시 form에 넘길 요소
				
				let apprTotal = $("#apprLine").children(".ap-md-bd").length;
				$("input[name=apprTotal]").attr('value', apprTotal); // 총결재자수
				
				let lineArr = [];
				$("#apprLine").children(".ap-md-bd").each(function(index, item){ // 결재자들 
					$("#insertOvertime").append("<input type='hidden' value='" + $(item).children('.empId').text() + "' name='lineList[" + index + "].empNo'>")
					lineArr.push( $(item).children('.empName').text() );
				})
				
				let refArr = [];
				$("#apprRef").children(".ap-md-bd").each(function(index, item){ // 참조자들
					$("#insertOvertime").append("<input type='hidden' value='" + $(item).children('.empId').text() + "' name='RefList[" + index + "].empNo'>");
					refArr.push( $(item).children('.empName').text() );
				})
				
				$("#line-name").text(lineArr.join(" - ")); // 결재자 이름 출력
				$("#ref-name").text(refArr.join(", ")); // 참조자 이름 출력
				
				$('#lineModal').modal('hide');
			}
		</script>
		
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>