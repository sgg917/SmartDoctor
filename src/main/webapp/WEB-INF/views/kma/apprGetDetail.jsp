<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재문서함e</title>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>결재문서함</b>
					</p>
					<hr>
					<br>
					<div class="appr-table-wrapper" style="margin-left:30px;">
					
						<c:choose>
							<c:when test="${ s.apprStatus eq '대기' }">
								<button type="button" class="btn btn-success appr-write-btn">
									<i class="mdi mdi-close" style="color: white;"></i>&nbsp; 
									<span>상신취소</span>
								</button>
							</c:when>
							<c:when test="${ s.apprStatus eq '반려' || s.apprStatus eq '완료' }">
								<button type="button" class="btn btn-success appr-write-btn">
		                            <i class="mdi mdi-arrow-up-bold" style="color:white;"></i>&nbsp;&nbsp;
		                            <span>재기안</span>
	                          	</button>
							</c:when>
						</c:choose>
						
						<button type="button" class="btn btn-outline-success btn-green" 
							    style="width: 100px;" onclick="history.back();">
							<i class="mdi mdi-subdirectory-arrow-left menu-icon"></i>&nbsp; 
							<span>이전목록</span>
						</button>
						<table class="table table-bordered appr-table">
							<tr>
								<th width="225">기안부서</th>
								<td width="300">${ s.deptName }</td>
								<th width="225">기안자</th>
								<td width="300">${ s.empName }</td>
							</tr>
							<tr>
								<th width="225">문서번호</th>
								<td width="300">${ s.apprNo }</td>
								<th width="225">문서보존기간</th>
								<td width="300">5년</td>
							</tr>
							<tr>
								<th width="225" height="150">신청</th>
								<td width="300" style="margin: 0; padding: 0;">
									<table class="table table-bordered appr-inner-table">
										<tr>
											<th>${ s.jobName }</th>
											<th></th>
											<th></th>
										</tr>
										<tr align="center">
											<td height="90">
												<img src="resources/images/kma/approved.png">${ s.enrollDate }
											</td>
											<td></td>
											<td></td>
										</tr>
										<tr align="center">
											<td>${ s.empName }</td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
								<th width="225" height="150">처리</th>
								<td width="300" style="margin: 0; padding: 0;">
									<table class="table table-bordered appr-inner-table">
										<tr id="line-job">
											<th></th>
											<th></th>
											<th></th>
										</tr>
										<tr align="center" id="line-appr">
											<td height="90"></td>
											<td></td>
											<td></td>
										</tr>
										<tr align="center" id="line-emp">
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
									
									<script>
									
										$(document).ready(function(){ // 테이블에 출력할 요소
											
											let jobArr = [];
											<c:forEach var="i" items="${ line }">
												jobArr.push( "${i.jobName}" );
											</c:forEach>
											
											$('#line-job').children().each(function(index, item){ // 직급 출력

												$(item).text(jobArr[index]);
											})
											
											let empArr = [];
											<c:forEach var="i" items="${ line }">
												empArr.push( "${i.empName}" );
											</c:forEach>
											
											$('#line-emp').children().each(function(index, item){ // 이름 출력
													
												$(item).text(empArr[index]);
											})
											
											let dateArr = [];
											<c:forEach var="i" items="${ line }">
												dateArr.push( "${i.lineDate}" );
											</c:forEach>
													
											$('#line-appr').children().each(function(index, item){ // 승인도장 + 날짜 출력
												
												if( dateArr[index] != "" && typeof dateArr[index] != 'undefined' ){ 
													$(item).html("<img src='resources/images/kma/approved.png'>" + dateArr[index]);
												}												
											})
											
											let refArr = [];
											<c:forEach var="r" items="${ ref }">
												refArr.push( "${r.empName}" );
											</c:forEach>
											
											$("#ref-name").text(refArr.join(", ")); // 참조자 이름 출력
										})
									</script>
								</td>
							</tr>
							<tr>
								<th>참조자</th>
								<td colspan="5" id="ref-name"></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="5">
									<i class="mdi mdi-paperclip"></i>&nbsp;
									<c:choose>
			                    		<c:when test="${ empty s.originName }">
			                    			첨부파일이 없습니다.
			                    		</c:when>
			                    		<c:otherwise>
			                        		<a href="${ s.changeName }" download="${ s.originName }">${ s.originName }</a>
			                        	</c:otherwise>
			                        </c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="8" align="center">
									<br><br>
									${ s.apprContent }
									<br><br>
								</td>
							</tr>
						</table>
						<br>
						<hr>
						<br>
						<table class="table table-bordered appr-table" id="appr-comment">
							<tr>
								<th colspan="5">&nbsp;결재의견 &nbsp;
									<span>(${count})</span>
								</th>
							</tr>
							<c:choose> 
								<c:when test="${ count eq 0 }">
									<tr>
										<td colspan="5" align="center">
											결재의견이 없습니다.
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" items="${ line }">
										<tr>
											<td colspan="5">
												<b>${ i.empName }</b> &nbsp;&nbsp;|&nbsp;&nbsp;
												${ i.lineComment }
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>