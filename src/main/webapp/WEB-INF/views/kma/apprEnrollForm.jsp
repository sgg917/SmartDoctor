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
	#ap-md-tr{
		border: 2px solid #DFDFDF;
	}
	#ap-md-tr>th{
		border:none;
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
					<div class="appr-table-wrapper">
						<button type="button" class="btn btn-success appr-write-btn">
							<i class="mdi mdi-arrow-up-bold" style="color: white;"></i>&nbsp;
							<span>결재요청</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green"
							data-bs-toggle="modal" data-bs-target="#lineModal"
							style="width: 130px;" onclick="selectLineDept();">
							<i class="mdi mdi-account-plus menu-icon"></i>&nbsp; <span>결재라인
								지정</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green"
							data-bs-toggle="modal" data-bs-target="#formModal"
							style="width: 130px;" onclick="selectFormList();">
							<i class="mdi mdi-application menu-icon"></i>&nbsp; <span>결재양식
								선택</span>
						</button>
						<button type="button" class="btn btn-outline-success btn-green">
							<i class="mdi mdi-download menu-icon"></i>&nbsp; <span>임시저장</span>
						</button>
						<table class="table table-bordered appr-table">
							<tr>
								<th width="250px;">문서보존기간</th>
								<td><select name="" style="width: 100px; height: 25px;">
										<option>영구보존</option>
										<option>1년</option>
										<option>3년</option>
										<option>5년</option>
								</select></td>
							</tr>
							<tr>
								<th>결재자</th>
								<td></td>
							</tr>
							<tr>
								<th>참조자</th>
								<td></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" placeholder="제목을 입력해주세요"></td>
							</tr>
						</table>
						<div>
							<textarea class="yui3-cssreset" id="summernote" name="formContent">${ f.formContent }</textarea>
						</div>
					</div>
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
									<th id="form-modal-th" >&nbsp;결재양식 &nbsp;<span id="formCount"></span></th>
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
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content" style="background:white; width:800px; margin:auto;">
					<div class="modal-header">
						<h5 class="modal-title" id="lineModalLabel">결재라인 지정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-bordered appr-modal-tb" id="appr-oz">
							<tr>
								<th>조직도</th>
							</tr>
							<tr>
								<td style="overflow-y: scroll; height:392px;">
									<div id="tree">
									  <ul id="treeData">
									  
									  </ul>
									</div>
								</td>
							</tr>
						</table>
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
								<th colspan="5" style="background: rgb(244, 244, 244);">결재자</th>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td width="40" rowspan="3" ><i
									class="mdi mdi-chevron-double-right"></i></td>
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
							<tr>
								<th colspan="5">참조자</th>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td width="40" rowspan="3" ><i
									class="mdi mdi-chevron-double-right"></i></td>
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
							<tr style="border: 1px solid #DFDFDF;">
								<td style="border:none;">강동원</td>
								<td style="border:none;">총무팀</td>
								<td style="border:none;">팀장</td>
								<td style="text-align: center; border:none;"><i
									class="mdi mdi-delete-forever" ></i></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-sm"
							data-bs-dismiss="modal" style="width:100px; height:40px;">취소하기</button>
						<button type="button" class="btn btn-success btn-sm"
							style="background: RGB(29, 92, 99); color:white; width:100px; height:40px;">선택하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<script src="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/jquery.fancytree-all-deps.min.js"></script>
		<script>
			
		
			function selectLineDept(){ // 결재라인 조직도 부서 조회용 ajax함수
				
				let dept;
				$.ajax({
					url: "apprLineDept.si",
					async:false,
					success:function(list){
						console.log(list);
						
						let allDept = "";
						let treatUp = "";
						let nurseUp = "";
						for(let i=0; i<list.length; i++){
							
							if(list[i].upperNo == 0){ // 상위부서 출력
								allDept += "<li id='" + list[i].deptNo + "' class='folder dept0'>" + list[i].deptName;
							}
							
							if(list[i].upperNo == 1){ // 진료부 하위부서 출력
								treatUp += "<li id='" + list[i].deptNo + "' class='folder dept1' >" + list[i].deptName;
							}
							
							if(list[i].upperNo == 2){ // 간호부 하위부서 출력
								nurseUp += "<li id='" + list[i].deptNo + "' class='folder dept2' >" + list[i].deptName;
							}
						}
						
						$("#treeData").html(allDept);
						$("#1").append("<ul>" + treatUp + "</ul>");
						$("#2").append("<ul>" + nurseUp + "</ul>");
						
						dept = list;
					},
					error:function(){
						console.log("결재라인 조직도 부서 조회용 ajax통신 실패");
					}
				})
				
				$.ajax({
					url: "apprLineList.si",
					async:false,
					success:function(emp){
						
						console.log(emp);
						
						let upper = "";
						let nurseEmp = "";
						let treatEmp = "";
						for(let i=0; i<emp.length; i++){
							
							if(emp[i].deptNo >= 5 && emp[i].deptNo <= 8){ // 진료부 하위부서에 속한 사원
								treatEmp += "<li id='" + emp[i].empNo + "'>" + emp[i].empName;
								console.log(treatEmp);
							}
							
							if(emp[i].deptNo >= 9){ // 간호부 하위부서에 속한 사원
								nurseEmp += "<li id='" + emp[i].empNo + "'>" + emp[i].empName;
								console.log(nurseEmp);
							}
							
							if(emp[i].deptNo <= 4){ // 하위부서가 없는 부서에 속한 사원
								upper += "<li id='" + emp[i].empNo + "'>" + emp[i].empName;
								console.log(upper);
							}
						}
						
						/*
						$('.folder').each(function(index, item){
							
							if( $(item).attr("class") == "dept1" ){
								
								if( $(item).attr("id") == emp[index].deptNo ){
									$(item).append("<ul>" + treatEmp + "</ul>");
								}
							}
							
						})
						*/
						
						
						
						
						$('.folder').each(function(index, item){ // 진료부 하위부서에 사원 출력
							
							if( $(item).attr("id") == emp[index].deptNo ){ 
								$(item).append("<ul>" + treatEmp + "</ul>");
							}
							if( $(item).attr("id") == emp[index].deptNo ){ 
								$(item).append("<ul>" + nurseEmp + "</ul>");
							}
						})
						
						/*
						$('.dept2').each(function(index, item){ // 간호부 하위부서
							
							if( $(item).attr("id") == emp[index].deptNo ){ 
								$(item).append("<ul>" + nurseEmp + "</ul>");
							}
						})
						
						
						$('.dept0').each(function(index, item){ // 상위부서
							
							if( $(item).attr("id") == emp[index].deptNo ){ 
								$(item).append("<ul>" + upper + "</ul>");
							}
						})
						*/
						
						$("#tree").fancytree();
						
					},
					error:function(){
						console.log("결재라인 조직도 리스트 조회용 ajax통신 실패");
					}
				})
				
			}
			
			
			function selectLineList(){ // 결재라인 조직도 리스트 조회용 ajax함수
				
				$.ajax({
					url: "apprLineList.si",
					async:false,
					success:function(list){
						
						console.log(list);
						
						let value = "";
						for(let i=0; i<list.length; i++){
							 value += "<li id=" + 'i' + "class='folder'>" + list[i].empName;
							 console.log(list[i].jobName);
						}
						
						$("#treeData").html(value);
						
						
					},
					error:function(){
						console.log("결재라인 조직도 리스트 조회용 ajax통신 실패");
					}
				})
			}
		</script>
		
		
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>