<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<style>
	body {
		background: RGB(237, 230, 214) !important;
	}

	#message{
	    height: 70%;
	    width: 71%;
	    border-radius: 5px;
	    border: none;
	    resize: none;
	    padding: 15px;
	    
	}
	
	.send-area {
		position: absolute;
   		bottom: 0;
	  	display: flex;
	    align-items: center;
	    justify-content: center;
	    width: 100%;
	    height: 22%;
	    background: #f2f2f2;
	        border-top: 1px solid #e1e1e1;
			
	}
	
	.default-btn {
		margin-left: 20px;
    	height: 70% !important;
    	background: RGB(65, 125, 122) ;
	}
	
	.tri-left {
	    height: 11px;
	    width: 11px;
	    background: #ffed95;
	    border-top: 1px solid #e8e8e8;
	    border-right: 1px solid #e8e8e8;
	    position: absolute;
	    transform: rotate(45deg);
	    right: 84px;
	}
	
	.tri-right {
	    height: 11px;
	    width: 11px;
	    background: white;
	    border-bottom: 1px solid #e8e8e8;
	    border-left: 1px solid #e8e8e8;
	    position: absolute;
	    transform: rotate(45deg);
	    left: 85px;
	}
	
	.text-con {
		max-width: 50%;
	    background: #ffed95;
	    border-radius: 10px;
	    padding: 12px;
	    font-size: 14px;
	    border: 1px solid #e8e8e8;
	    
	}
	.text-con-someone {
		width: 100%;
	    background: white;
	    border-radius: 10px;
	    padding: 12px;
	    font-size: 14px;
	    border: 1px solid #e8e8e8;
	}
	
	.chat-area {
	height: 100%;
    background: RGB(237, 230, 214);
	}
	
	.chat-area::-webkit-scrollbar {
    	display:none;
    }
	
	#chatdata {
	    display: flex;
	    align-items: center;
	    justify-content: flex-end;
	    margin-top: 10px;
	    position: relative;
	}
	
	.profile-img {
		width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    margin: 0 20px;
	    overflow: hidden;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.left{
		justify-content: flex-start !important;
	}
	
	.roomtitle{
        font-size: 17px;
	    padding: 10px;
	    font-weight: 600;
	}
	
	.title-area {
		background: white;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-bottom: 1px solid #ececec;
	    border-top: 1px solid #ececec;
	    position: relative;
	}
	
	.title-area > div:nth-child(1) {
	    position: absolute;
	    left: 4%;
	    font-weight: 900;
	    font-size: 25px;
	    margin-top: -6px;
	}
	
	.member-count {
		    font-size: 14px;
    position: absolute;
    right: 4%;
    display: flex;
    align-items: center;
    top: 2%;
    width: 44px;
    height: 44px;
	}
	
	.profile-img > img {
		height: 150%;
	}
	
	.member-list {
	   	position: absolute;
	    right: 20px;
	    top: 43px;
	    padding-left: 0;
	    background: lightblue;
	    align-items: center;
	    z-index: 1;
	    list-style: none;
	    font-size: 14px;
	    box-shadow: 1px 1px 14px -6px #808080;
	    opacity:0;

	}
	
	.member-count-area:hover > .member-list {
		opacity:1;
	}
	
	.member-count-area:hover li {
		height:100%;
	}
	
	.member-list li {
		padding: 5px 10px;
	    background: white;
	    margin-top: -1px;
	    border: 1px solid #ececec;
	    height: 0;

	}
	
	.member-list li:hover {
		background: #FBD14B;
		

	}
	
	.big-area {
        border-bottom: 10px solid RGB(237, 230, 214);
	    height: 61%;
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    overflow-y: scroll;
	    background: #f2f2f2;
	}
	
	.big-area::-webkit-scrollbar {
    	display:none;
    }
    
    .text-con-area {
   	       max-width: 50%;
    }
    
    .text-con-area > div:nth-child(1) {
   	    font-size: 13px;
	    color: gray;
	    font-weight: 600;
    }
	
	#ol_yn{
	    width: 100%;
	    display: flex;	    
	    align-items: center;
	    justify-content: center;
	    font-size: 13px;
	    background: #f3f3f3;
	    margin: 10px 0;
	}
	.modal-filetransfer{
	    position: absolute;
	    top: -40px;
	    left: 10px;
	    background: white;
	    width: 30px;
	    border: 1px solid gray;
	    height: 30px;
	    border-radius: 50%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    cursor: pointer;
	}
	/*모달*/
	
	.modal {
		padding-right:0 !important;
	}
	 .modal-content{
	 	height: 325px;
	    width: 85% !important;
		position: auto;
		top:50%;
		left:50%;
		transform:translate(-52%,50%);
	    display: flex;
	    align-items: center;
	    padding: 40px; 
	}
		.modal-preview{
		width: 150px;
	    height: 150px;
	    border-radius: 10%;
	    overflow: hidden;
	    display: flex;
	    align-items: center;
	    justify-content: center;
		}
		.modal-area{
		height: 325px;
	    width: 65% !important;
	    position: auto;
	    top: 50%;
	    left: 50%;
	    transform: translate(-52%,50%);
	    display: flex;
  		align-items: center;
		justify-content: center;	
	    padding: 40px;
		}
		.img-message{
		width: 100%;
	    height: 100%;
		}
		.Toback{
		cursor: pointer;
		}
</style>
<body>
	<jsp:include page="chatheader.jsp"/>
	
	<div class="title-area">
		<div class="Toback">
			<
		</div>	
		<div class="roomtitle ble">
		 	${friendName }
		 <input type="hidden" name="friendid" value="${friendid }" class="friendid" id="friendid">
		</div>
	</div>
		
<div class="big-area">
	<div class="chat-area">
	<c:forEach var="cl" items="${chlist }">
		<c:if test="${cl.id eq loginUser.empNo }">
			<div id="chatdata">
				<c:if test="${!empty cl.ol_img}">
					<c:if test="${fn:contains(cl.ol_img,'jpg') || fn:contains(cl.ol_img,'png') || fn:contains(cl.ol_img,'jpeg') || fn:contains(cl.ol_img,'bmp')
					 				|| fn:contains(cl.ol_img,'gif')|| fn:contains(cl.ol_img,'JPG') || fn:contains(cl.ol_img,'PNG') || fn:contains(cl.ol_img,'JPEG') || fn:contains(cl.ol_img,'BMP')
					 				|| fn:contains(cl.ol_img,'GIF')}">
					 	<div class="text-con"><img src='resources/cuploadFiles/${cl.ol_img }' class='img-message'></div>
					 				</c:if>
					 <c:if test="${!(fn:contains(cl.ol_img,'jpg') || fn:contains(cl.ol_img,'png') || fn:contains(cl.ol_img,'jpeg') || fn:contains(cl.ol_img,'bmp')
					 				|| fn:contains(cl.ol_img,'gif') || fn:contains(cl.ol_img,'JPG') || fn:contains(cl.ol_img,'PNG') || fn:contains(cl.ol_img,'JPEG') || fn:contains(cl.ol_img,'BMP')
					 				|| fn:contains(cl.ol_img,'GIF'))}">					 				
					 	<div class="text-con"><a class='downloadmsg' href='resources/cuploadFiles/${cl.ol_img }' download><span class='material-icons' style='width: 100%; height: 100%; font-size: 50px; color:#2860E1;'>save</span></a></div>
					 				</c:if>
				</c:if>
				<c:if test="${empty cl.ol_img}">
					<div class="text-con"><span>${cl.ol_cont }</span></div>
				</c:if>
				<div class="tri-left"></div>
				
			</div>
		</c:if>
		<c:if test="${cl.id ne loginUser.empNo }">
			 <c:if test="${cl.ol_yn eq 'N'}">
				<div id="ol_yn"></div>
			 </c:if>
		<div id="chatdata" class="left">	<!--  받는사람한테 class="left" 추가 -->
			
			
			<div class="tri-right"></div>
			<div class="text-con-area">
				<div>${cl.name }</div>
				<div class="text-con-someone">
					<c:if test="${!empty cl.ol_img }">
						<c:if test="${fn:contains(cl.ol_img,'jpg') || fn:contains(cl.ol_img,'png') || fn:contains(cl.ol_img,'jpeg') || fn:contains(cl.ol_img,'bmp')
					 				|| fn:contains(cl.ol_img,'gif') || fn:contains(cl.ol_img,'JPG') || fn:contains(cl.ol_img,'PNG') || fn:contains(cl.ol_img,'JPEG') || fn:contains(cl.ol_img,'BMP')
					 				|| fn:contains(cl.ol_img,'GIF')}">
					 			<img src='resources/cuploadFiles/${cl.ol_img }' class='img-message'>			
					 	</c:if>
						<c:if test="${!(fn:contains(cl.ol_img,'jpg') || fn:contains(cl.ol_img,'png') || fn:contains(cl.ol_img,'jpeg') || fn:contains(cl.ol_img,'bmp')
					 				|| fn:contains(cl.ol_img,'gif') || fn:contains(cl.ol_img,'JPG') || fn:contains(cl.ol_img,'PNG') || fn:contains(cl.ol_img,'JPEG') || fn:contains(cl.ol_img,'BMP')
					 				|| fn:contains(cl.ol_img,'GIF'))}">	
					 			<a class='downloadmsg' href='resources/cuploadFiles/${cl.ol_img }' download><span class='material-icons' style='width: 100%; height: 100%; font-size: 50px; color: #2860E1;'>save</span></a>
					 	</c:if>
					</c:if>
					<c:if test="${empty cl.ol_img }">
						${cl.ol_cont }
					</c:if>
				</div>
			</div>
		</div>
		
		</c:if>
	</c:forEach>
		
	</div>
</div>


	<div class="send-area">
		<div class="modal-filetransfer">
			<label for="file_transfer" style="position: absolute; bottom: 0px; display: flex; align-items:center; justify-content: center; margin: 0; cursor: pointer;">
				<span class="material-icons">
					attach_file
				</span>
			</label>
			<input type="file" style="display:none;" id="file_transfer" name="file_transfer" class="file_transfer" onchange="uploadPhoto(this);">
		</div>
	
		<textarea id="message" name="message"></textarea>
		<input type="button" id="sendBtn" class="default-btn" value="전송"/>
			<input type="hidden" value="${loginUser.empName }" id="loginuser" name="loginuser">
			<input type="hidden" value="${co_no }" id="co_no" name="co_no">
	</div>
	
	
	<div class="modal fade" id="modal">
	<div class="modal-dialog">
	 	<div class="modal-content modal-area">
			<div class="modal-preview">
				<!-- <img id="modal-img" height="110%"> -->
			</div>
			<div class="button-area" style="margin-top: 10px;">
				<button class="default-btn b-yell transfer" style="height:40px !important; margin:0;">전송하기</button>
			</div>
	 	</div>
	</div>
</div>
	
	
	
	
	
</body>


<script type="text/javascript">
	var imgname;

	//파일 업로드
		    function uploadPhoto(value) {
		    	 
			if(value.files && value.files[0]) {
				
				var reader = new FileReader();
			
				reader.onload = function(e) {
					var filename = $("#file_transfer").val().split('/').pop().split('\\').pop();
				
					
					console.log("filename : " + filename)
					if((filename.indexOf("jpg") != -1) || (filename.indexOf("png") != -1)
							|| (filename.indexOf("jpeg") != -1) || (filename.indexOf("bmp") != -1)
							|| (filename.indexOf("gif") != -1) || (filename.indexOf("JPG") != -1) || (filename.indexOf("PNG") != -1)
							|| (filename.indexOf("JPEG") != -1) || (filename.indexOf("BMP") != -1)
							|| (filename.indexOf("GIF") != -1)){
						
						var $printHTML;
						printHTML ="<img id='modal-img' height='110%'>"
							$(".modal-preview").html('');
						
						$(".modal-preview").append(printHTML);
						$("#modal-img").attr("src", e.target.result);
					}else{
						$("#modal-img").attr("display", "none");
						var $printHTML;
						printHTML = "<span class='material-icons' style='width: 100%; height: 100%; font-size: 150px; color: white; background-color: #2860E1;'>save</span>"
							$(".modal-preview").html('');
						$(".modal-preview").append(printHTML);
					}
					
					//chk
					
					var filename = $("#file_transfer").val().split('/').pop().split('\\').pop();
				
					//$(".upload-name").val("");
					//$(".upload-name").val(filename);
				}
				//jpg ,png, jpeg ,bmp,gif
				reader.readAsDataURL(value.files[0]);
			}
			
			
			
			$("#modal").modal();
	    }
	
	//스크롤 위치고정.
	$(document).ready(function() {

		var $printHTML;
		
		printHTML = "<span>여기까지 읽으셨습니다.</span>";
		
		$("#ol_yn").append(printHTML);
		
		var ol_yn = $("#ol_yn").val();
		//값이있을시에 위치고정
		if(ol_yn != null){
		var offset = $("#ol_yn").offset();
		var location = $(".big-area").offset();

		$(".big-area").animate({scrollTop:(offset.top - location.top)},1000);
		}
		//없을시에.
		else{
			$(".big-area").scrollTop($(".big-area")[0].scrollHeight);
		}
	});
	
	
	let sock = new SockJS("<c:url value="/echo"/>"); 	//웹소켓 연결 - sevlet-context에서 웹소켓 핸들러
	
	//WebSocket하고 연결될떄 실행됨
	//sock.onopen = onOpen;
	//websocket 에서 메세지를 받을떄 실행되는 메소드
	sock.onmessage = onMessage;
	//websocket 과 연결이 끊길때 실행하는 메소드
	sock.onclose = onClose;
	
	let sock2 = new SockJS("<c:url value="/echolist"/>");
	

	
	
	
	$(".transfer").click(function(){
		var files = $("input[name=file_transfer]:file")[0].files;
		var fileReader = new FileReader();
		
		var data =  new FormData();
		if(files.length >0){
		data.append("file",files[0]);
		}else{
			formData.append('files',null); // 파일이 존재하지 않을 때
		}
		
		
		$.ajax({
			type : 'post',
			url : 'filesaves.do',
			data : data,
			processData: false,
			contentType: false,
			success : function(data){

				var imgname = data;
				
				var msgData = {
						user_id : $("#loginuser").val(),
						co_no : $("#co_no").val(),
						img : "${loginUser.path}",
						msg : "파일",
						filename : imgname
					};
				
				var msgData2 ={
						friendid : $("#friendid").val(),
						co_no : $("#co_no").val(),
						msg : "파일",
						
				};		
			
				
				var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
				var jsonData2 = JSON.stringify(msgData2);
				sock.send(jsonData);
				sock2.send(jsonData2);
			},
            error:function(request, status, errorData){
                alert("error code: " + request.status + "\n"
                      +"message: " + request.responseText
                      +"error: " + errorData);
           } 
		})
		
		$("#modal").modal('toggle');
	})
	
	
	//메세지 전송버튼 클릭 메소드
	$("#message").keypress(function(event) {
		if (event.which == 13) {
			$("#sendBtn").click();
			return false;
		}
	});

	$("#sendBtn").click(function() {
		sendMessage();

		$("#message").val('');
	});
	        
	//메세지 전송 메소드
	function sendMessage() {
		var friendid = $("#friendid").val();

		var user = $("#loginuser").val();
		
		var msgData = {
			user_id : $("#loginuser").val(),
			co_no : $("#co_no").val(),
			msg : $("#message").val(),
			img : "${loginUser.path}"
		};
		
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);
		var msgData2 ={
				friendid : $("#friendid").val(),
				co_no : $("#co_no").val(),
				msg : $("#message").val(),
				
		};
		
		var jsonData2 = JSON.stringify(msgData2);
		sock2.send(jsonData2);
		
		

		
	}          
	
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var co_no = null;

		
		if(data.indexOf("count") != -1){
			allcount(data);
			return;
		}
		//문자열을 splite//
		 var strArray = data.split('|'); 
		

		if(strArray.length == 5){
			imgMessage(strArray);
			return;
		}
		
		//current session id//
		var currentuser_session = $("#loginuser").val();

		var current_co_no = $("#co_no").val();
		
		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		co_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		img = strArray[3];	//이미지
		var $printHTML;
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if(sessionid == currentuser_session){
			var check ="${loginUser.path}";
			if(check == ""){
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'>"
					+ "</div>" + "</div>";
			}else{
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.path}'>"
					+ "</div>" + "</div>";
				
				
			}
			$(".chat-area").append(printHTML);
		} else{
			if(img ==""){
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>";
					+"</div>";
				
			}else{
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/"+img+"'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>";
					+"</div>";
				
			}
			$(".chat-area").append(printHTML);
		}
		
		$(".big-area").scrollTop($(".big-area")[0].scrollHeight);
		
		var msgData3 ={
				friendid : $("#friendid").val(),
				count : "countup"
		};
		
		var jsonData3 = JSON.stringify(msgData3);
		countsock.send(jsonData3);
	  	/* sock.close(); */
	}
	    
	
	function onClose(evt){
		$("#data").append("연결 끊김");
	}  
	
	$(function() {
		$(".Toback").click(function() {
			location.href = "chatroom.do";
		})
	})
	
	
	function imgMessage(strArray){
		//current session id//
		var currentuser_session = $("#loginuser").val();

		var current_co_no = $("#co_no").val();

		
		co_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		img = strArray[3];	//이미지
		filename = strArray[4];
		var $printHTML;

		
		if(sessionid == currentuser_session){
			
			if((filename.indexOf("jpg") != -1) || (filename.indexOf("png") != -1)
					|| (filename.indexOf("jpeg") != -1) || (filename.indexOf("bmp") != -1)
					|| (filename.indexOf("gif") != -1) || (filename.indexOf("JPG") != -1) || (filename.indexOf("PNG") != -1)
					|| (filename.indexOf("JPEG") != -1) || (filename.indexOf("BMP") != -1)
					|| (filename.indexOf("GIF") != -1)){
				
			var check ="${loginUser.path}";
			if(check == ""){
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ "</span><img src='resources/cuploadFiles/"+filename+"' class='img-message'></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'>"
					+ "</div>" + "</div>";
			}else{
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ "</span><img src='resources/cuploadFiles/"+filename+"' class='img-message'></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.path}'>"
					+ "</div>" + "</div>";
				
				
			}
			}else{
				
				var check ="${loginUser.path}";
				if(check == ""){
					printHTML = "<div id='chatdata'>"
						+ "<div class='text-con'><span>"
						+ "</span><a class='downloadmsg' href='resources/cuploadFiles/"+filename+"' download><span class='material-icons' style='width:100%; height:100%; font-size:50px; color:#2860E1;'>save</span></a></div>"
						+ "<div class='tri-left'></div>"
						+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'>"
						+ "</div>" + "</div>";
				}else{

	
					printHTML = "<div id='chatdata'>"
						+ "<div class='text-con'><span>"
						+ "</span><a class='downloadmsg' href='resources/cuploadFiles/"+filename+"' download><span class='material-icons' style='width:100%; height:100%; font-size:50px; color:#2860E1;'>save</span></a></div>"
						+ "<div class='tri-left'></div>"
						+ "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.path}'>"
						+ "</div>" + "</div>";				
				}
				
			}
			$(".chat-area").append(printHTML);
		} else{
			if((filename.indexOf("jpg") != -1) || (filename.indexOf("png") != -1)
					|| (filename.indexOf("jpeg") != -1) || (filename.indexOf("bmp") != -1)
					|| (filename.indexOf("gif") != -1) || (filename.indexOf("JPG") != -1) || (filename.indexOf("PNG") != -1)
					|| (filename.indexOf("JPEG") != -1) || (filename.indexOf("BMP") != -1)
					|| (filename.indexOf("GIF") != -1)){
			if(img ==""){
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"
					+"<img src='resources/cuploadFiles/"+filename+"' class='img-message'></div>"
					+"</div>";
				
			}else{
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/"+img+"'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"
					+"<img src='resources/cuploadFiles/"+filename+"' class='img-message'></div>"
					+"</div>";
				
			}
			}else{
				if(img ==""){
					printHTML = "<div id='chatdata' class='left'>"
						+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'></div>"
						+ "<div class='tri-right'></div>"
						+"<div class='text-con-area'>"
						+"<div>" + sessionid+"</div>"
						+"<div class='text-con-someone'>"
						+"<a class='downloadmsg' href='resources/cuploadFiles/"+filename+"' download><span class='material-icons' style='width:100%; height:100%; font-size:50px; color:#2860E1;'>save</span></a>"
						+"</div>";
					
				}else{
					printHTML = "<div id='chatdata' class='left'>"
						+ "<div class='profile-img'><img src='resources/muploadFiles/"+img+"'></div>"
						+ "<div class='tri-right'></div>"
						+"<div class='text-con-area'>"
						+"<div>" + sessionid+"</div>"
						+"<div class='text-con-someone'>"
						+"<a class='downloadmsg' href='resources/cuploadFiles/"+filename+"' download><span class='material-icons' style='width:100%; height:100%; font-size:50px; color:#2860E1;'>save</span></a>"
						+"</div>";
					
				}
				
			}
			$(".chat-area").append(printHTML);
		}
		var msgData3 ={
				friendid : $("#friendid").val(),
				count : "countup"
		};
		
		var jsonData3 = JSON.stringify(msgData3);
		countsock.send(jsonData3);
		$(".big-area").scrollTop($(".big-area")[0].scrollHeight);
	}
	
	function allcount(data){

		var count = data.substr(5);
		
		var $pringHTML;
		
		if(count == 0){
			pringHTML = "<a onclick='chatroom()'>채팅창</a>";
			$(".chlist").empty();
			$(".chlist").append(pringHTML);
		}else{
		pringHTML = "<a onclick='chatroom()'>채팅창</a><span class='allcount'>"+count+"</span>";
		$(".chlist").empty();
		$(".chlist").append(pringHTML);
		}
	}
</script>

</html>