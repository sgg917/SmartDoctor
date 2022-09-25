<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertchatroom</title>
</head>
<style>
	body {
		background: #f3f3f3 !important;
	}
	
	input {
		height: 40px;
	    width: 100%;
	    border-radius: 10px;
	    border: none;
	    padding: 10px;
	}
	
	table {
	    width: 80%;
   		margin: 0 auto;
	}
	
	textarea {
	    width: 100%;
	    border: none;
	    padding: 10px;
	    border-radius: 10px;
	    height: 106px;
	    resize: none !important;
	}
	

  .insertopenchatroomtitle{
        font-size: 21px;
	    margin: 30px;
	    font-weight: 600;
	    text-align: center;
   }
   
   .btn-area {
   		display:flex;
   		justify-content: center;
   		align-items: center;
   }
   
   .btn-area > button {
	    width: 77%;
   }
   
   tr > td:nth-child(1) {
   		text-align: right;
   		width: 22%;
   		font-weight:bold;
   }
   
   .form-area {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 83%;
	    width: 100%;
	    flex-direction: column;
   		
   		
   }
   
   form {
	    width: 94%;
   }
   
</style>
<body>
	<jsp:include page="chatheader.jsp"/>
	<div class="form-area">
		<h1 class="insertopenchatroomtitle">오픈채팅방 개설하기</h1>
		<form action="openchatroominsert.do" method="post" >
			<table cellpadding="8px">
				<tr>
					<td>이름</td>
					<td><input type="text" id="cm_title" name="cm_title" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" id="cm_pwd" name="cm_pwd"></td>
				</tr>
				<tr>
					<td>소개</td>
					<td><textarea id="cm_con" name="cm_con" required></textarea></td>
				</tr>
			</table>
			<div class="btn-area">
				<button type="submit" class="default-btn b-yell">방만들기</button>
			</div>
		</form>
	</div>
</body>
</html>