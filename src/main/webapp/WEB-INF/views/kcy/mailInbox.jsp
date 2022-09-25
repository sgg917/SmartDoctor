<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- 받은메일함 페이지 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap11 {
		width: 100%;
		background-color: white;
		border-radius: 30px 10px;
		box-shadow: 3px 3px 3px 3px lightgray;
		text-align: center;
		height: 100%;
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



    
    /* 콘텐츠영역 */
    .contentArea {
       margin:auto;
       width:90%;
    }


/* 중간버튼 스타일 */
.middleBtn {
	width: 90px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	background: rgb(26, 188, 156); /* 회색 : rgb(190, 190, 190) */
	color: white;
	font-size: 15px;
}

.middleBtn:hover {
	cursor: pointer;
}


.searchBar>select {
	height: 36px;
	width: 70px;
	border: 1px solid lightgray;
	border-radius: 3px;
	font-family: inherit;
	display: inline-block;
	vertical-align: top;
}

.searchBar>input {
	padding: 5px;
	width: 220px;
	height: 25px;
	border: 1px solid lightgray;
	border-radius: 3px;
}

.searchBar>svg {
	fill: rgb(26, 188, 156);
	width: 37px;
	display: inline-block;
	vertical-align: bottom;
	height: 100%;
}

.searchBar>svg:hover {
	cursor: pointer;
	opacity: 70%;
}

.bas {
	width: 1400px;
	height: 50px;
}
#leftArea {
	text-align: left;
}
#rightArea {
	text-align: right;
}






.boardTable, .boardTable th, .boardTable td {
	border-width: 1px 0;
	border-collapse: collapse;
	text-align: center;
	font-size: 16px;
}

.boardTable th {
	background-color: #f2f2f2;
	color: black;
	height: 35px;
}

.boardTable td {
	border-color: lightgray;
	border-style: solid;
	height: 35px;
}

.boardTable tr:hover td {
	background-color: #f2f2f2;
	cursor: pointer;
}



.importbox {
	display:none;
}

.mailTable tr td label img, .mailTable tr th label img {
	 margin-top:3.5px;
}

.mailTable{	
	width:100%;
}

[data-tooltip-text]:hover {
	position: relative;
}

[data-tooltip-text]:hover:after {
	background-color: #000000;
	background-color: rgba(0, 0, 0, 0.8);

	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);

	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;

	color: #FFFFFF;
	font-size: 12px;
	content: attr(data-tooltip-text);

  margin-bottom: 10px;
	top: 130%;
	left: 0;    
	padding: 7px 12px;
	position: absolute;
	width: 150px;
	min-width: 100px;
	max-width: 300px;
	word-wrap: break-word;

	z-index: 9999;
}

.wrap2{
		width:95%;
		text-align : left;
		margin:auto;
	}
	
	
.pagingBar {
	list-style: none;
	margin-left: 400px;
}

.pagingBar li {
	float: left;
}

.pagingBar li * {
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 20px;
	color: rgb(190, 190, 190);
	font: bold 12px tahoma;
	border: 1px solid rgb(190, 190, 190);
	text-align: center;
	text-decoration: none;
	font-size: 15px;
}

.pagingBar .pstyle>span {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar .pstyle a:hover {
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

.pagingBar li .crt{
	color: rgb(26, 188, 156);
	border: 1px solid rgb(26, 188, 156);
}

</style>   
</head>
<body>
<div class="container-scroller">
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="wrap11" style="height: 100%;">

	<div class="outer">
		<div class="wrap2">
				<br><br>
				<p style="font-size: 22px;">
						메일 &nbsp;|&nbsp; <b>받은 메일함</b>
					</p>
					<hr>
				
				</div>
		<div class="contentArea">
			<!-- 버튼과 검색바 같이 들어가는 DIV -->
			<div class="btnAndSearch">
				<table class="bas">
					<tr>
						<td id="leftArea" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="mdi mdi-delete takeManyBtn" type="button" style="color:gray; background:white; border:0px; font-size:20px;"></button>
						</td>
						<td id="rightArea" style="width:100%;">
							<!-- 검색바 -->
							<form id="searchForm" action="search.mil" method="get">
							<div class="searchBar" style="height:30px;">
								<select name="condition" style="height:30px;width:100px;">
									<option value="mailTitle">제목</option>
									<option value="mailContent">내용</option>
									<option value="mailnameFrom">보낸사람</option>
								</select> 
								<input type="text" name="keyword" value="${ keyword }" style="height:30px; width:250px;">
								<input type="hidden" name="currentPage" value="1">
								<input type="hidden" name="mailOwn" value="${ loginUser.empNo }">
								<div onclick="document.getElementById('searchForm').submit();" class="mdi mdi-magnify" style="height:30px; width:30px; color:RGB(29, 92, 99); display:inline-block; cursor:pointer;"></div>
							</div>
							</form>
							<!-- 검색바 -->
							<script>
							$(function(){
								switch('${condition}'){    
								case "mailTitle" : $("#searchForm option").eq(0).attr("selected", true);  break;
								case "mailContent": $("#searchForm option").eq(1).attr("selected", true);  break;
								case "mailnameFrom": $("#searchForm option").eq(2).attr("selected", true);  break;
								}
							});
							</script>
						</td>
					</tr>
				</table>
			</div>
			
			<div style="height:10px;"></div>
			<!-- 메일함 -->
			<table class="boardTable mailTable" style="border:0px solid white;">
				<thead>
					<tr>
						<th width="80">
							<div class="">
					    		<label><input class="checkbox" type="checkbox" id="checkall" value="" style="vertical-align: middle; transform: scale(1.6);"></label>
					        </div>
   						</th>
						<th width="80">
								<label><input type="checkbox" class="importbox" id="importAll" name="ichk"><img src="resources/images/star_border-black-48dp.svg"></label>
						</th>
						<th width="220">보낸사람</th>
						<th>제목</th>
						<th width="150">받은날짜</th>
					</tr>
				</thead>
				
				<c:choose>
					<c:when test="${fn:length(list) eq 10}">
						<c:forEach items="${ list }" var="b">
						<tr>
							<td>
								<label>
									<input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.0);">
									<input class="mailNo" type="hidden" name="mailNo" value="${b.mailNo}">
								</label>
		   					</td>
							<td>
								<c:choose>
									<c:when test="${b.mailImportFlag eq 'Y' }">
										<label><input type="checkbox" class="importbox" name="ichk"><img src="resources/images/star-black-48dp.svg"></label>
									</c:when>
									<c:otherwise>
										<label><input type="checkbox" class="importbox" name="ichk"><img src="resources/images/star_border-black-48dp.svg"></label>
									</c:otherwise>
								</c:choose>
							</td>
							<td><span data-tooltip-text="${b.mailFrom }@smartdoctor.com">${b.mailnameFrom }</span></td>
							<td>${b.mailTitle }</td>
							<td>${b.mailDateStr }</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${ list }" var="b">
						<tr>
							<td>
								<label>
									<input class="checkbox chk" type="checkbox" name="chk" value="" style="vertical-align: middle; transform: scale(1.0);">
									<input class="mailNo" type="hidden" name="mailNo" value="${b.mailNo}">
								</label>
		   					</td>
							<td>
								<c:choose>
									<c:when test="${b.mailImportFlag eq 'Y' }">
										<label><input type="checkbox" class="importbox" name="ichk"><img src="resources/images/star-black-48dp.svg"></label>
									</c:when>
									<c:otherwise>
										<label><input type="checkbox" class="importbox" name="ichk"><img src="resources/images/star_border-black-48dp.svg"></label>
									</c:otherwise>
								</c:choose>
							</td>
							<td><span data-tooltip-text="${b.mailFrom }@smartdoctor.com">${b.mailnameFrom }</span></td>
							<td>${b.mailTitle }</td>
							<td>${b.mailDateStr }</td>
						</tr>
						</c:forEach>
						<c:forEach var="b" begin="1" end="${10-fn:length(list)}">
    					<tr>
							<td class="nonContent">
								<label>
									
								</label>
		   					</td>
							<td class="nonContent">
								
							</td>
							<td class="nonContent"></td>
							<td class="nonContent"></td>
							<td class="nonContent"></td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</table>
			
			<br>
			<c:choose>
				<c:when test="${sc eq 1}">
					<!-- 페이징바 -->
					<ul class="pagingBar">
						<li class="pstyle"><a style="width: 50px;" class="pstyle" href="search.mil?condition=${condition}&keyword=${keyword}&currentPage=1">first</a></li>
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li><a class="pstyle disabled" href="#" style="width: 80px;">previous</a></li>
							</c:when>
			                <c:otherwise>
			                	<li class="pstyle"><a href="search.mil?condition=${condition}&keyword=${keyword}&currentPage=${ pi.currentPage-1 }" style="width: 80px;">previous</a></li>
			                </c:otherwise>
			            </c:choose>
			        
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            <c:choose>
		                    <c:when test="${ p eq pi.currentPage }">
		                    	<li><a class="crt disabled" href="#">${p}</a></li>
		                    </c:when>
			                <c:otherwise>
			                    <li class="pstyle"><a href="search.mil?condition=${condition}&keyword=${keyword}&currentPage=${ p }">${ p }</a></li>
			                </c:otherwise>
		                </c:choose>
					 </c:forEach>
						
						<c:choose>
			                <c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li><a class="disabled" href="#" style="width: 50px;">next</a></li>
							</c:when>
				            <c:otherwise>
				                <li class="pstyle"><a href="search.mil?condition=${condition}&keyword=${keyword}&currentPage=${ pi.currentPage+1 }" style="width: 50px;">next</a></li>
				            </c:otherwise>
			            </c:choose>
					<li class="pstyle"><a href="search.mil?condition=${condition}&keyword=${keyword}&currentPage=${ pi.maxPage }" style="width: 50px;">last</a></li>
					</ul>
					<!-- 페이징바 -->
				</c:when>
				<c:otherwise>
					<!-- 페이징바 -->
					<ul class="pagingBar">
						<li class="pstyle"><a style="width: 50px;" class="pstyle" href="list.mil?currentPage=1&mailOwn=${loginUser.empNo }">first</a></li>
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li><a style="width: 80px;" class="pstyle disabled" href="#">previous</a></li>
							</c:when>
			                <c:otherwise>
			                	<li class="pstyle"><a style="width: 80px;" href="list.mil?currentPage=${ pi.currentPage-1 }&mailOwn=${loginUser.empNo }">previous</a></li>
			                </c:otherwise>
			            </c:choose>
			        
			        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            <c:choose>
		                    <c:when test="${ p eq pi.currentPage }">
		                    	<li><a class="crt disabled" href="#">${p}</a></li>
		                    </c:when>
			                <c:otherwise>
			                    <li class="pstyle"><a href="list.mil?currentPage=${ p }&mailOwn=${loginUser.empNo }">${ p }</a></li>
			                </c:otherwise>
		                </c:choose>
					 </c:forEach>
						
						<c:choose>
			                <c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li><a style="width: 50px;" class="disabled" href="#">next</a></li>
							</c:when>
				            <c:otherwise>
				                <li class="pstyle"><a style="width: 50px;" href="list.mil?currentPage=${ pi.currentPage+1 }&mailOwn=${loginUser.empNo }">next</a></li>
				            </c:otherwise>
			            </c:choose>
					<li class="pstyle"><a style="width: 50px;" href="list.mil?currentPage=${ pi.maxPage }&mailOwn=${loginUser.empNo }">last</a></li>
					</ul>
					<!-- 페이징바 -->
				</c:otherwise>
			</c:choose>
			<!-- 페이징바 -->
				<br><br><br>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	
	
	
	<script>
	
	//최상단 체크박스 클릭
	$("#checkall").click(function(){
	     //클릭되었으면
	     if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	     }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	     }
	 });
	//최상단 중요메일 클릭
	$("#importAll").click(function(){
	     //클릭되었으면
	     if($("#importAll").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=ichk]").prop("checked",true);
	            $("input[name=ichk]").parent().find('img').attr('src','resources/images/star-black-48dp.svg');
	            //클릭이 안되있으면
	     }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=ichk]").prop("checked",false);
	            $("input[name=ichk]").parent().find('img').attr('src','resources/images/star_border-black-48dp.svg');
	     }
	 });
	$(document).ready(function() { 
		$(".importbox").on('click', function() { 
			if ( $(this).prop('checked') ) {
				$(this).parent().find('img').attr('src','resources/images/star-black-48dp.svg');
			}else { 
				$(this).parent().find('img').attr('src','resources/images/star_border-black-48dp.svg');
			} 
		});
		
		$(".mailTable>tbody>tr>td:nth-child(n+4):nth-child(-n+5)").on('click', function(){
			
			$(".mailTable>tbody>tr").on('click', function(){
				var mailNo = $(this).children().find('input[name=mailNo]').val();
				if($.trim(mailNo).length > 0){
					location.href="detail.mil?mailNo=" + mailNo + "&currentPage=" + ${param.currentPage} + "&mailOwn="+'${param.mailOwn}' + "&pt=" + "inbox";
				}
			});
			
		});
		
		
		$(".mailTable>tbody>tr>td:nth-child(2)>label>img").on('click', function(){
			var mailNo = $(this).parent().parent().parent().find('input[name=mailNo]').val();
			var mailOwn = "${loginUser.empNo}";
			
			$.ajax({
				url : "importFlagUpdate.mil",
				data : {mailNo:mailNo},
				success : function(result){
					location.href="list.mil?currentPage=1&mailOwn=" + mailOwn;
				},error:function(){
					console.log("ajax 통신 실패!");
				}
			});
		});
		
	});

	
	
	
	$(".takeManyBtn").click(function(){
		 var delchk = []; // key 값을 담을 배열
		 $('.chk:checked').each(function(){
		    delchk.push($(this).parent().find('input[name=mailNo]').val());
		 });
		 
		 location.href="delete.mil?mailNo=" + delchk + "&mailOwn=" + '${param.mailOwn}';
		 alert("메일을 삭제하시겠습니까?");
	})
	
	$('.disabled').click(function () {return false;});
	</script>
</body>
</html>









