<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMART DOCTOR</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">


<!-- fancyTree -->
<link href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    .wrap11 {
		width: 100%;
		background-color: white;
		border-radius: 30px 10px;
		box-shadow: 3px 3px 3px 3px lightgray;
		text-align: center;
		height: 100%;
	}
	
	.smallbtn1 {
		border-radius: 10px 10px 10px 10px;
		width: 50px;
		height: 20px;
		background-color: rgb(26, 188, 156);
		font-size: 0.8em;
		display: inline-block;
	}
	
	.left1 {
		display: inline-block;
		font-size: 0.7em;
		float: left;
	}
	
	.right1 {
		display: inline-block;
		font-size: 0.7em;
		float: right;
	}
	
    
  
    .topBar {
      	background-color: rgb(65, 125, 122);
		width: 100%;
		height: 50px;
		color: white;
		font-size: 25px;
		box-sizing: border-box;
		padding-top: 10px;
		padding-left: 30px;
		font-weight: 500;
		border-radius: 30px 10px;
    }

   

	.btn1 {
		width: 80px;
		height: 30px;
		border: 0px;
		border-radius: 5px;
		background: rgb(65, 125, 122);
		color: white;
		font-size: 15px;
	}
/* --------------------------------------------------------------------*/


   
	/* input창 스타일(가로크기는 자유) */
	input {
		height: 25px;
		border: 1px solid lightgray;
		border-radius: 3px;
	}
	/* input창 스타일 */
	
	/* textarea스타일 */
	textarea {
		border: 1px solid lightgray;
		border-radius: 3px;
		resize: none;
	}
	/* textarea스타일 */
		
	/* 입력폼 영역 */
	
	.mailUpload {
		text-align:left;
		margin:auto;
	}
	.mailUpload tr:nth-child(1) td:nth-child(2), .mailUpload tr:nth-child(2) td:nth-child(2){
		width:600px;
	}
	.mailUpload tr:nth-child(1) td:nth-child(3){
		text-align:left;
		width:100px;
		padding:0px;
	}
	.mailUpload tr:nth-child(4) th{
		vertical-align:top;
		padding-top:10px;
	}
	
	.mailUpload tr th{
		width:100px;
	}
	.mailUpload tr td{
		height:40px;
	}
	.mailUpload tr:nth-child(4) th,.mailUpload tr:nth-child(4) td {
		padding-top:10px;
	}
	
	.bigBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(190, 190, 190);
		color: white;
		font-size: 18px;
	}
	
	.bigBtn:hover {
		cursor: pointer;
	}
	
	
 	.upload-btn-wrapper {
	    position: relative;
	    overflow: hidden;
	    display: inline-block;
	}
	        
	.upload-btn {
	    border: 0px;
	    color: gray;
	    background-color: white;
	    padding: 8px 20px;
	    border-radius: 8px;
	    font-size: 20px;
	    font-weight: bold;
	}
	        
	.upload-btn-wrapper input[type=file] {
	    font-size: 100px;
	    position: absolute;
	    left: 0;
	    top: 0;
	    opacity: 0;
	}
	        
	#fileDragDesc {
	    margin-top:40px;
	    vertical-align:middle;
	    text-align: center; 
	    color:lightgray;
	    font-size:16px;
	}
	
	#deleteBtn{
		width: 20px;
		height: 20px;
		border-radius: 50%;
		color: rgb(190, 190, 190);
		display: inline-block;
		vertical-align: sub;
	}
	
	#deleteBtn:hover{
		cursor:pointer;
		color:rgb(243, 156, 18);
	}

    #btnArea {
	margin-left: 290px;
	width: 500px;
	}
	
	#btnArea button {
		display: inline-block;
		margin: 5px;
	}
	.inputDual1 {
		border-right:none;
	}
	.inputDual {
		border-right:none;
		border-left:none;
	}
	.inputDual3 {
		border-left:none;
	}
	
</style>
</head>
<body>
<div class="container-scroller">
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="wrap11" style="height: 100%;">

				<div class="topBar">
					<!-- 메뉴명 -->
					<span>메일쓰기</span>
				</div>
				<br><br><br>
					
							<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="get">
								<table class="mailUpload" id="boardDetail">
									<tr>
										<td colspan="2">
											<div class="left1">
												<c:choose>
													<c:when test="${empty e }">
														<button id="submitBoard" type="button" class="btn1" onclick="uploadFile();" style="width:60px; height:30px; font-size: 0.7em;">
														보내기<div class="mdi mdi-arrow-right-bold" style="font-size: 1.2em; display: inline-block; color: red;"></div>
														</button>
													</c:when>
													<c:otherwise>
														<button id="submitBoard" type="button" class="btn1" onclick="updateLoadFile();" style="width:60px; height:30px; font-size: 0.7em;">수정</button>
													</c:otherwise>
												</c:choose>
												<button id="submitBoard" type="button" class="btn1"  onclick="cancleBack();" style="width:60px; height:30px; font-size: 0.7em;">다시쓰기</button>
												
												<!-- 시간 남으면 해볼것
												<button type="button" class="btn1"onClick="javascript:popOpen();" style="width:60px; height:30px; font-size: 0.7em;">미리보기</button>
												<button type="button" class="btn1" style="width:60px; height:30px; font-size: 0.7em;">임시저장</button>
												-->
											</div>
										</td>
									</tr>
									<tr>
										<th>받는사람</th>
										<td>
											<div>
												<c:choose>
													<c:when test="${!empty trans}">
														<input id="n1" type="text" class="inputs" name="mailTo" style="width:950px; float:left;" value="${trans}@smartdoctor.com">
													</c:when>
													<c:otherwise>
														<input id="n1" type="text" class="inputs" name="mailTo" style="width:950px; float:left;">
													</c:otherwise>
												</c:choose>
											</div>
											<div><input id="m1" type="hidden" class="inputs" name="mailnameTo" ></div>
										<td><button type="button" class="btn1" onclick="window.open('openSigner.mil','mailAddToList','_blank');">주소록</button></td>
									</tr>
									<tr>
										<th>참조</th>
										<td>
											<div><input id="l1" type="text" class="inputs " name="mailWith" style="width:950px; float:left;"></div>
											<div><input id="i1" type="hidden" class="inputs" name="mailnameWith"></div>
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="2"><input type="text" class="inputs" name="mailTitle" style="width:1030px;"></td>
									</tr>
									<tr>
										<th>첨부파일 <button type="button" class="mdi mdi-arrow-down btn1 fileShow" style="background-color: lightgray; color: black; width: 25px;"></button>
											<c:if test="${e.mailAttachment ne null}">
												※현재 파일 <span><b>${fn:length(mtList)}</b></span>개
											</c:if></th>
										<td colspan="2">
										</td>
									</tr>
									<tr>
										<td></td>
										<td colspan="2">
											<div class="fileWrap" style="display:none;">
												<div class="upload-btn-wrapper">
													<input type="file" id="input_file" multiple="multiple" style="height: 100%;" />
													<button class="upload-btn fileShow mdi mdi-file-outline"></button>
												</div>
										        <div id="dropZone" style="width: 896px; height: 100px; border: 1px solid lightgray;">
										            <div id="fileDragDesc">
										            	<div class="mdi mdi-paperclip" style="display: inline-block;"></div>이곳에 첨부파일을 끌어오세요
										            </div>
										            <table id="fileListTable" width="100%" border="0px">
										                <tbody id="fileTableTbody">
										                	
										                </tbody>
										            </table>
										        </div>
										        <input type="hidden" id="bff" name="boardFileFlag" value="${e.mailAttachment }">
										        <input type="hidden" id="fileListSize" name="fileListSize" value="${fn:length(mtList)}">
										        <div class="fileNameList" style="display:none;">
										        	<table class="fnoTable" border="1">
										        	<tr>
										        	<c:forEach items="${ mtList }" var="mt">
										        		<td><input type="hidden" name="fno" value="${mt.attachmentNo}">${mt.attachmentNo}</td>
										        	</c:forEach>
										        	</tr>
										        	</table>
										        </div>
									        </div>
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="2"><textarea class="textArea" rows="25" cols="125" name="mailContent" style="resize:none;"></textarea></td>
									</tr>
								</table>
								<input type="hidden" name="mailnameFrom" value="${ loginUser.empName }">
								<input type="hidden" name="empNo" value="${ loginUser.empNo }">
								<input type="hidden" id="mailNo" name="mailNo" value="${e.mailNo }">
								<div class="ffnos" style="display:none;">
								<c:forEach items="${ btList }" var="bt">
									<input type="file" id="ffno" name="ffno" value="">
								</c:forEach>
								
								</div>
							</form>
							<br><br><br><br><br>
						
				</div>
			</div>
		<jsp:include page="../common/footer.jsp" />
		</div>
	</div>
	
	
	
	
	
	<script>
	var signerId = new Array();
	var signerName = new Array();
	
	// 받는사람아이디 받아오기
	function getSid(data){
		signerId = data;
		console.log("받는사람: " + signerId);
	}
	
	// 받는사람이름 받아오기
	function getSname(data){
		signerName = data;
		console.log("받는사람: " + signerName);
	}
	
	var refId = new Array();
	var refName = new Array();
	
	// 참조 아이디 받아오기
	function getRefId(data){
		refId = data;
		console.log("참조: " + refId);
	}
	
	// 참조 이름 받아오기
	function getRefName(data){
		refName = data;
		console.log("참조: " + refName);
	}
	
	function cancleBack(){
		if('${param.pageFrom}'=='inbox'){
			location.href="list.mil?currentPage=1&mailOwn=" + '${loginUser.empNo}';
		}else if('${param.pageFrom}'=='detail'){
			location.href="list.mil?currentPage=1&mailOwn=" + '${loginUser.empNo}';
		}else if('${param.pageFrom}'=='import'){
			location.href="ilist.mil?currentPage=1&mailOwn=" + '${loginUser.empNo}';
		}else{
			location.href="flist.mil?currentPage=1&mailOwn=" + '${loginUser.empNo}';
		}
		
	}
	$(document).ready(function() {
        $("#input_file").bind('change', function() {
            selectFile(this.files);
            //this.files[0].size gets the size of your file.
            //alert(this.files[0].size);
        });
	});
	
	$(document).ready(function() {
		$(".fileShow").click(function(e) {
			e.preventDefault();
			if($(".fileWrap").is(":visible")){
				$(".fileWrap").slideUp(100);
			}else {
				$(".fileWrap").slideDown(100);
			}
		});
	 });
	 // 파일 리스트 번호
	 var fileIndex = 0;
	 // 등록할 전체 파일 사이즈
	 var totalFileSize = 0;
	 // 파일 리스트
	 var fileList = new Array();
	 // 파일 사이즈 리스트
	 var fileSizeList = new Array();
	 // 등록 가능한 파일 사이즈 MB
	 var uploadSize = 50;
	 // 등록 가능한 총 파일 사이즈 MB
	 var maxUploadSize = 500;
	
	 $(function() {
	     // 파일 드롭 다운
	     fileDropDown();
	 });
	
	 // 파일 드롭 다운
	 function fileDropDown() {
	     var dropZone = $("#dropZone");
	     //Drag기능 
	     dropZone.on('dragenter', function(e) {
	         e.stopPropagation();
	         e.preventDefault();
	         // 드롭다운 영역 css
	         dropZone.css('background-color', '#E3F2FC');
	     });
	     dropZone.on('dragleave', function(e) {
	         e.stopPropagation();
	         e.preventDefault();
	         // 드롭다운 영역 css
	         dropZone.css('background-color', '#FFFFFF');
	     });
	     dropZone.on('dragover', function(e) {
	         e.stopPropagation();
	         e.preventDefault();
	         // 드롭다운 영역 css
	         dropZone.css('background-color', '#E3F2FC');
	     });
	     dropZone.on('drop', function(e) {
	         e.preventDefault();
	         // 드롭다운 영역 css
	         dropZone.css('background-color', '#FFFFFF');
	
	         var files = e.originalEvent.dataTransfer.files;
	         if (files != null) {
	             if (files.length < 1) {
	                 /* alert("폴더 업로드 불가"); */
	                 console.log("폴더 업로드 불가");
	                 return;
	             } else {
	                 selectFile(files)
	             }
	         } else {
	             alert("ERROR");
	         }
	     });
	 }
	
	 // 파일 선택시
	 function selectFile(fileObject) {
	     var files = null;
			 console.log(fileObject);
	     if (fileObject != null) {
	         // 파일  등록시
	         files = fileObject;
	         console.log(files);
	     }
	
	     // 다중파일 등록
	     if (files != null) {
	         
	         if (files != null && files.length > 0) {
	             $("#fileDragDesc").hide(); 
	             $("fileListTable").show();
	         } else {
	             $("#fileDragDesc").show(); 
	             $("fileListTable").hide();
	         }
	         
	         for (var i = 0; i < files.length; i++) {
	             // 파일 이름
	             var fileName = files[i].name;
	             var fileNameArr = fileName.split("\.");
	             // 확장자
	             var ext = fileNameArr[fileNameArr.length - 1];
	             
	             var fileSize = files[i].size; // 파일 사이즈(단위 :byte)
	             console.log("fileSize="+fileSize);
	             if (fileSize <= 0) {
	                 console.log("0kb file return");
	                 return;
	             }
	             
	             var fileSizeKb = fileSize / 1024;
	             var fileSizeMb = fileSizeKb / 1024;
	             
	             var fileSizeStr = "";
	             if ((1024*1024) <= fileSize) {    // 파일 용량이 1메가 이상인 경우 
	                 console.log("fileSizeMb="+fileSizeMb.toFixed(2));
	                 fileSizeStr = fileSizeMb.toFixed(2) + " Mb";
	             } else if ((1024) <= fileSize) {
	                 console.log("fileSizeKb="+parseInt(fileSizeKb));
	                 fileSizeStr = parseInt(fileSizeKb) + " kb";
	             } else {
	                 console.log("fileSize="+parseInt(fileSize));
	                 fileSizeStr = parseInt(fileSize) + " byte";
	             }
	
	             /* if ($.inArray(ext, [ 'exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml' ]) >= 0) {
	                 // 확장자 체크
	                 alert("등록 불가 확장자");
	                 break; */
	             if ($.inArray(ext, [ 'hwp', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'pdf','PNG', 'png', 'jpeg', 'gif', 'zip','jpg','JPG' ]) <= 0) {
	                 // 확장자 체크
	                 /* alert("등록이 불가능한 파일 입니다.");
	                 break; */
	                 alert("등록이 불가능한 파일 입니다.("+fileName+")");
	             } else if (fileSizeMb > uploadSize) {
	                 // 파일 사이즈 체크
	                 alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
	                 break;
	             } else {
	                 // 전체 파일 사이즈
	                 totalFileSize += fileSizeMb;
	
	                 // 파일 배열에 넣기
	                 fileList[fileIndex] = files[i];
	
	                 // 파일 사이즈 배열에 넣기
	                 fileSizeList[fileIndex] = fileSizeMb;
	
	                 // 업로드 파일 목록 생성
	                 addFileList(fileIndex, fileName, fileSizeStr);
	
	                 // 파일 번호 증가
	                 fileIndex++;
	             }
	         }
	     } else {
	         alert("ERROR");
	     }
	 }
	 
	 // 업로드 파일 목록 생성
	 function addFileList(fIndex, fileName, fileSizeStr) {
	     /* if (fileSize.match("^0")) {
	         alert("start 0");
	     } */
	
	     var html = "";
	     html += "<tr id='fileTr_" + fIndex + "'>";
	     html += "    <td id='dropZone' class='left' >";
	     html += fileName + " (" + fileSizeStr +") " 
	             //+ "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'> 삭제</a>"
	             + "<span id='deleteBtn' class='material-icons' onclick='deleteFile(" + fIndex + "); return false;'>highlight_off</span>"
	     html += "    </td>"
	     html += "</tr>"
	
	     $('#fileTableTbody').append(html);
	 }
	
	 // 업로드 파일 삭제
	 function deleteFile(fIndex) {
	     console.log("deleteFile.fIndex=" + fIndex);
	     // 전체 파일 사이즈 수정
	     totalFileSize -= fileSizeList[fIndex];
	
	     // 파일 배열에서 삭제
	     delete fileList[fIndex];
	
	     // 파일 사이즈 배열 삭제
	     delete fileSizeList[fIndex];
	
	     // 업로드 파일 테이블 목록에서 삭제
	     $("#fileTr_" + fIndex).remove();
	     
	     console.log("totalFileSize="+totalFileSize);
	     
	     if (totalFileSize > 0) {
	         $("#fileDragDesc").hide(); 
	         $("fileListTable").show();
	     } else {
	         $("#fileDragDesc").show(); 
	         $("fileListTable").hide();
	     }
	 }
		 
	 
	 
	 
	 // 파일 등록
	 function uploadFile() {
	     // 등록할 파일 리스트
	     var uploadFileList = Object.keys(fileList);
	     	//signerId - 받는사람 아이디
	 	
			//signerName = data; -- 받는 사람 이름
		
			//refId = data; -- 참조 아이디
		
		
			//refName = data; -- 참조 이름
			var refNameStr=refName.join(',');
			
		    console.log(signerId + signerName + refId, refNameStr);
	        var form = $('#uploadForm');
	        console.log(form[0]);
	        var formData = new FormData(form[0]);
	        formData.append('mailTitle', form[0].mailTitle.innerText);
	        formData.append('mailContent', form[0].mailContent.innerText);
	        formData.append('mailTo', form[0].mailTo.innerText);
	        formData.append('empNo', form[0].empNo.innerText);
	        formData.append("mailnameTo", form[0].mailnameTo.innerText);
	        formData.append("mailnameFrom", form[0].mailnameFrom.innerText);
	        for (var i = 0; i < uploadFileList.length; i++) {
	            formData.append('files', fileList[uploadFileList[i]]);
	        }
	        
	        /* console.log(formData.getAll('boardTitle'));
	        console.log(formData.getAll('boardContent'));
	        console.log(formData.getAll('boardWriter'));
	        console.log(formData.getAll('empNo'));
	        console.log(formData.getAll('files')); */
	        
	        $.ajax({
	            url : "insert.mil",
	            data : formData,
	            type : 'POST',
	            enctype : 'multipart/form-data',
	            processData : false,
	            contentType : false,
	            dataType : 'json',
	            cache : false,
	            success : function(result) {
	                if (result >= 1) {
	                    alert("메일 전송 완료");
	                    location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empNo}";
	                } else {
	                    alert("메일 전송 실패");
	                    location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empNo}";
	                }
	                
	            },
	            error:function(){	// error : ajax 통신실패시 처리할 함수 지정
						console.log("ajax 통신 실패!");
					}
					
	        });
	 }
	</script>
	
</body>
</html>