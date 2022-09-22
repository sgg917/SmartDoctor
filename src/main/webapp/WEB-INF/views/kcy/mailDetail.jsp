<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- 메일상세페이지 -->
<head>
<meta charset="UTF-8">
<title>Smart Doctor</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon-16x16.png">
<style>
.wrap11 {
		width: 100%;
		background-color: white;
		border-radius: 30px 10px;
		box-shadow: 3px 3px 3px 3px lightgray;
		text-align: center;
		height: 100%;
	}
 




    
    .contentArea {
       margin:auto;
       width:90%;
    }

	.smallBtn {
		width: 60px;
		height: 25px;
		border: 0px;
		border-radius: 5px;
		background: RGB(65, 125, 122) ; 
		color: white;
		font-size: 12px;
	}
	
	.smallBtn:hover {
		cursor: pointer;
	}

	.bigBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: RGB(65, 125, 122) ; 
		color: white;
		font-size: 18px;
	}
	
	.bigBtn:hover {
		cursor: pointer;
	}
	
	.importantIcon {
		margin:auto;
		padding-top:13px;
		padding-left:10px;
		float:left;
	}
	.attachFileList {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.titleZone {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.fileZone {
		margin:auto;
		padding-top:20px;
		padding-left:10px;
		float:left;
	}
	.mailTitleZone, .mailAttachFile {
		min-height:100px; 
		background-color:rgba(211, 211, 211, 0.226);
		width:100%;
	}
	.mailContentZone {
		width:100%;
	}
	
	#btnArea {
	margin-left: 370px;
	width: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
	}
	
	#btnArea button {
		display: inline-block;
		margin: 5px;
	}
	.infoBar {
		margin-top:7px;
		height:70px;
		font-size:12px;
		font-weight:700;
		margin-left:50px;
	}
	.infoBar tr td:nth-child(2n) {
		padding-left:20px;
		width:300px;
		text-align:left;
	}
	.onlyContent {
		min-height:300px;
		width:100%;
		text-align:left;
	}
	.contentPre {
		margin-left:10px;
	}


.fileTable {
	text-align:left;
}
.fileTable tr:nth-child(1) td:nth-child(1) b {
	margin-left:1px;
}
.fileTable tr:nth-child(1) td:nth-child(2) {
	width:25px;
}
.fileTable tr:nth-child(1) td:nth-child(2) img {
	margin-left:-10px;
	margin-top:8px;
}
.fileShow:hover {
	cursor:pointer;
}
.pageNoClick{
   pointer-events: none;
    cursor: default;
}
.wrap2{
		width:95%;
		text-align : left;
		margin:auto;
	}
</style>   
</head>
<body>
	<div class="container-scroller">
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="wrap11" style="height: 100%;">

				<div class="wrap2">
				<br><br>
				<p style="font-size: 22px;">
						메일 &nbsp;|&nbsp; <b>메일 상세</b>
					</p>
					<hr>
				
				</div>
		<div class="contentArea">
			<br>
			
			<div class="wrap">
				<table class="bas">
					<tr>
						<td id="leftArea">
							<button class="smallBtn takeReplyBtn">답장</button>&nbsp;
							<button class="smallBtn takeTransBtn" style="background:gray;">전달</button>&nbsp;
							<button class="smallBtn takeManyBtn" style="background:rgb(190, 190, 190);">삭제</button>
							<input type="hidden" name="mailNo" value="${e.mailNo }">
						</td>
					</tr>
				</table>
				<br>
				<div class="mailTitleZone">
					<div>
						<div class="importantIcon">
							<c:choose>
									<c:when test="${e.mailImportFlag eq 'Y' }">
										<img src="resources/images/star-black-48dp.svg">
									</c:when>
									<c:otherwise>
										<img src="resources/images/star_border-black-48dp.svg">
									</c:otherwise>
							</c:choose>
							
						</div>
						<div class="titleZone" name="mailTitle">${e.mailTitle }</div>
						<br><br>
					<table class="infoBar">
					<tr>
						<td>보낸사람</td>
						<td>${e.mailnameFrom } ${e.mailFrom }@smartdoctor.com</td>
					</tr>
					<tr>
						<td>받는사람</td>
						<td>${e.mailnameTo } ${e.mailTo }@smartdoctor.com</td>
					</tr>
					<tr>
						<td>보낸날짜</td>
						<td>${e.mailDateStr }</td>
					</tr>
				</table>
					</div>
				</div>
				
				<div class="mailContentZone">
				
				<div style="height:1px;"></div>
				<hr>
				<div class="onlyContent">
					<pre class="contentPre" name="mailContent">${e.mailContent }</pre>
				</div>
				<div style="height:1px;"></div>
				<hr>
				</div>
				
				<div class="mailAttachFile">
					<table class="fileTable">
						<tr>
							<td width="100">
								<b class="fileShow">첨부파일</b>
							</td>
							<td>
								<img class="fileShow"src="resources/images/save_alt.png" style="transform:translate(0,-2px) scale(0.5);" class="bigBtn fileShow">
							</td>
							<td colspan="6">
							</td>
						</tr>
						<tr>
							<td colspan="8">
										
								            <table id="fileListTable" width="100%" border="0px">
								                <tbody id="fileTableTbody">
								                </tbody>
								            </table>
								        
							</td>
						</tr>
					</table>
					<br><br>
				</div>
			</div>
			<br><br>
			<div id="btnArea">
				<button class="bigBtn listBtn" type="button" onclick="location.href='list.mil?currentPage=1&mailOwn=${loginUser.empNo}'">목록</button>
			</div>
			
			<br><br><br><br>
		</div>
	</div>
		</div>
	</div>
	</div>
	
	
	<script>
	$(document).ready(function() { 
		if('${param.pt}'=='inbox'){
			$("#subMenuList li:nth-child(1) button").attr('class', 'subBtn subActive');
		}else if('${param.pt}'=='sentbox'){
			$("#subMenuList li:nth-child(2) button").attr('class', 'subBtn subActive');
		}else if('${param.pt}'=='importbox'){
			$("#subMenuList li:nth-child(3) button").attr('class', 'subBtn subActive');
		}
	});
	
	$(".fileShow").click(function() {
		if($(".fileWrap").is(":visible")){
			$(".fileWrap").slideUp(100);
		}else {
			$(".fileWrap").slideDown(100);
		}
		$.ajax({
			url:"detailFile.mil",
			data:{mailNo:${e.mailNo}},
			success:function(list){
				var value = "";
				if(list == ""){
					value +="<tr>" +
							"<td>" + "첨부파일이 없습니다." + "</td>" +
							"</tr>";
				}else{
					for(var i in list){
						value += "<tr>" +
									"<td>" + "<a href='"+"resources/uploadFiles/mail/"+list[i].changeName+"' download=" +list[i].originName+ ">"+ list[i].originName +"</a>" +"</td>" +
								 "<tr>";
					}
				}
				console.log(value);
				$("#fileListTable tbody").html(value);
			},error:function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	
	$(".takeManyBtn").click(function(){
		 var delchk = []; // key 값을 담을 배열
			 delchk.push($(this).parent().find('input[name=mailNo]').val());
			 console.log(delchk[0]);

		 
		 location.href="delete.mil?mailNo=" + delchk + "&mailOwn=" + '${param.mailOwn}';

	})
	
	$(".takeReplyBtn").click(function(){
		location.href="replyMail.mil?mailNo="+${e.mailNo};
	});
	
	$(".takeTransBtn").click(function(){
		location.href="transMail.mil?mailNo="+${e.mailNo};
	});
	</script>
</body>
</html>