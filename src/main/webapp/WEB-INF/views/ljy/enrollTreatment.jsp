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
	width: 100%;
	height: 90%;
	background-color: white;
	border-radius: 10px 20px 30px 40px;
	box-shadow: 3px 3px 3px 3px lightgray;
	}
</style>
</head>
<body>

	<div class="container-scroller">

		<jsp:include page="../common/navbar.jsp" />

		<div class="main-panel">
			<div class="content-wrapper">
			
				<!-- 이 안에서 작업해 주세요 -->
			<div class="stretch-card">
			
                <div class="wrap11">
                  <div class="card-body">

                    <!-- style="border: 2px solid blue;" -->
                    <form action="">
                    <br><br>
                      <table style="text-align: center; margin:auto;">

                        <tr>
                          <td colspan="2">
                          
                            <h5 style="font-weight: bold;">환자정보</h5>
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2">
                            <table class="table table-hover table-bordered " style="text-align: center; margin:auto;">
                              <thead>
                                <tr>
                                  <th style="background: lightgray;">차트번호</th>
                                  <th style="background: lightgray;">이름</th>
                                  <th style="background: lightgray;">성별</th>
                                  <th style="background: lightgray;">나이(만)</th>
                                  <th style="background: lightgray;">초진/재진</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>${ nowPatient.chartNo }</td>
                                  <td>${ nowPatient.patientName }</td>
                                  <td>${ nowPatient.gender }</td>
                                  <td>${ nowPatient.age }</td>
                                  <td>${ nowPatient.newOne }</td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2"><hr></td>
                        </tr>

                        <tr>
                          <td colspan="2">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th style="font-weight: bold;">과거내역조회</th>
                                  <th style="font-weight: bold;">증상</th>
                                  <th style="font-weight: bold;">달력</th>
                                </tr>
                              </thead>
    
                              <tbody>
                                <tr>
                                  <td>
                                    <table class="table table-bordered">
                                      <thead style="">
                                        <th style="background: lightgray;">내원일</th>
                                        <th style="background: lightgray;">병명</th>
                                        <th style="background: lightgray;">진료과</th>
                                      </thead>
                                      <tbody>
                                      
                                      <c:forEach var="c" items="${ list }">
                                      	<tr>
                                          <td>${ c.enrollDate }</td>
                                          <td>${ c.disease }</td>
                                          <td>${ c.deptName }</td>
                                        </tr>
                                      </c:forEach>
                                        
                                      </tbody>
                                    </table>
                                  </td>
    
                                  <td>
                                    <textarea cols="30" rows="15" style="border-radius: 10px;">${ nowPatient.memo }</textarea>
                                  </td>
                                  
                                  <td style="width: 33%;">
                                    <table class="table-bordered">
                                      <tr>
                                        <th>일</th>
                                        <th>월</th>
                                        <th>화</th>
                                        <th>수</th>
                                        <th>목</th>
                                        <th>금</th>
                                        <th>토</th>
                                      </tr>
    
                                      <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                      </tr>
                                      <tr>
                                        <td>4</td>
                                        <td>5</td>
                                        <td>6</td>
                                        <td>7</td>
                                        <td>8</td>
                                        <td>9</td>
                                        <td>10</td>
                                      </tr>
                                      <tr>
                                        <td>11</td>
                                        <td>12</td>
                                        <td>13</td>
                                        <td>14</td>
                                        <td>15</td>
                                        <td>16</td>
                                        <td>17</td>
                                      </tr>
                                      <tr>
                                        <td>18</td>
                                        <td>19</td>
                                        <td>20</td>
                                        <td>21</td>
                                        <td>22</td>
                                        <td>23</td>
                                        <td>24</td>
                                      </tr>
                                      <tr>
                                        <td>25</td>
                                        <td>26</td>
                                        <td>27</td>
                                        <td>28</td>
                                        <td>29</td>
                                        <td>30</td>
                                        <td></td>
                                      </tr>
                                    </table>
                                    
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2"><hr></td>
                        </tr>

                        <tr>
                          <td style="width: 50%;">
                            
                            <span style="font-weight: bold;">병명</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <select name="sickness" id="sickness">
                            	<option aria-placeholder="">병명선택</option>
	                            <c:forEach var="d" items="${ dList }">
	                            	<option value="${ d.diseaseCode }" name="diseases" id="dName">${ d.diseaseName }</option>
	                            </c:forEach>
                            </select>
                            &nbsp;&nbsp;

                            <input type="text" id="dCode" placeholder="질병코드" style="width: 90px;">
                            
                          <script>
                          	$("#sickness").change(function(){
                          		
                          		console.log($("#sickness>option:selected").text());
                          		console.log($("#sickness>option:selected").val());
                          		
                          		$("#dCode").val(($("#sickness>option:selected").val()));
                          	})
                          </script>
                            
                          </td>
                          <td style="width: 50%;">
                            
                            <span style="font-weight: bold;">수술</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <input type="radio" class="form-check-input" name="surgery" value="yes" checked>수술O&nbsp;
                            <input type="radio" class="form-check-input" name="surgery" value="no" >수술X&nbsp;&nbsp;

							<select name="chooseSurgery" id="chooseSurgery">
								<option aria-placeholder="" id="choose" selected>수술선택</option>
								<c:forEach var="s" items="${ sList }">
									<option value=${ s.surgeryNo }>${ s.surgeryName }</option>
								</c:forEach>
							</select>
                            &nbsp;
                            
                            <input type="text" id="sCode" placeholder="수술코드" style="width: 90px;">
                            
                            <script>
                            
                            	$('input[name=surgery]').click(function(){
                            		
                            		if($('input[name=surgery]:checked').val() == "no"){
                                		$("#chooseSurgery>option").prop('disabled', true);
                                		$("#sCode").prop('disabled', true);
                                		$("#choose").prop('selected', true);
                                		$("#sCode").val("");
                                	}else{
                                		$("#chooseSurgery>option").prop('disabled', false);
                                		$("#sCode").prop('disabled', false);
                                	}
                            		
                            	})
                            	
                            
	                        	$("#chooseSurgery").change(function(){
	                        		console.log($("#chooseSurgery>option:selected").text());
	                        		console.log($("#chooseSurgery>option:selected").val());
	                        		$("#sCode").val($("#chooseSurgery>option:selected").val());
	                        	})
                        	</script>
                            
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2"><hr></td>
                        </tr>

                        <tr>
                          <td style="font-weight: bold;">투여약</td>
                          <td>
                            <button type="button" class="btn btn-gradient-primary btn-sm" data-toggle="modal" data-target="#chooseMedicine" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;">약 입력</button>
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2">
                            <table class="table table-bordered" style="text-align: center;">
                              <tr>
                                <th style="background: lightgray;">약 코드</th>
                                <th style="background: lightgray;">약 명칭</th>
                                <th style="background: lightgray;">1일 투여횟수</th>
                                <th style="background: lightgray;">총 투여일수</th>
                              </tr>
                              <tr>
                                <td>A-02</td>
                                <td>알버트정</td>
                                <td>
                                  <select name="times" class="custom-select">
                                    <option selected>선택</option>
                                    <option value="1">1회</option>
                                    <option value="2">2회</option>
                                    <option value="3">3회</option>
                                  </select>
                                </td>
                                <td>3일</td>
                              </tr>
                              <tr>
                                <td>B-04</td>
                                <td>제니정</td>
                                <td>
                                  <select name="times" class="custom-select">
                                    <option selected>선택</option>
                                    <option value="1">1회</option>
                                    <option value="2">2회</option>
                                    <option value="3">3회</option>
                                  </select>
                                </td>
                                <td>3일</td>
                              </tr>
                              <tr>
                                <td>c-05</td>
                                <td>피터정</td>
                                <td>
                                  <select name="times" class="custom-select">
                                    <option selected>선택</option>
                                    <option value="1">1회</option>
                                    <option value="2">2회</option>
                                    <option value="3">3회</option>
                                  </select>
                                </td>
                                <td>3일</td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                      </table>
                    </form>

                    <div class="template-demo">
                      <button type="button" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 100px;">저장</button>
                      <button type="reset" class="btn btn-gradient-primary btn-sm" style="float: right; background: gray; color: white; border: none; width: 100px;">초기화</button>
                      <br><br>
                    </div>
                    <br><br>
                  </div>
                </div>
              </div>

              <!-- 모달모달모달 -->
              <div class="container">
                
                <!-- The Modal -->
                <div class="modal" id="chooseMedicine">
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h3 class="modal-title" style="text-weight:bold;">약 입력</h4>
                        <hr>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
                      
                      	<form action=""></form>
                      	
                      	<span>약 명칭</span>
                      	<br>
                      	
                      	<table>
                  			<c:forEach var="m" items="${ mList }" varStatus="s">
                  				
                  				<c:if test="${ s.index mod 4 eq 0 }">
                  					<tr>
                  				</c:if>
                  				
                  				<td><input type="checkbox" value="${ m.medNo }">${ m.medName }</td>
                  				
                  				<c:if test="${ s.index mod 4 eq 3 }">
                  					</tr>
                  				</c:if>
                  				
                  			</c:forEach>
                      	</table>
                      
                      	<br>
                        <span>총 투여일수</span>
                        <select name="times" class="custom-select">
                          <option selected>선택</option>
                          <option value="1">3</option>
                          <option value="2">4</option>
                          <option value="3">5</option>
                          <option value="3">6</option>
                          <option value="3">7</option>
                          <option value="3">8</option>
                          <option value="3">9</option>
                          <option value="3">10</option>
                        </select>
                      </div>
                      
                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">저장</button>
                      </div>
                      
                    </div>
                  </div>
                </div>
                
              </div>
			</div>
			<jsp:include page="../common/footer.jsp" />
		</div>

	</div>

</body>
</html>