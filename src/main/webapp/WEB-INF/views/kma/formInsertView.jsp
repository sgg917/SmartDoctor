<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재양식 추가</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<style>
	.appr-table th{
	    font-weight:550; 
	    text-align: center; 
	    background:#f7f7f7;
	    color:rgb(72, 72, 72);
	    border-width: 2px;
	  }
	  .appr-table input{border:none;}
	  .menu-icon{color:RGB(65, 125, 122) !important;}
	  .btn-green{ /* outline-btn */
	    border-color:RGB(29, 92, 99); 
	    color:RGB(29, 92, 99);
	    float:right; 
	    width:110px; 
	    height:35px; 
	    display: flex; 
	    justify-content: center; 
	    margin-bottom:15px;
	    margin-right:5px;
	  }
	  .btn-green:hover{
	    background:RGB(29, 92, 99);
	    border-color:RGB(29, 92, 99); 
	    color:white;
	  }
	  .appr-menu-btn{  /* 새 결재 진행 버튼 */
	    background:RGB(29, 92, 99); 
	    color:white;
	    width:200px; 
	    height:50px; 
	    border:none; 
	    margin-left:30px;
	  }
	  .appr-write-btn{ /* 결재요청 버튼 */
	    background:RGB(29, 92, 99); 
	    color:white;
	    border:none; 
	    float:right; 
	    width:110px; 
	    height:35px; 
	    display:flex; 
	    justify-content:center; 
	  }
	  .appr-write-btn:hover{
	    background:RGB(26, 60, 64); 
	    color:white;
	    border:none; 
	  }
	  .appr-table-wrapper{
	    width:1050px; 
	    padding-left:40px;
	  }
	  .btn>span{white-space:nowrap;}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>결재양식 관리</b>
					</p>
					<hr>
					<br>
					<form action="formInsert.si" method="post">
						<div class="appr-table-wrapper" style="margin-left:20px;">
							<button type="submit" class="btn btn-success appr-write-btn">
								<i class="mdi mdi-note-plus" style="color: white;"></i>&nbsp; <span>추가하기</span>
							</button>
							<button type="button" class="btn btn-outline-success btn-green" onclick="location.href='formList.si'">
								<i class="mdi mdi-subdirectory-arrow-left menu-icon"></i>&nbsp; <span>이전목록</span>
							</button>
							<table class="table table-bordered appr-table">
								<tr>
									<th width="250px;">양식종류</th>
									<td>일반</td>
								</tr>
								<tr>
									<th>사용여부</th>
									<td>
										<input type="radio" name="formStatus" value="Y">사용 &nbsp; 
										<input type="radio" name="formStatus" value="N">미사용
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input type="text" placeholder="제목을 입력해주세요" name="formTitle"></td>
								</tr>
								<tr>
									<th>설명</th>
									<td>
										<input type="text" placeholder="설명을 입력해주세요"
										style="width: 800px;" name="formInfo">
									</td>
								</tr>
							</table>
							<div>
								<textarea class="yui3-cssreset" id="summernote" name="formContent"></textarea>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<!-- summernote -->
		    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
		    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
		    		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
		    		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>