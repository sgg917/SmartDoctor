<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- 메일상세페이지 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* ==========페이지영역========== */
    .outer{
        padding-left: 320px;
        float: left;
        width: 100%;
        min-height: 100%;
        background-color: rgba(224, 224, 224, 0.12);
    }
    .topBar {
        background-color:rgba(22, 160, 133, 0.39);
        width: 100%;
        height: 50px;
        color: white;
        font-size: 25px;
        box-sizing: border-box;
        padding-top: 10px;
        padding-left: 30px;
        font-weight: 500;
    }

    /* 서브메뉴바 영역 */
    .subMenuArea{
        background-color: white;
        width: 100%;
        height: 70px;
    }
    #subMenuList{margin: 0;list-style:none;padding-left: 0;}
    #subMenuList li{
        margin-top: 10px;
        margin-left: 20px;
        float:left;
        text-decoration-style: none;
    }
    /* 서브메뉴바 영역 */

    /* 서브메뉴바 메뉴버튼(기본) */
    .subBtn{
        border:0;
        width:150px;
        height:50px;
        font-size: 19px;
        color:rgb(127, 127, 127);
        background-color: white;
        border-radius: 25px;
    }
    .subBtn:hover{cursor: pointer;}
    /* 서브메뉴바 메뉴버튼(기본) */
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */
    .subActive{
        border:4px solid rgb(26, 188, 156);
    }
    /* 서브메뉴바 메뉴버튼(현재페이지일때) */

    /* 콘텐츠영역 */
    .contentArea {
        margin-top: 50px;
        margin-left:100px;
        width:1600px;
        height:auto;
        float:left;
    }
    /* 콘텐츠영역 */
	/* 작은버튼 스타일 */
	.smallBtn {
		width: 60px;
		height: 25px;
		border: 0px;
		border-radius: 5px;
		background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
		color: white;
		font-size: 12px;
	}
	
	.smallBtn:hover {
		cursor: pointer;
	}
	/* 작은버튼 스타일 */
	/* 큰버튼 스타일 */
	.bigBtn {
		width: 140px;
		height: 40px;
		border: 0px;
		border-radius: 5px;
		background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
		color: white;
		font-size: 18px;
	}
	
	.bigBtn:hover {
		cursor: pointer;
	}
	/* 큰버튼 스타일 */
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
		min-height:60px; 
		background-color:rgba(211, 211, 211, 0.226);
		width:80%;
	}
	.mailContentZone {
		width:80%;
	}
	.wrap {
		margin-left:-50px;
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
	}
	.infoBar tr td:nth-child(2n) {
		padding-left:20px;
		width:300px;
		text-align:left;
	}
	.onlyContent {
		min-height:300px;
		width:80%;
	}
	.contentPre {
		margin-left:10px;
	}
/* ==========페이지영역========== */
/* 파일테이블 */
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
/* 파일 첨부 관련 */
.pageNoClick{
   pointer-events: none;
    cursor: default;
}
</style>   
</head>
<body>
	<!-- 이곳에 메뉴바 include -->
	<include page="../common/navbar.jsp"/>
	<!-- 이곳에 메뉴바 include -->
	
	<div class="outer">
		<div class="topBar">
			<!-- 메뉴명 -->
			<span>사내메일</span>
		</div>
		<div class="subMenuArea">
			<ul id="subMenuList">
				<!-- 서브메뉴 버튼 영역. 기본:subBtn , 활성화시: subBtn subActive 클래스 추가해주세요 -->
				<li><button class="subBtn" onclick='location.href="list.mil?currentPage=1&mailOwn=${loginUser.empNo }"'>받은메일함</button></li>
				<li><button class="subBtn" onclick='location.href="flist.mil?currentPage=1&mailOwn=${loginUser.empNo }"'>보낸메일함</button></li>
				<li><button class="subBtn" onclick='location.href="ilist.mil?currentPage=1&mailOwn=${loginUser.empNo }"'>중요메일함</button></li>
				<li><button class="subBtn" onclick='location.href="enrollForm.mil?currentPage=1&pageFrom=detail"'>메일작성</button></li>
			</ul>
		</div>
		<div class="contentArea">
			<!-- 내용 작성 영역 입니다-->
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
					</div>
				</div>
				
				<div class="mailContentZone">
				<table class="infoBar">
					<tr>
						<td>보낸사람</td>
						<td>${e.mailFrom }@smartdoctor.com</td>
					</tr>
					<tr>
						<td>받는사람</td>
						<td>${e.mailTo }@smartdoctor.com</td>
					</tr>
					<tr>
						<td>보낸날짜</td>
						<td>${e.mailDateStr }</td>
					</tr>
				</table>
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
							<td width="65">
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
										<div class="fileWrap" style="display:none;" style="text-align:left;">
								        <div id="dropZone" style="width: 1300px; height: 100px; border: 1px solid lightgray;">
								            <table id="fileListTable" width="100%" border="0px">
								                <tbody id="fileTableTbody">
								                </tbody>
								            </table>
								        </div>
							</td>
						</tr>
					</table>
					<br><br>
				</div>
			</div>
			<br><br>
			<div id="btnArea">
				<button class="bigBtn listBtn" type="button" onclick="location.href='list.mil?currentPage=1&mailOwn=${loginUser.empNo}'">목록으로</button>
			</div>
			
			<br><br><br><br>
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
									"<td>" + "<a href='"+"${pageContext.servletContext.contextPath }/resources/uploadFiles/mail/"+list[i].changeName+"' download=" +list[i].originName+ ">"+ list[i].originName +"</a>" +"</td>" +
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