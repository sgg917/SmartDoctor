<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.wrap11{
	width: 70%;
	height: 100%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
	}
</style>
</head>
<body>

	<jsp:include page="../common/navbar.jsp" />
	<div class="content-wrapper" style="height:808px; text-align:center;">
		<div class="wrap11" style="width: 70%; height:70%; margin:auto;">
		
		
			<div class="row" style="border: 1px solid red;">
                <div class="card">
                  <div class="card-body">
                  
                    <h2 class="">공지사항</h2>
                    <p class="card-description">&nbsp;&nbsp;총 ##### 건 <code style="color:white;">.table-hover</code>
                    </p>

                    <div class="form-group" style="float: right;">
                      <table>
                        <tr>
                          <td><input type="text" class="form-control input-sm" placeholder="검색어 입력" style="width: 300px; height: 30px;"></td>
                          <td><button type="button" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;">검색</button>
                            
                        </tr>
                      </table>
                    </div>


                    <table class="table table-hover">

                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>작성일</th>
                          <th>조회수</th>
                        </tr>
                      </thead>

                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>병원 단축 운영합니다.</td>
                          <td>2022.08.18</td>
                          <td>123</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>야간운영공지</td>
                          <td>2022.08.20</td>
                          <td>80</td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td>??????????????????</td>
                          <td>2022.08.22</td>
                          <td>23</td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>공지사항 제목자리</td>
                          <td>2022.09.04</td>
                          <td>11</td>
                        </tr>
                        <tr>
                          <td>5</td>
                          <td>공지사항 제목자리</td>
                          <td>2022.09.05</td>
                          <td>8</td>
                        </tr>
                      </tbody>

                    </table>

                    <div class="template-demo">
                      <button type="button" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;">글작성</button>
                    </div>

                    <br><br><br>
            
                    <div id="pagingbar">
                      <ul class="pagination"  style="justify-content: center;">
                        <li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
                      </ul>
                    </div>

                  </div>
                </div>
            </div>



		</div>
		<br>
		<jsp:include page="../common/footer.jsp" />
	</div>

</body>
</html>