<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가 관리</title>
<style>
.wrap11{
    width: 100%;
    background-color: white;
    border-radius: 10px 20px 30px 40px;
    box-shadow: 3px 3px 3px 3px lightgray;
}

/* 초록 버튼 */
.green-btn {
  background:RGB(29, 92, 99) !important;
  color:white !important;
}
.green-btn:hover {
  background:#1A3C40 !important;
  color:white !important;
}

/* 작은 버튼 */
.small-btn {
    width:70px;
    height:30px;
    border-style:none;
    border-radius:7px;
    font-weight:400;
}

/* 페이징 스타일 */
.page-item {
    background:none;
    color:rgb(65, 125, 122);
}
.page-item .active {
    background:rgb(65, 125, 122) !important;
    color:white;
}

/* 연차 테이블 스타일 */
#my-vacation {text-align:center;}
#my-vacation tr {height:30px;}
#my-vacation td {
    width:100px;
    border:solid 1px lightgray;
    font-size:14px;
}
th {
    font-weight:bold !important;
    background:#f2f2f2 !important;
}

/* 모달 스타일 */
.modal-body {height:100px !important;}
.modal-body>span{
	line-height:100px;
	vertical-align:middle;
}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp"/>
	
	<!-- partial !!!여기서부터 메인 시작!!! -->
    <div class="main-panel">
      <div class="content-wrapper">
        <h3><b>휴가 관리</b></h3>
        <br><hr>

        <div class="container card wrap11">
            <div style="padding:50px 70px;">
                <h5><b>내 연차 정보</b></h5>  
                <br>
                <table id="my-vacation">
                    <tr>
                        <td>연차 지급일수</td>
                        <td>연차 사용일수</td>
                        <td>연차 잔여일수</td>
                    </tr>
                    <tr>
                        <td>20</td>
                        <td>${ 20 - vacRemain }</td>
                        <td>${ vacRemain }</td>
                    </tr>
                </table>

                <br><br><br>
              
                <h5><b>연차 사용 내역</b></h5> 
                <br> 
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>신청일</th>
                            <th>휴가일</th>
                            <th>사유</th>
                            <th>승인여부</th>
                        </tr>
                    </thead>
                    <tbody>
	                    <c:choose>
	                    	<c:when test="${ empty list }">
	                    		<tr>
	                    			<td colspan="5" style="text-align:center;">
	                    				연차 사용 내역이 없습니다.
	                    			</td>
	                    		</tr>
	                    	</c:when>
	                    	<c:otherwise>
		                    	<c:forEach var="v" items="${ list }">
			                        <tr>
			                            <td>${ v.appNo }</td>
			                            <td>${ v.enrollDate }</td>
			                            <c:choose>
			                            	<c:when test="${ v.startDate eq v.endDate }">
			                            		<td>${ v.startDate }</td>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<td>${ v.startDate } ~ ${ v.endDate }</td>
			                            	</c:otherwise>
			                            </c:choose>
			                            <td>${ v.vacCause }</td>
			                            <c:choose>
				                            <c:when test="${ v.status eq '반려' }">
					                            <td>
					                              <a class="modal-btn" data-bs-toggle="modal" data-id="중요한 회사 일정 있음." href="#lineCommentModal">${ v.status }</a>
					                            </td>
				                            </c:when>
				                            <c:otherwise>
				                            	<td><a>${ v.status }</a></td>
				                            </c:otherwise>
			                            </c:choose>
			                        </tr>
		                        </c:forEach>
	                        </c:otherwise>
	                    </c:choose>
                    </tbody>
                </table>
                <br>

                <!-- 반려 사유 Modal -->
                <div class="modal fade" id="lineCommentModal">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      
                      <!-- Modal body -->
                      <div class="modal-body" style="text-align:center;">
                      	<span></span>
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                            <button type="button" class="btn green-btn" data-bs-dismiss="modal">확인</button>
                        </div>
                          
                      </div>
                  </div>
                </div>
                <!-- 반려 사유 Modal 끝 -->

              
               <!-- 테이블 페이징 -->
               <div class="pagination">
                  <ul class="pagination" style="margin-left:400px;">
                  
                    <c:if test="${ pi.currentPage ne 1 }">
						<li class="page-item"><a class="page-link" href="list.vac?cpage=${pi.currentPage-1}&no=${loginUser.empNo}">&lt;</a></li>
					</c:if>
				
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						
						<c:choose>
							<c:when test="${ p eq pi.currentPage }">
								<li class="page-item active"><a class="page-link" href="list.vac?cpage=${p}&no=${loginUser.empNo}">${p}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="list.vac?cpage=${p}&no=${loginUser.empNo}">${p}</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
						
                    <c:choose>
                    	<c:when test="${ pi.currentPage ne pi.maxPage }">
                    		<li class="page-item"><a class="page-link" href="list.vac?cpage=${pi.currentPage+1}&no=${loginUser.empNo}">&gt;</a></li>
                    		<li style="width:450px;"><button class="btn green-btn medium-btn" style="float:right;" onclick="location.href='vacationForm.si';">휴가 신청</button></li>
                  		</c:when>
                  		<c:otherwise>
                  			<li style="width:550px;"><button class="btn green-btn medium-btn" style="float:right;" onclick="location.href='vacationForm.si';">휴가 신청</button></li>
                  		</c:otherwise>
                  	</c:choose>
                  </ul>
              </div>
              <!-- 테이블 페이징 끝 -->

            </div>
        </div>

      </div>
      
      <script>
      	$(function(){
      		
      		$('.modal-btn').click(function(){
      			var data = $(this).data('id');
      			$('.modal-body>span').html("반려사유&nbsp; : &nbsp;" + data);
      		})
      		
      	})
      </script>
      <!-- content-wrapper ends -->
      <!-- partial:partials/_footer.html -->
      
      <jsp:include page="../common/footer.jsp"/>
      
      <!-- partial -->
    </div>
    <!-- main-panel ends -->

</body>
</html>