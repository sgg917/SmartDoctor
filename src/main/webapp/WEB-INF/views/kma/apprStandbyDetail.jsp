<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재대기 문서함</title>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>결재대기 문서함</b>
					</p>
					<hr>
					<br>
					<div class="appr-table-wrapper" style="margin-left:30px;">
					
						<button type="button" class="btn btn-success appr-write-btn" 
                                data-bs-toggle="modal" data-bs-target="#apprModal" width="80px">
                          <i class="mdi mdi-check" style="color:white;"></i>&nbsp;
                          <span>결재하기</span>
                        </button>
                        <button type="button" class="btn btn-outline-success btn-green" 
                        			data-bs-toggle="modal" data-bs-target="#disapprModal" style="width:100px;">
                          <i class="mdi mdi-arrow-up-bold"></i>&nbsp;
                          <span>반려하기</span>
                        </button>
						
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
											let empArr = [];
											let dateArr = [];
											<c:forEach var="i" items="${ line }">
												jobArr.push( "${i.jobName}" );
												empArr.push( "${i.empName}" );
												dateArr.push( "${i.lineDate}" );
											</c:forEach>
											
											$('#line-job').children().each(function(index, item){ // 직급 출력

												$(item).text(jobArr[index]);
											})
											
											$('#line-emp').children().each(function(index, item){ // 이름 출력
													
												$(item).text(empArr[index]);
											})
													
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
							</table>
							
							<script>
								$("#approve").append("<input type='hidden' value='" + apprTotal + "' name='apprTotal'>");
								
							</script>
							
							<c:choose>
								<c:when test="${ s.formNo eq 1 }">
									<!-- 결재양식이 휴가신청서일 경우 -->
									<br><br>
									<h3 align="center" style="font-weight: 550;">휴가 신청서</h3>
									<br>
									<br>
									<table class="table table-bordered appr-table" >
			                            <tr>
			                              <th width="350">종류</th>
			                              <td>연차</td>
			                            </tr>
			                            <tr>
			                              <th>일수</th>
			                              <td id="vacDays">${ v.vacDays }일</td>
			                            </tr>
			                            <tr>
			                              <th>사유</th>
			                              <td>${ v.vacCause }</td>
			                            </tr>
			                        </table>
								</c:when>
								<c:when test="${ s.formNo eq 2 }">
									<!-- 결재양식이 연장근무일 경우 -->
									<br><br>
									<h3 align="center" style="font-weight: 550;">연장근무 신청서</h3>
									<br>
									<br>
									<table class="table table-bordered appr-table">
										<tr>
											<th width="350">근무날짜</th>
											<td>${ o.overDate }</td>
										</tr>
										<tr>
											<th>근무시작시간</th>
											<td colspan="5">${ o.startTime }</td>
										</tr>
										<tr>
											<th>근무종료시간</th>
											<td colspan="5">${ o.endTime }</td>
										</tr>
										<tr>
											<th>총근무시간</th>
											<td colspan="5">${ o.totalTime }시간</td>
										</tr>
										<tr>
											<th>근무사유</th>
											<td colspan="5">${ o.overCause }</td>
										</tr>
									</table>
								</c:when>
								<c:otherwise>
									<!-- 결재양식이 에디터폼일 경우 -->
									<table class="table table-bordered appr-table" >
										<tr>
											<td colspan="8" align="center" id="apprContent">
												<br><br>
												${ s.apprContent }
												<br><br>
											</td>
										</tr>
									</table>
								</c:otherwise>
							</c:choose>
						<br>
						<hr>
						<br>
						<table class="table table-bordered appr-table" id="appr-comment">
							<tr>
								<th colspan="5">&nbsp;결재의견 &nbsp;
									<span>(${fn:length(comment)})</span>
								</th>
							</tr>
							<c:choose> 
								<c:when test="${ empty comment }">
									<tr>
										<td colspan="5" align="center">
											결재의견이 없습니다.
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="c" items="${ comment }">
										<tr>
											<td colspan="5">
												<b>${ c.empName }</b> &nbsp;&nbsp;|&nbsp;&nbsp;
												${ c.lineComment }
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
		
		<!-- 결재하기 모달창 -->
		<div class="modal fade" id="apprModal" tabindex="-1" aria-labelledby="apprModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content" style="background:white;">
               <div class="modal-header">
                 <h5 class="modal-title" id="apprModalLabel" style="margin-left:5px;">결재하기</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form id="approve" action="" method="post">
               	   <input type="hidden" name="apprNo" value="${ s.apprNo }">
               	   <input type="hidden" name="empNo" value="${ loginUser.empNo }">
               	   <input type="hidden" name="formNo" value="${ s.formNo }">
               	   <input type="hidden" name="startDate" value="${ v.startDate }">
               	   <input type="hidden" name="endDate" value="${ v.endDate }">
               	   <input type="hidden" name="apprTotal" value="${ s.apprTotal }">
	               <div class="modal-body" style="height:220px;">
	                 <div class="form-group row" style="width:450px; padding-left:10px; margin-top:7px;">
	                   <label class="col-sm-3 col-form-label">결재문서명</label>
	                   <div class="col-sm-9">
	                     <input type="text" class="form-control appr-tb-input" value="${ s.apprTitle }" style="background:none; margin-top:4px; padding-left:0; border:none;" readonly>
	                   </div>
	                   <label class="col-sm-3 col-form-label">결재의견</label>
	                   <div class="col-sm-9">
	                   	 <textarea rows="5" cols="36" name="lineComment" style="margin-top:10px; border:1px solid lightgray;"></textarea>
	                   </div>
	                 </div>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	                 <button type="button" class="btn btn-success btn-sm" 
	                 		 style="background:RGB(29, 92, 99); color:white;" onclick="postFormSubmit('endApprove.si');">전결</button>
	                 <button type="button" class="btn btn-success btn-sm" 
	                 		 style="background:RGB(29, 92, 99); color:white;" onclick="postFormSubmit('Approve.si');">결재</button>
	               </div>
               </form>
             </div>
           </div>
        </div>
        <!-- 결재모달창 end -->
        
        <script>
        
	        function postFormSubmit(url){
				
				let result;
				if(url == 'approve.si'){
					result = confirm("결재하시겠습니까?");
				}else{
					result = confirm("전결 처리하시겠습니까?");
				}
				
				if(result == true){
					$("#approve").attr("action", url).submit();
				}
			}
        </script>
        
        <!-- 반려하기 모달창 -->
		<div class="modal fade" id="disapprModal" tabindex="-1" aria-labelledby="disapprModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered">
             <div class="modal-content" style="background:white;">
               <div class="modal-header">
                 <h5 class="modal-title" id="disapprModalLabel" style="margin-left:5px;">반려하기</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <form action="disapprove.si" method="post">
               	   <input type="hidden" name="apprNo" value="${ s.apprNo }">
               	   <input type="hidden" name="empNo" value="${ loginUser.empNo }">
	               <div class="modal-body" style="height:220px;">
	                 <div class="form-group row" style="width:450px; padding-left:10px; margin-top:7px;">
	                   <label class="col-sm-3 col-form-label">결재문서명</label>
	                   <div class="col-sm-9">
	                     <input type="text" class="form-control appr-tb-input" value="${ s.apprTitle }" style="background:none; margin-top:4px; padding-left:0; border:none;" readonly>
	                   </div>
	                   <label class="col-sm-3 col-form-label">반려사유</label>
	                   <div class="col-sm-9">
	                   	 <textarea rows="5" cols="36" name="lineComment" style="margin-top:10px; border:1px solid lightgray;"></textarea>
	                   </div>
	                 </div>
	               </div>
	               <div class="modal-footer">
	                 <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	                 <button type="submit" class="btn btn-success btn-sm" style="background:RGB(29, 92, 99); color:white;">확인</button>
	               </div>
               </form>
             </div>
           </div>
        </div>
        <!-- 반려모달창 end -->
        
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>