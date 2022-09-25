<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatroomlist</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style type="text/css">
	.chatroom {
	    display: flex;
	    align-items: center;
	    width: 100%;
	    height: 17%;
	    background: white;
	    padding: 2%;
	    border-top: 1px solid #eaeaea;
	    border-bottom: 1px solid #eaeaea;
	    margin-top: -1px;
        position: relative;
	}
	
	.header {
		border-bottom: 1px solid #eaeaea !important;
	}
	
	.cahtroomlist {
	    height: 91.5%;
	    background: aliceblue;
	    overflow-y: scroll;
	}
	
	.cahtroomlist::-webkit-scrollbar {
    	display:none;
    }
    
    body::-webkit-scrollbar {
    	display:none;
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
	
	.profile-img > img {
		height: 150%;
	}
	
	.chatroom-con {
		
	}
	
	.chatroom-con > div:nth-child(1) {
		font-size: 13px;
		color: #a7a7a7;
		font-weight: 600;
	 	
	}
	
	.chatroom-con > div:nth-child(2) {
        font-size: 14px;
	    height: 34px;
	    display: flex;
	    align-items: center;
	    width: 350px;
	}
	.chatroom-con > div:nth-child(2) > p {
		display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    width: 100%;
	    margin: 0;
	}
	
	/* body::-webkit-scrollbar {
    	display:none;
    } */
    
    .chatroom-count {
   	    position: absolute;
	    top: 34px;
	    right: 20px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
    }
    
    .chatroom-count > span:nth-child(1) {
   	    font-weight: 600;
	    font-size: 15px;
	    color: white;
	    width: 23px;
	    height: 23px;
	    border-radius: 50%;
	    background: #f93535;
	    display: flex;
	    align-items: center;
	    justify-content: center;
    }
	
</style>
</head>
<body>
	<jsp:include page="chatheader.jsp"/>

	<div class="cahtroomlist">	
		<c:forEach var="cl" items="${chroomlist}">
			<div class="chatroom chat">
				<input type="hidden" name="co_no" value="${cl.co_no }" class="co_no" id="co_no">
				<input type="hidden" name="friendid" value="${cl.id2 }" class="friendid" id="friendid">
				<div class="profile-img">
				<c:if test="${empty cl.rename_file }">
					<img src='resources/images/icons/profile_white.png'>
				</c:if>
				<c:if test="${!empty cl.rename_file }">
					<img src='resources/muploadFiles/${cl.rename_file}'>
				</c:if>
				</div>
				<div class="chatroom-con">
					<div>${cl.name }</div>
					<div class="number${cl.co_no }"><p>${cl.ol_cont }</p></div>
					<div class="chatroom-count">
					<c:if test="${ cl.count ne 0}">
						<span>${cl.count }</span>
					</c:if>
					<c:if test="${cl.count eq 0}">
					</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:forEach var="cl" items="${chroomlist2 }">
			<div class="chatroom chat">
					<input type="hidden" name="co_no" value="${cl.co_no }" class="co_no" id="co_no">
					<input type="hidden" name="friendid" value="${cl.name }" class="friendid" id="friendid">
					<div class="profile-img">
						<c:if test="${empty cl.rename_file }">
							<img src='resources/images/icons/profile_white.png'>
						</c:if>
						<c:if test="${!empty cl.rename_file }">
							<img src='${cl.rename_file}'>
						</c:if>
					</div>
					<div class="chatroom-con">
						<div>${cl.name }</div>
						<div class="number${cl.co_no }"><p>${cl.ol_cont }</p></div>
						<div class="chatroom-count">
							<c:if test="${ cl.count ne 0 }">
								<span>${cl.count }</span>
							</c:if>
							<c:if test="${cl.count eq 0}">
							</c:if>
						</div>
					</div>
			</div>
		</c:forEach>
	</div>
</body>

<script type="text/javascript">

$(function(){
$(".chat").click(function(){
	var co_no = $(this).find(".co_no").val();
	var friendid = $(this).find(".friendid").val();
	
	
	location.href="chatroomdetail.do?co_no="+co_no+"&friendid=" + friendid; 
})
	
})

//		http://localhost:8421/spring/echolist
let sock = new SockJS("<c:url value="/echolist"/>");
	sock.onmessage = onMessage;
	
	function onMessage(evt){
		var data = evt.data;
		var message = null;
		var co_no = null;
		
		
		var strArray = data.split('|');
		

		
		co_no = strArray[0];
		message = strArray[1];
		
		var $pringHTML;
		
		printHTML = "<p>"+message+"</p>";
		$(".number"+co_no).html(printHTML);
		
		var count= $(".number"+co_no).next(".chatroom-count").text();
		
		count++;
		
		var $countHTML;
		countHTML = "<span>"+count+"</span>";
		$(".number"+co_no).next(".chatroom-count").html(countHTML);
	}
	
</script>

</html>