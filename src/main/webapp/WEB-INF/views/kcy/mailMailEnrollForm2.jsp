<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>

    <!--써머노트로 추정~-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <style>

      .wrap11{
        width: 100%;
        background-color: white;
        border-radius: 30px 10px;
        box-shadow: 3px 3px 3px 3px lightgray;
        text-align: center;
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

      th{
        height: 50px;
        text-align: left;
        
      }

      .left1{
        display: inline-block;
        font-size: 0.7em;
        float: left;
      }

      .right1{
        display: inline-block;
        font-size: 0.7em;
        float: right;
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



    </style>

  </head>
<body>

	<div class="container-scroller">
		<jsp:include page="../common/navbar.jsp" />


		<div class="main-panel">
			<div class="content-wrapper">
				<div class="wrap11">
					<br>
					<br>
					<div class="wrap22">
						<div class="left1">
							<button type="submit" class="btn btn-danger btn1">
								보내기
								<div class="mdi mdi-arrow-right-bold"
									style="font-size: 1.2em; display: inline-block; color: red;"></div>
							</button>
							<button type="button" class="btn btn-danger btn1"
								onClick="javascript:popOpen();">미리보기</button>
							<button type="button" class="btn btn-danger btn1">임시저장</button>
							<button type="button" class="btn btn-danger btn1">다시쓰기</button>
						</div>
						<div class="right1">
							<a type="button" class="toggler btn btn-danger btn1"
								data-prod-cat="1"
								style="background-color: lightgray; color: black; width: 25px;"
								id="hide"><div class="mdi mdi-arrow-up"></div>
								<!-- <div class="mdi mdi-arrow-down">아래 아이콘</div>--></a>
							<button type="button"
								class="btn btn-danger btn1 mdi mdi-vector-arrange-above"
								style="background-color: lightgray; color: black; width: 25px;"
								onclick="pop1();"></button>
							<button type="button"
								class="btn btn-danger btn1 mdi mdi-settings"
								style="background-color: lightgray; color: black; width: 25px;"></button>
						</div>

					</div>


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
							<button type="button" class="btn btn-danger btn1"
								onClick="javascript:popClose();" style="font-size: 0.8em;">수정하기</button>
							<button type="submit" class="btn btn-danger btn1"
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

					<table class="tb1">
						<tr class="cat1">
							<td width="100px" height="50px">받는사람</td>
							<td width="100px"><input type="checkbox">내게쓰기</td>
							<td colspan="2"><input type="text" style="width: 100%;"></td>
							<td width="50px"><button type="button"
									class="btn btn-danger btn1">주소록</button></td>
						</tr>
						<tr class="cat1">
							<td height="50px">참조</td>
							<td></td>
							<td colspan="2"><input type="text" style="width: 100%;"></td>
							<td width="50px"><button type="button"
									class="btn btn-danger btn1">주소록</button></td>
						</tr>
						<tr class="cat1">
							<td height="50px">제목</td>
							<td><input type="checkbox">중요!</td>
							<td colspan="3"><input type="text" style="width: 100%;"></td>
						</tr>
						<tr class="cat1">
							<td height="50px">파일첨부</td>
							<td><a type="button" class="btn btn-danger btn1 toggler "
								data-prod-cat="2"
								style="background-color: lightgray; color: black; width: 25px;"><div
										class="mdi mdi-arrow-up"></div>
									<!-- <div class="mdi mdi-arrow-down">아래 아이콘</div>--></a></td>
							<td colspan="3"><button type="button"
									class="btn btn-danger btn1">파일첨부</button></td>
						</tr>
						<tr class="cat2" style="display: none">
							<td height="100px"></td>
							<td></td>
							<td colspan="3">
								<section id="upload-section" style="width: 100%; height: 100%;">
									<div class="upload-box"
										style="width: 100%; height: 100%; display: table;">
										<input class="btn-file d-none" type="file"
											style="display: none;" id="testFile" /> <span id="testFileNm"
											style="font-size: 1em; text-align: center; border: 1px solid gainsboro; width: 100%; height: 100px; display: table-cell; vertical-align: middle;">
											<div class="mdi mdi-paperclip" style="display: inline-block;"></div>이곳에
											첨부파일을 끌어오세요 또는 <a href="">파일선택</a>
										</span>
									</div>
								</section>
							</td>
						</tr>
						<tr>
							<td><textarea class="yui3-cssreset" id="summernote" name="apprContent"></textarea></td>
						</tr>
						<tr>
							<td colspan="5"><button type="submit"
									class="btn btn-danger btn1">템플릿</button>
								<button type="submit" class="btn btn-danger btn1">예약발송</button></td>
						</tr>
					</table>


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



			<script>
                $('#summernote').summernote({
                  spellCheck: true,
                  disableDragAndDrop: true,
                  codeviewFilter: false,
                  codeviewIframeFilter: true,
                  placeholder: '메일 내용을 작성해 주세요',
                  tabsize: 2,
                  height: 600,
                  toolbar: [
                      ['style', ['fontname', 'fontsize', 'bold', 'italic', 'underline', 'clear']],
                      ['color', ['color']],
                      ['para', ['ul', 'ol', 'paragraph']],
                      ['insert', ['link', 'picture', 'hr']],
                      ['view', ['fullscreen']]
                    ],
                        // 이미지 업로드하면 이벤트 발생시킴
                    onImageUpload: function(files, editor, webEitable){
                        // 이미지 개수대로 함수 sendFile 호출
                        for(var i=0; i<files.length; i++){
                            sendFile(files[i], editor, welEditable);
                        }
                    }
                    
                });

                function sendFile(file, editor, welEditable){
                    var imgUrl = 'resources/image/cy/attachment/'

                    // 파일 전송을 위한 form 생성
                    form_data = new FormData();
                    form_data.append("image", file);
                    $.ajax({
                        data: form_data,
                        type: "post",
                        url: "summernote_imageUpload.do",
                        dataType: "text",
                        cache: "false",
                        enctype: "multipart/form-data",
                        processData:"false",
                        processData: "false",
                        success: function(savename){
                            imgUrl = imgUrl + savename;
                            editor.insertImage(welEditable, imgUrl); // 에디터에 업로드된 이미지 삽입
                        },
                        error: function(){
                            alert("error");
                        }

                    })
                }
                // $(".note-editable").change( console.log( $(this).html() ) )
                
            </script>
				</div>
			</div>


			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>

</body>
</html>