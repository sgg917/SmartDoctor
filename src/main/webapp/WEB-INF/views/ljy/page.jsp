<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.ico" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <!-- partial -->
        <div>
          <div class="content-wrapper">
            
            <div class="">
              
              <div class="stretch-card">
                <div style="background: white; border-radius: 10px;">
                  <div class="card-body">

                    <!-- style="border: 2px solid blue;" -->
                    <form action="">
                      <table>

                        <tr>
                          <td colspan="2">
                            <h5 style="font-weight: bold;">환자정보</h5>
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2">
                            <table class="table table-hover table-bordered " style="text-align: center;">
                              <thead>
                                <tr>
                                  <th style="background: lightgray;">차트번호</th>
                                  <th style="background: lightgray;">이름</th>
                                  <th style="background: lightgray;">성별</th>
                                  <th style="background: lightgray;">나이</th>
                                  <th style="background: lightgray;">초진/재진</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>A-1234</td>
                                  <td>이수만</td>
                                  <td>남</td>
                                  <td>62</td>
                                  <td>재진</td>
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
                                        <tr>
                                          <td>22-08-29</td>
                                          <td>감기</td>
                                          <td>이비인후과</td>
                                        </tr>
                                        <tr>
                                          <td>22-05-22</td>
                                          <td>불면증</td>
                                          <td>정신과</td>
                                        </tr>
                                        <tr>
                                          <td>날짜</td>
                                          <td>증상</td>
                                          <td>과과과</td>
                                        </tr>
                                        <tr>
                                          <td>날짜</td>
                                          <td>증상</td>
                                          <td>과과과</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </td>
    
                                  <td>
                                    <textarea cols="30" rows="15" style="border-radius: 10px;"></textarea>
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

                            <select name="sickness" id="">
                              <option aria-placeholder="">병명선택</option>
                              <option value="">병명1</option>
                              <option value="">병명2</option>
                              <option value="">병명3</option>
                              <option value="">병명4</option>
                              <option value="">병명5</option>
                              <option value="">병명6</option>
                            </select>
                            &nbsp;&nbsp;

                            <input type="text" placeholder="질병코드" style="width: 90px;">
                            
                          </td>
                          <td style="width: 50%;">
                            
                            <span style="font-weight: bold;">수술</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <input type="radio" class="form-check-input" name="surgery">수술O&nbsp;
                            <input type="radio" class="form-check-input" name="surgery" checked>수술X&nbsp;&nbsp;

                            <select name="choose-surgery" id="">
                              <option aria-placeholder="">수술선택</option>
                              <option value="">수술1</option>
                              <option value="">수술2</option>
                              <option value="">수술3</option>
                              <option value="">수술4</option>
                              <option value="">수술5</option>
                              <option value="">수술6</option>
                            </select>
                            
                            &nbsp;
                            <input type="text" placeholder="수술코드" style="width: 90px;">
                          </td>
                        </tr>

                        <tr>
                          <td colspan="2"><hr></td>
                        </tr>

                        <tr>
                          <td style="font-weight: bold;">투여약</td>
                          <td>
                            <button type="button" class="btn btn-gradient-primary btn-sm" style="float: right; background: rgb(29, 92, 99); color: white; border: none; width: 80px;">약 입력</button>
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
                
                <!-- Button to Open the Modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                  Open modal
                </button>
              
                <!-- The Modal -->
                <div class="modal" id="myModal">
                  <div class="modal-dialog">
                    <div class="modal-content">
                    
                      <!-- Modal Header -->
                      <div class="modal-header">
                        <h4 class="modal-title">약 입력</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>
                      
                      <!-- Modal body -->
                      <div class="modal-body">
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
          </div>
          
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>