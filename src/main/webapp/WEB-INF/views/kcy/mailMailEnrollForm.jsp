<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">

    <style>

      .wrap11{
        width: 100%;
        background-color: white;
        border-radius: 30px 10px;
        box-shadow: 3px 3px 3px 3px lightgray;
        text-align: center;
        height:100%;
      }

      .tb1{
        margin: auto;
        font-size: 0.7em;
        width: 90%;
        font-size: 0.8em;
        font-weight: 300;
        text-align: left;
      }

      .btn1{
        font-size: 1em;
        height: 25px;
        width: 70px; 
        padding:0%; 
        background-color: rgb(65, 125, 122);
        border: 0;
      }
      .btn1:hover {
        color: white;
        background-color: rgba(65, 125, 122, 0.41);

      }

      .smallbtn1{
        border-radius: 10px 10px 10px 10px;
        width:50px; 
        height:20px; 
        background-color:rgb(26, 188, 156);
        font-size: 0.8em;
        display: inline-block;
        
      }

      .table>th{
        height: 50px;
        text-align: left;
        
      }

      .left1{
        display: inline-block;
        font-size: 0.7em;
        float: left;
        margin-left:110px;
      }

      .right1{
        display: inline-block;
        font-size: 0.7em;
        float: right;
        margin-right:110px;
      }

      .wrap22{
        margin: auto;
        width: 90%;
      }
    


      .btn-box .btn-open {
            display: block;
            width: 200px;
            height: 50px;
            margin: 80px auto 0;
            line-height: 50px;
            background: #333;
            text-align: center;
        }

        .btn-box .btn-open span {
            color: #fff;
        }

        /* 팝업 스타일 */
        .modal-bg {display:none;width:100%;height:110%;position:fixed;top:0;left:0;right:0;background: rgba(0, 0, 0, 0.6);z-index:999;}
        .modal-wrap {display:none;position:absolute;top:70%;left:50%;transform:translate(-50%,-50%);width:800px;height:750px;background:#fff;z-index:1000;}

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
		#fileDragDesc {
	    margin-top:40px;
	    vertical-align:middle;
	    text-align: center; 
	    color:lightgray;
	    font-size:16px;
	}

	#dropZone{
	height:300px;
	}
	
    </style>
	<!-- summernote -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
	
	<!-- fancyTree -->
	<link href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css" rel="stylesheet">
</head>
<body>

	<div class="container-scroller">
		<jsp:include page="../common/navbar.jsp" />


		<!-- 
			
			메뉴바에 넣어줘야함
			<li><button class="subBtn" onclick='location.href="list.mil?currentPage=1&mailOwn=${loginUser.empId }"'>받은메일함</button></li>
			<li><button class="subBtn" onclick='location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empId }"'>보낸메일함</button></li>
			<li><button class="subBtn" onclick='location.href="ilist.mil?currentPage=1&mailOwn=${loginUser.empId }"'>중요메일함</button></li>
			<li><button class="subBtn subActive" onclick='location.href="enrollForm.mil"'>메일작성</button></li>
		 -->










		<div class="main-panel">
			<div class="content-wrapper">
				<div class="wrap11" style="height:100%;">
					<br>
					<br>
					<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="get">
					<input type="hidden" name="mailnameFrom" value="${ loginUser.empName }">
					<input type="hidden" name="empId" value="${ loginUser.empId }">
					<input type="hidden" id="mailNo" name="mailNo" value="${e.mailNo }">
					<div class="ffnos" style="display:none;">
					<c:forEach items="${ btList }" var="bt">
						<input type="file" id="ffno" name="ffno" value="">
					</c:forEach>
					</div>
						<div class="wrap22">
							<div class="left1">
								<button type="submit" class="btn1">보내기
								<div class="mdi mdi-arrow-right-bold"style="font-size: 1.2em; display: inline-block; color: red;"></div>
								</button>
								<button type="button" class="btn1"
									onClick="javascript:popOpen();">미리보기</button>
								<button type="button" class="btn1">임시저장</button>
								<button type="button" class="btn1">다시쓰기</button>
							</div>
							<div class="right1">
								
								<button type="button"
									class="btn1 mdi mdi-vector-arrange-above"
									style="background-color: lightgray; color: black; width: 25px;"
									onclick="pop1();"></button>
								<button type="button"
									class="btn1 mdi mdi-settings"
									style="background-color: lightgray; color: black; width: 25px;"></button>
							</div>
	
						</div>
	
	
						
	
						<table class="tb1 table" style="width:1100px">
							<tr class="cat1">
								<td width="100px" height="50px">받는사람</td>
								<td width="100px"><input type="checkbox">내게쓰기</td>
								<td colspan="2">
									<div>
										<c:choose>
											<c:when test="${!empty trans}">
												<input id="n1" type="text" class="inputs inputDual1" name="mailTo" style="width:120px; float:left;" value="${trans}@ergate.com">
											</c:when>
											<c:otherwise>
												<input id="n1" type="text" class="inputs inputDual1" name="mailTo" style="width:120px; float:left;">
											</c:otherwise>
										</c:choose>
									</div>
									<div><input id="n2" type="text" class="inputs inputDual" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="n3" type="text" class="inputs inputDual" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="n4" type="text" class="inputs inputDual" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="n5" type="text" class="inputs inputDual" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="n6" type="text" class="inputs inputDual" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="n7" type="text" class="inputs inputDual3" name="mailTo" style="width:120px; float:left;"></div>
									<div><input id="m1" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m2" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m3" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m4" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m5" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m6" type="hidden" class="inputs" name="mailnameTo"></div>
									<div><input id="m7" type="hidden" class="inputs" name="mailnameTo"></div>
								</td>
								<td width="50px"><button type="button"
										class="btn1">주소록</button></td>
							</tr>
							<tr class="cat1">
								<td height="50px">참조</td>
								<td></td>
								<td colspan="2">
									<div><input id="l1" type="text" class="inputs inputDual1" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l2" type="text" class="inputs inputDual" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l3" type="text" class="inputs inputDual" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l4" type="text" class="inputs inputDual" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l5" type="text" class="inputs inputDual" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l6" type="text" class="inputs inputDual" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="l7" type="text" class="inputs inputDual3" name="mailWith" style="width:120px; float:left;"></div>
									<div><input id="i1" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i2" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i3" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i4" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i5" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i6" type="hidden" class="inputs" name="mailnameWith"></div>
									<div><input id="i7" type="hidden" class="inputs" name="mailnameWith"></div>
								</td>
								<td width="50px"><button type="button"
										class="btn1">주소록</button></td>
							</tr>
							<tr class="cat1">
								<td height="50px">제목</td>
								<td><input type="checkbox">중요!</td>
								<td colspan="3"><input type="text" class="inputs" name="mailTitle" style="width: 100%;"></td>
							</tr>
							
							
							<tr>
								<td height="50px">첨부파일</td>
								<td>
									<button type="button" class="btn1 mdi mdi-arrow-up fileShow" style="background-color: lightgray; color: black; width: 25px;"></button>		
									<c:if test="${e.mailAttachment ne null}">
										※현재 파일 <span><b>${fn:length(mtList)}</b></span>개
									</c:if>
								</td>
								<td colspan="3"><input type="file" id="input_file" name="upfile" class="input-mail upfile" onchange="addFile()" multiple style="height: 100%;" /></td>
							</tr>
							
							<tr>
								<td></td>
								<td colspan="2">
									<div class="fileWrap" style="display:none;">
										<div class="upload-btn-wrapper">
											<input type="file" id="input_file" name="upfile" class="input-mail upfile" onchange="addFile()" multiple style="height: 100%;" />
										</div>
								        <div id="dropZone" class="file-list" style="width: 896px; height: 100px; border: 1px solid lightgray;">
								            <div id="fileDragDesc"> 
								            <div class="mdi mdi-paperclip" style="display: inline-block; text-align: middle;"></div>이곳에 첨부파일을 끌어오세요 또는 <a href="">파일선택</a> </div>
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
								        <c:choose>
													<c:when test="${empty e }">
														<button id="submitBoard" type="button" class="btn1" onclick="uploadFile();" style="background: rgb(26, 188, 156);">등록</button>
													</c:when>
													<c:otherwise>
														<button id="submitBoard" type="button" class="btn1" onclick="updateLoadFile();" style="background: rgb(26, 188, 156);">수정</button>
													</c:otherwise>
												</c:choose>
												<button class="btn1" type="button" onclick="cancleBack();">취소</button>
							        </div>
								</td>
							</tr>
							<tr>
								<td colspan="5"><textarea name="mailContent" style="width:100%;" class="yui3-cssreset"
										id="summernote" name="editcontent"></textarea></td>
							</tr>
							<tr>
								<td colspan="5"><button type="submit"
										class=" btn1">템플릿</button>
									<button type="submit" class="btn1">예약발송</button></td>
							</tr>
						</table>
					</form>



					<!-- modal 영역 -->
					<div class="modal-bg" onClick="javascript:popClose();"></div>
					<div class="modal-wrap">
						<br>
						<div style="float: left; width: 100px; height: 100px;">미리보기</div>
						<a style="float: right; width: 100px; height: 100px;"
							class="modal-close mdi mdi-close"
							onClick="javascript:popClose();"></a> <br>
						<hr>
						<div
							style="border: 1px solid lightgray; width: 90%; height: 85%; margin: auto;">
							<table 
								style="text-align: left; width: 90%; height: 80%; font-size: 0.8em; margin: auto;">
								<tr style="height: 50px;">
									<td colspan="2"><b>제목란, 공란시 빨간색으로 제목을 입력해주세요</b></td>
								</tr>
								<tr>
									<td width="100px" height="50px">보낸사람</td>
									<td>: 보내는 사람 이메일로 고정</td>
								</tr>
								<tr>
									<td height="50px">받는사람</td>
									<td>: honggildong@smartdoctor.com</td>
								</tr>
								<tr>
									<td height="50px">참조</td>
									<td>: parkgildong@smartdoctor.com</td>
								</tr>
								<tr>
									<td height="50px">첨부파일</td>
									<td>: 2022090234345353.jpg</td>
								</tr>
								<tr>
									<td colspan="2"><textarea cols="110" rows="14"
											name="content" style="resize: none" readonly></textarea></td>
								</tr>

							</table>
							<button type="button" class="btn1"
								onClick="javascript:popClose();" style="font-size: 0.8em;">수정하기</button>
							<button type="submit" class=" btn1"
								style="font-size: 0.8em;">전송하기</button>
							<br>
						</div>
					</div>
					<!-- //modal 영역 -->



					<!--모달-->
					<script>
                function popOpen() {

                var modalPop = $('.modal-wrap');
                var modalBg = $('.modal-bg'); 

                $(modalPop).show();
                $(modalBg).show();

                }

                function popClose() {
                var modalPop = $('.modal-wrap');
                var modalBg = $('.modal-bg');

                $(modalPop).hide();
                $(modalBg).hide();

                }
              </script>


					<!-- 창 분리 -->
					<script>
                function pop1(){
            // window.open();
            /*
                window.open(첫번째, 두번째, 세번째);
                첫번째 : 새 창에서 열고자 하는 url주소
                두번째 : 창 이름(target), 창 이름이 같은게 이미 열려있을 경우 새 창이 열리지 않고 기존의 창이 새로고침됨
                세번째 : 새창의 너비, 높이, 주소창의 여부, 툴바여부, 스크롤바 여부 등등 새로운 창의 특성(브라우저마다 적용범위 다름)
            */

            /*
                *창의 특성
                width : 창의 너비(px)
                height : 창의 높이(px)

                선택은 yes|no->
                resizable : 창 크기 조절 여부
                location : 주소창 여부
                menubar : 메뉴바 여부
                scrollbars : 스크롤바 여부
                status : 상태표시줄 여부
                toolbar : 도구모음 여부
            */
            // window.open("http://www.naver.com","ㄴㅇㅂ","width=500, height=500");
            window.open("file:///C:/Users/chaey/Desktop/smartdoc%20%ED%99%94%EB%A9%B4/smart%20doc%20html/%EB%A9%94%EC%9D%BC%EC%93%B0%EA%B8%B0%ED%8C%9D%EC%97%85.html","test","width=800, height=1000, resizable=no, location=no, menubar=no, scrollbars=no, status=no, toolbar=no");
        }
              </script>


				<!-- 아코디언 버튼 -->
				<script>
                 $(document).ready(function(){
                     $(".toggler").click(function(e){
                         e.preventDefault();
                         $('.cat'+$(this).attr('data-prod-cat')).toggle();
                     });
                 });

                 if($("#cat2").is("show")){
                   $("btn1").toggleClass("mdi mdi-arrow-up");
   	   
                 }else{
                   $("btn1").toggleClass("mdi mdi-arrow-down");

                 }
                </script>



					<!--drag&drop-->
					<script>
              

                //초기화
                $(document).ready(function(){
                    init();
                });

                //파일 Drag&Drop 업로드(초기화 시 EventListener를 부여하는 방식)
                const init = () => {
                    const sec = document.querySelector('#upload-section');
                    const btnUpload = sec.querySelector('.btn-upload');
                    const inputFile = sec.querySelector('input[type="file"]');
                    const uploadBox = sec.querySelector('.upload-box');
                  
                    //Chrome의 경우 DragOver한 파일을 Drop시 해당 파일 내용을 브라우저에 띄워주기 때문에
                    //dragover와 drop 이벤트의 기본 기능을 preventDefault를 이용해 막아준다.
                    
                    uploadBox.addEventListener('dragover', function(e) {
                        e.preventDefault();
                    });
                  
                    uploadBox.addEventListener('drop', function(e){
                        e.preventDefault();
                    
                        //DataTransfer로 받아올 수 있음
                        const data = e.dataTransfer;
                        //유효성 검사
                        if(!isValid(data)) return;
                    
                        //파일이 있는 경우 text 교체
                        $('#testFileNm').text(data.files[0] != null ? data.files[0].name : 'Drag&Drop');
                        //* Drag&Drop 된 파일을 input file의 내용으로 교체
                        $('#testFile')[0].files = data.files;
                    });
                }
                  
                //유효성 검사(필요한 부분만 가져와 사용하였음)
                const isValid = (data) => {
                    
                    //파일 유효 검사
                    if(data.types.indexOf('Files') < 0) return false;
                    //파일 개수 검사(여러 개의 파일을 선택 후, Drag&Drop 하는 것을 방지)
                    if(data.files.length > 1) {
                        alert('파일은 하나씩 전송이 가능합니다.');
                        return false;
                    }
                    return true;
                    
                }

              </script>



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
			location.href="list.mil?currentPage=1&mailOwn=" + '${loginUser.empId}';
		}else if('${param.pageFrom}'=='detail'){
			location.href="list.mil?currentPage=1&mailOwn=" + '${loginUser.empId}';
		}else if('${param.pageFrom}'=='import'){
			location.href="ilist.mil?currentPage=1&mailOwn=" + '${loginUser.empId}';
		}else{
			location.href="flist.mil?currentPage=1&mailOwn=" + '${loginUser.empId}';
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
	        formData.append('empId', form[0].empId.innerText);
	        formData.append("mailnameTo", form[0].mailnameTo.innerText);
	        formData.append("mailnameFrom", form[0].mailnameFrom.innerText);
	        for (var i = 0; i < uploadFileList.length; i++) {
	            formData.append('files', fileList[uploadFileList[i]]);
	        }
	        
	        /* console.log(formData.getAll('boardTitle'));
	        console.log(formData.getAll('boardContent'));
	        console.log(formData.getAll('boardWriter'));
	        console.log(formData.getAll('empId'));
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
	                    alert("게시글이 등록되었습니다.");
	                    location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empId}";
	                } else {
	                    alert("게시글 등록에 실패하였습니다.");
	                    location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empId}";
	                }
	                
	            },
	            error:function(){	// error : ajax 통신실패시 처리할 함수 지정
						console.log("ajax 통신 실패!");
					},
					complete:function(){// complete : ajax 통신 성공여부와 상관없이 실행
						console.log("무조건 호출!!");
					}
	        });
	 }
	</script>
</body>
</html>