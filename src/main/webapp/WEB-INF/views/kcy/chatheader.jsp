<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatheader</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- 해더 css -->
<link rel="stylesheet" href="resources/css/ChatHeader.css">
<!-- 구글 아이콘 링크 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style>
	.allcount{
		font-weight: 600;
	    font-size: 15px;
	    color: white;
	    width: 18px;
	    height: 18px;
	    border-radius: 50%;
	    background: #f93535;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    position: absolute;
	    right: 13%;
	    top: 35%;
	}
	
</style>
</head>
<body>

<!-- header -->
<header class="header">
        <nav class="chatNav">
            <ul class = "navi-area">
                <li><a href="chatview.do">친구목록</a></li>
                
                <li class="chlist"><a onclick="chatroom()">채팅창</a></li>
                
                
                
               
        </nav>
    </header>
</body>
<script>
	let countsock = new SockJS("<c:url value="/allcountecho"/>");

	countsock.onmessage = onMessage2;

	function onMessage2(evt){
		var data = evt.data;

		
		
		var $pringHTML;
		
		if(data == 0){
			pringHTML = "<a onclick='chatroom()'>채팅창</a>";
			$(".chlist").empty();
			$(".chlist").append(pringHTML);
		}else{
		pringHTML = "<a onclick='chatroom()'>채팅창</a><span class='allcount'>"+data+"</span>";
		$(".chlist").empty();
		$(".chlist").append(pringHTML);
		}
	}
	
	function chatroom(){
 		$.ajax({
 			url:"reportcheck.do",
 			success:function(data){

 				if(data == 'Y'){
 					location.href="chatroom.do";
 				}else{
 					alert("신고된 아이디입니다. 채팅에 접속 할 수 없습니다.");
 				}
 			},
            error:function(request, status, errorData){
                alert("error code: " + request.status + "\n"
                      +"message: " + request.responseText
                      +"error: " + errorData);
           } 
 		})
	}
	
</script>
</html>