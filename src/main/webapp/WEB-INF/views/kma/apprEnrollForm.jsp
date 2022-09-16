<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문 작성</title>
<!-- summernote -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

<!-- fancyTree -->
<link href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css" rel="stylesheet">
   
<style>
	.appr-table th {
		font-weight: 550;
		text-align: center;
		background: #f7f7f7;
		color: rgb(72, 72, 72);
		border-width: 2px;
	}
	
	.appr-table input {
		border: none;
	}
	
	.menu-icon {
		color: RGB(65, 125, 122) !important;
	}
	
	.btn-green { /* outline-btn */
		border-color: RGB(29, 92, 99);
		color: RGB(29, 92, 99);
		float: right;
		width: 110px;
		height: 35px;
		display: flex;
		justify-content: center;
		margin-bottom: 15px;
		margin-right: 5px;
	}
	
	.btn-green:hover {
		background: RGB(29, 92, 99);
		border-color: RGB(29, 92, 99);
		color: white;
	}
	
	.appr-menu-btn { /* 새 결재 진행 버튼 */
		background: RGB(29, 92, 99);
		color: white;
		width: 200px;
		height: 50px;
		border: none;
		margin-left: 30px;
	}
	
	.appr-write-btn { /* 결재요청 버튼 */
		background: RGB(29, 92, 99);
		color: white;
		border: none;
		float: right;
		width: 110px;
		height: 35px;
		display: flex;
		justify-content: center;
	}
	
	.appr-write-btn:hover {
		background: RGB(26, 60, 64);
		color: white;
		border: none;
	}
	.appr-table-wrapper {
		width: 1050px;
		padding-left: 40px;
	}
	.btn>span {
		white-space: nowrap;
	}
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
						전자결재 &nbsp;|&nbsp; <b>결재문 작성</b>
					</p>
					<hr>
					<br>
					<form id="insertAppr" action="apprInsert.si" method="post" enctype="multipart/form-data" >
						<input type="hidden" value="" name="apprTotal">
						<input type="hidden" value="${ loginUser.empNo }" name="empNo">
						<input type="hidden" value="" name="formNo">
						<div class="appr-table-wrapper">
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
								data-bs-toggle="modal" data-bs-target="#formModal"
								style="width: 130px;" onclick="selectFormList();">
								<i class="mdi mdi-application menu-icon"></i>&nbsp; 
								<span>결재양식 선택</span>
							</button>
							<button type="button" class="btn btn-outline-success btn-green">
								<i class="mdi mdi-download menu-icon"></i>&nbsp; 
								<span>임시저장</span>
							</button>
							
							<table class="table table-bordered appr-table">
								<tr>
									<th width="250px;">문서보존기간</th>
									<td>&nbsp;5년</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="apprTitle" placeholder="제목을 입력해주세요"></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td><input type="file" name="upfile"></td>
								</tr>
							</table>
							<div>
								<textarea class="yui3-cssreset" id="summernote" name="apprContent"></textarea>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- summernote -->
		    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
		    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
			<script>
				$(document).ready(function() {
					$('#summernote').summernote({
										spellCheck : true,
										disableDragAndDrop : true,
										codeviewFilter : false,
										codeviewIframeFilter : true,
										tabsize : 2,
										width : 1160,
										height : 600,
										toolbar : [
												[
														'style',
														[ 'fontname', 'fontsize',
																'bold', 'italic',
																'underline',
																'clear' ] ],
												[ 'color', [ 'color' ] ],
												[ 'para',
														[ 'ul', 'ol', 'paragraph' ] ],
												[ 'insert',
														[ 'link', 'picture', 'hr' ] ],
												[ 'view', [ 'fullscreen' ] ] ]
									});
				 });
			</script>


		</div>

		<!-- 결재양식선택 모달창 -->
		<div class="modal fade" id="formModal" tabindex="-1"
			aria-labelledby="formModalLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				<div class="modal-content" style="background:white;">
					<div class="modal-header">
						<h5 class="modal-title" id="formModalLabel" >결재양식 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" style="height:300px;">
						<div class="input-group appr-search-div" style="float:left; width:100%">
							<input type="text" class="form-control" placeholder="검색어를 입력해주세요">
							<button class="btn appr-write-btn btn-sm" type="button">
								<img src="resources/images/kma/search.png">
							</button>
						</div>
						<table class="table table-bordered appr-table" id="appr-comment">
							<thead>
								<tr style="border: 2px solid #DFDFDF;">
									<th id="form-modal-th" >&nbsp;결재양식 &nbsp;
										<span id="formCount"></span>
									</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-success btn-sm"
							style="background: RGB(29, 92, 99); color:white;" onclick="selectFormDetail();">선택</button>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			function selectFormList(){ // 결재양식선택 리스트 조회용 ajax함수
				
				$.ajax({
					url: "apprFormList.si",
					async:false,
					success:function(list){
						
						let value = "";
						for(let i=0; i<list.length; i++){
							 value += "<tr>"
									+   "<td><input type='radio' name='form'>&nbsp;&nbsp;" + list[i].formTitle + "&nbsp;-&nbsp;" + list[i].formInfo + "</td>"
									+ "</tr>"
						}
						
						$("#appr-comment tbody").html(value);
						$("#formCount").text( "(" + list.length + ")" );
						
						$('input:radio[name=form]').each(function(index, item){ // ajax로 조회해온 데이터에 value값 넣어주기
							$(item).val(list[index].formNo);
						})
						
					},
					error:function(){
						console.log("결재양식선택 리스트 조회용 ajax통신 실패");
					}
				})
				
				
			}
			
			function selectFormDetail(){ // 결재양식 불러오기용 ajax함수
				
				$.ajax({
					url: "apprFormDetail.si",
					async:false,
					data: {formNo:$("input:radio[name=form]:checked").val()},
					success:function(f){
						
						$('#summernote').summernote('reset');
						$('#summernote').summernote('pasteHTML', f.formContent);
						$('#formModal').modal('hide');
						
						$("input[name=formNo]").attr('value', f.formNo); // 결재요청시 넘길 formNo
					},
					error:function(){
						console.log("결재양식선택 불러오기용 ajax통신 실패");
					}
				})
			}
			
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
				
				$("#apprLine").children(".ap-md-bd").each(function(index, item){ // 결재자들 
					$("#insertAppr").append("<input type='hidden' value='" + $(item).children('.empId').text() + "' name='lineList[" + index + "].empNo'>")
				})
				
				$("#apprRef").children(".ap-md-bd").each(function(index, item){ // 참조자들
					$("#insertAppr").append("<input type='hidden' value='" + $(item).children('.empId').text() + "' name='RefList[" + index + "].empNo'>")
				})
				
				$('#lineModal').modal('hide');
			}
		</script>
		
		
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>