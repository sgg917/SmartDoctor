<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		background: aliceblue !important;
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
	    background: #f3f3f3;
	        border-top: 1px solid #e1e1e1;
			
	}
	
	.default-btn {
		margin-left: 20px;
    	height: 70% !important;
    	background: #ffed95;
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
	/*이게머지?*/
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
    background: aliceblue;
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
	   	<c:if test="${loginUser.id eq openchat.cm_id }">
	   	right: 55px;
	   	</c:if>
	   	<c:if test="${loginUser.id ne openchat.cm_id }">
	   	right: 20px;
	   	</c:if>
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
        border-bottom: 10px solid aliceblue;
	    height: 61%;
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    overflow-y: scroll;
	    background: aliceblue;
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
	.modal-nickname{
		text-align: center;
    	margin-top: 10px;
	}
	.modal-profile{
		width: 150px;
	    height: 150px;
	    border-radius: 10%;
	    overflow: hidden;
	    display: flex;
	    align-items: center;
	    justify-content: center;
		}
	.report{
		margin-left: 0;
	    height: 40px !important;
	    background: #ffed95;
	    margin-top: 10px;
	}
	.comunication{
		margin-left: 0;
	    height: 40px !important;
	    background: #ffed95;
	    margin-top: 10px;
	}
	.report-content{
		height: 380px;
	    width: 85% !important;
	    position: auto;
	    top: 25%;
	    left: 50%;
	    transform: translate(-52%,22%);
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    padding: 35px;
	
	}
	
	.report-table {
		color:#484848;
		font-size:14px;
	}
	
	.report-table td {
		padding:5px;
	}
	
	.report-table tr td:nth-child(1) {
		font-size:14px;
		font-weight:bold;
	    width: 90px;
	}
	
	.report-table tr td:nth-child(2) {
		padding-left:24px;
		width: 230px;
	}
	
	.reportoption5 {
	    resize: none;
	    border: 1px solid gray;
	    background: #f3f3f3;
	    border-radius: 8px;
	    width: 200px;
	    height: 100px;
	}
	
	.reportoption {
	    height: 33px;
	    border: 1px solid gray;
	    background: #f3f3f3;
	    border-radius: 8px;
	    font-size: 14px;
	    color:#484848;
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
	    padding: 40px;
	}
	.reportsubmit{
		margin-left: 0;
	    height: 40px !important;
	    background: #ffed95;
	    margin-top: 10px;
	}
	.delete{
		color: crimson;
	    font-size: 22px;
	    position: absolute;
	    right: 0%;
	    display: flex;
	    align-items: center;
	    top: 22%;
	    width: 44px;
	    height: 44px;
	}
	.delete-area:hover{
	 	cursor: Pointer;
	}
	.admin{
		right:10% !important;
	}
	.Toback{
	cursor: pointer;
	}
</style>
<body>
	
	<jsp:include page="../common/chatheader.jsp"/>
	<div class="title-area">
		<div class="Toback">
			<
		</div>	
		<div class="roomtitle ble">
			${openchat.cm_title}                 
		</div>
		<div class="member-count-area">
			<div class="member-count">
				<span class="material-icons">group</span>&nbsp; <a class="listcount"></a>
			</div>
			<ul class="member-list">
			</ul>
		</div>
		<c:if test="${loginUser.id eq openchat.cm_id }">
			<div class="delete-area">
			<span class="material-icons delete">
				cancel
			</span>
			</div>
		</c:if>
	</div>
	
	<div class="big-area">
		<div class="chat-area">
		<c:forEach var="cl" items="${chatlist }">
			<c:if test="${cl.id eq loginUser.id}">
			<div id="chatdata">
				<div class="text-con"><span>${cl.ml_cont }</span></div>
				<div class="tri-left"></div>
				<div class="profile-img">
				<c:if test="${!empty loginUser.rename_file }">
				<img src='resources/muploadFiles/${loginUser.rename_file}'>
				</c:if>
				
				<c:if test="${empty loginUser.rename_file }">
				<img src='resources/images/icons/profile_white.png'>
				</c:if>
				</div>
			</div>
			</c:if>
			<c:if test="${cl.id ne loginUser.id}">
				<div id="chatdata" class="left">	<!--  받는사람한테 class="left" 추가 -->
				<div class="profile-img">
				<c:if test="${empty cl.rename_file }">
				<img src='resources/images/icons/profile_white.png'>
				</c:if>
				<c:if test="${!empty cl.rename_file }">
				<img src='resources/muploadFiles/${cl.rename_file}'>
				</c:if>
				</div>
					<div class="tri-right"></div>
				<div class="text-con-area">
					<div class="text-nickname">${cl.empName }</div>
					<div class="text-con-someone">${cl.ml_cont }</div>
					<input type="hidden" value="${cl.id }" name="chatid" class="chatid">
				</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
	</div>
		<div class="send-area">
			<textarea id="message"></textarea>
			<input type="button" id="sendBtn" class="default-btn" value="전송"/>
				<input type="hidden" value="${loginUser.empName }" id="loginusernickname">
				<input type="hidden" value="${cm_no }" id="cm_no">
				<input type="hidden" value="${loginUser.empNo }" id="loginuser">
		</div>

<div class="modal fade" id="modal">
	<div class="modal-dialog">
	 	<div class="modal-content modal-area">
			<div class="modal-profile">
				<img id="modal-img" height="110%">
			</div>
				<div class="modal-nickname"></div>
			<div class="button-area">
				<button class="default-btn b-yell report">신고하기</button>
<!-- 				<button class="default-btn b-yell comunication">대화하기</button> -->
			</div>
	 	</div>
	</div>
</div>

<div class="modal fade" id="report-modal">
	<div class="modal-dialog">
		<div class="modal-content report-content">
		<table class="report-table" cellpadding="5">
			<tr>
			<td>신고자</td>
				<td>${loginUser.id }</td>
			</tr>
			<tr>
				<td>신고대상자</td>
				<td class="reporteduser"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td class="reportcontent"></td>
			</tr>
			<tr>
				<td>신고항목</td>
				<td><select id="reportoption" name="reportoption" class="reportoption">
                   <option class="reportoption" value="욕설/비방">욕설/비방</option>
                   <option class="reportoption" value="음란물 유포">음란물 유포</option>
                   <option class="reportoption" value="금전요구">금전요구</option>
                   <option class="reportoption" value="성희롱">성희롱</option>
                   <option class="reportoption" value="기타">기타</option>
              </select></td>
             </tr>
            <tr id="text-area">
			</tr>
		</table>
			<button class="default-btn b-yell reportsubmit">신고하기</button>
			
	</div>
</div>

</body>



<script type="text/javascript">
//방장일시 css 수정
$(document).ready(function(){
	var loginUser = "${loginUser.id}";
	var cm_id = "${openchat.cm_id}";
	if(loginUser == cm_id){
		$(".member-count").addClass("admin");
	}
})


	//웹소켓 연결 - sevlet-context에서 웹소켓 핸들러
	let sock = new SockJS("<c:url value="/echoroom"/>"); 
	
	//WebSocket하고 연결될떄 실행됨
	sock.onopen = onOpen;
	//websocket 에서 메세지를 받을떄 실행되는 메소드
	sock.onmessage = onMessage;
	//websocket 과 연결이 끊길때 실행하는 메소드
	sock.onclose = onClose;
	
	
	//연결될시 시작되는 메소드
 	function onOpen(){
		var msgData = {
				user_id : "${loginUser.empName}",
				cm_no : $("#cm_no").val(),
				msg : "입장하셨습니다.",
				join : "join",
		};
		
		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);    
	} 
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
		var user = $("#loginuser").val();
		var msgData = {
			user_id : $("#loginuser").val(),
			cm_no : $("#cm_no").val(),
			msg : $("#message").val(),
			img : "${loginUser.rename_file}"
		};
		//websocket으로 메시지를 보내겠다.
		var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);
	
	}

	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt) { //변수 안에 function자체를 넣음.
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var cm_no = null;
		//문자열을 splite//
		var strArray = data.split('|');

		if(strArray.length ==1){
			getout(strArray);
			return;
		}
		
		if (strArray.length == 6) {
			memberList(strArray);
			return;
		}


		//current session id//
		var currentuser_session = $("#loginusernickname").val();

		var current_cm_no = $("#cm_no").val();


		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		cm_no = strArray[0];
		sessionid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		message = strArray[2]; //현재 메세지를 저장//
		img = strArray[3];
		loginid = strArray[4]; 
		var $printHTML;
		
		//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
		if (sessionid == currentuser_session) {
			var check = "${loginUser.rename_file}";
			if(check == "" ){
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'>"
					+ "</div>" + "</div>";
				//여기
			}else{
				printHTML = "<div id='chatdata'>"
					+ "<div class='text-con'><span>"
					+ message
					+ "</span></div>"
					+ "<div class='tri-left'></div>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/${loginUser.rename_file}'>"
					+ "</div>" + "</div>";
				
			}
			$(".chat-area").append(printHTML);
		} else {
			
			if(img == ""){
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/images/icons/profile_white.png'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>"
					+ "<input type='hidden' value="+loginid+" name='chatid' class='chatid'>"
					+"</div>"+"</div>";
				
			}else{
				printHTML = "<div id='chatdata' class='left'>"
					+ "<div class='profile-img'><img src='resources/muploadFiles/"+img+"'></div>"
					+ "<div class='tri-right'></div>"
					+"<div class='text-con-area'>"
					+"<div>" + sessionid+"</div>"
					+"<div class='text-con-someone'>"+message+"</div>"
					+ "<input type='hidden' value="+loginid+" name='chatid' class='chatid'>"
					+"</div>"+"</div>";
			}
			
				
			$(".chat-area").append(printHTML);
		}

		$(".big-area").scrollTop($(".big-area")[0].scrollHeight);

		/* sock.close(); */
	}

	function onClose(evt) {
		var msgData = {
			user_id : "${loginUser.empName}",
			cm_no : $("#cm_no").val(),
			msg : "퇴장하셨습니다.",
			out : "out"
		};
		var jsonData = JSON.stringify(msgData);	//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
		sock.send(jsonData);
	}

	
	function memberList(strArray) {


		var currentuser_session = $("#loginuser").val();

		var current_cm_no = $("#cm_no").val();


		//String jsonStr2 = co_no + "|" +loginid+ "|" + mapReceive.get("msg");	
		var cm_no = strArray[0];
		var connectid = strArray[1]; //현재 메세지를 보낸 사람의 세션 등록//
		var message = strArray[2]; //현재 메세지를 저장//
		var joinORout = strArray[3];


		var connectidArray = connectid.split(',');


		var $printHTML;
		var count;
		var string = "";

		for (var i = 0; i < connectidArray.length - 1; i++) {

			string += "<li class="+connectidArray[i]+">" + connectidArray[i]
					+ "</li>";

		}
		printHTML = string;
		$(".member-list").html("");
		$(".member-list").append(printHTML);

		count = $(".member-list").find("li").length;


		$(".listcount").html(count);
		
		
	}

	$(function() {
		$(".Toback").click(function() {
	//어쩌징..
			var cm_no = $("#cm_no").val()
			location.href = "openchatroom.do";
			//location.href = "openchatroomout.do?cm_no=" + cm_no;
		})
	})
	
	//신고 옵션 기타일떄 텍스트 띄우기
	$("#reportoption").change(function(){
		var name = $(this).val();
		if(name == "기타"){//<textarea class="reportoption5" rows="" cols=""></textarea>
			
			document.getElementById("text-area").innerHTML="<td>내용입력 : </td><td><textarea class='reportoption5'></textarea></td>";
		}else{
			document.getElementById("text-area").innerHTML="";
		}
	})
	
	//스크롤 위치 고정
	$(document).ready(function(){
		$(".big-area").scrollTop($(".big-area")[0].scrollHeight);
	})
	
	//모달
		var nickname = "";
		var content ="";
		var chatid ="";
		var src ="";
		
		$(document).on("click",".profile-img",function(){
			 src =$(this).find("img").attr('src');
			$("#modal-img").attr("src", src);
			
			 nickname = $(this).siblings(".text-con-area").find(".text-nickname").html();
			$(".modal-nickname").html(nickname);
			
			 content =$(this).siblings(".text-con-area").find(".text-con-someone").html();

			
			 chatid = $(this).siblings(".text-con-area").find("input[name='chatid']").val();
			
			if(chatid == null){
				return;
			}

			$("#modal").modal();
			
		})
		
		//신고버튼 누를시..모달교체
			$(".report").click(function(){

				$(".reporteduser").html(nickname);
				$(".reportcontent").html(content);
				$("#modal").modal('toggle');
				$("#report-modal").modal();
			})
			
			
			//신고 접수
			$(".reportsubmit").click(function(){
				var option = $(".reportoption").val();

				
				if(option == "기타"){
					option =$(".reportoption5").val();
				}
				console.log("chatid : " + chatid + "content : " +content + "option : " + option);
				
				
				$.ajax({
					url:"report.do",
					data:{chatid:chatid,content:content,option:option},
					success:function(data){
						alert(data);
					},
		            error:function(request, status, errorData){
		                alert("error code: " + request.status + "\n"
		                      +"message: " + request.responseText
		                      +"error: " + errorData);
		           } 
				}) 
				$("#report-modal").modal('toggle');
			})
	
	
	//방폭파.
	$(function(){
		$(".delete").click(function(){
			var cm_no=$("#cm_no").val();
			if(confirm("정말로 삭제하시겠습니까?")){
			var msgData = {
					cm_no : $("#cm_no").val(),
					deletemsg : "openchatroom.do"
				};
				//websocket으로 메시지를 보내겠다.
				var jsonData = JSON.stringify(msgData);//JSON.stringify란 자바스크립트의 값을 JSON 문자열로 변환한다. 
				sock.send(jsonData);		
			}else{
				return false;
			}
		})
	})
	
	function getout(data){
		var cm_no=$("#cm_no").val();

		location.href="openchatroomdelete.do?cm_no="+cm_no;
	}
	
	
</script>
</html>