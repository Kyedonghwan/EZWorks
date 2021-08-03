<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<style>
	tr>td:nth-child(7),td:nth-child(6),td:nth-child(5),td:nth-child(4),td:nth-child(3),th:nth-child(7),th:nth-child(6),th:nth-child(5),th:nth-child(4),th:nth-child(3){
		text-align:center;
	}
</style>
<div class="container">
   
    <!-- end row -->
	<section style="height:84px;padding:24px 24px 16px">
		<h5>
			<a>결재 요청함
			</a>			
		</h5>
		<p>내가 기안한 문서 목록을 표시합니다.</p>
	</section>
	
	<div style="margin-top:20px;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <li class="nav-item" role="presentation">
		    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#allDetail" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#continueDetail" type="button" role="tab" aria-controls="profile" aria-selected="false">진행</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#agreeDetail" type="button" role="tab" aria-controls="contact" aria-selected="false">완료</button>
		  </li>
		  <li class="nav-item" role="presentation">
		    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#disagreeDetail" type="button" role="tab" aria-controls="contact" aria-selected="false">반려</button>
		  </li>
		</ul>
		<div class="tab-content" id="myTabContent">
		  <div class="tab-pane fade show active" id="allDetail" role="#allDetail" aria-labelledby="home-tab">
		  	<div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		  
		                    	<button type="button" class="btn btn-primary btn-sm" id="downloadExcel">목록 다운로드</button>
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col"><input class="form-check-input" type="checkbox" value=""></th>
		                                    <th scope="col" style="width:10%">기안일</th>
		                                    <th scope="col" style="width:10%">결재양식</th>
		                                    <th scope="col" style="width:5%">긴급</th>
		                                    <th scope="col" style="width:30%">제목</th>
		                                    <th scope="col" style="width:5%">첨부</th>
		                                    <th scope="col" style="width:10%">현재 결재자</th>
		                                    <th scope="col" style="width:20%">문서번호</th>
		                                    <th scope="col" style="width:10%">결재상태</th>
		                                 </tr>
		                                 
		                            </thead>
		                            <tbody id="tbody">
		                            	<c:forEach var="map" items="${all}">
		                                 	<tr>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
		                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
		                                 		<td>${map['FORM_NAME']}</td>
		                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
		                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a></td>
		                                 		<td></td>
		                                 		<td>${map['EMP_NAME']}</td>
		                                 		<td>${map['APPROVAL_STRINGNO']}</td>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
		                                 	</tr>
		                                 </c:forEach>
		                            </tbody>
		                        </table>
		                       
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		  </div>
		  <div class="tab-pane fade" id="continueDetail" role="#continueDetail" aria-labelledby="profile-tab">
		  	<div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		  
		                    	<button type="button" class="btn btn-primary btn-sm" id="downloadExcel">목록 다운로드</button>
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col"><input class="form-check-input" type="checkbox" value=""></th>
		                                    <th scope="col" style="width:10%">기안일</th>
		                                    <th scope="col" style="width:10%">결재양식</th>
		                                    <th scope="col" style="width:5%">긴급</th>
		                                    <th scope="col" style="width:30%">제목</th>
		                                    <th scope="col" style="width:5%">첨부</th>
		                                    <th scope="col" style="width:10%">현재 결재자</th>
		                                    <th scope="col" style="width:20%">문서번호</th>
		                                    <th scope="col" style="width:10%">결재상태</th>
		                                 </tr>
		                                 
		                            </thead>
		                            <tbody id="tbody">
		                            	<c:forEach var="map" items="${continues}">
		                                 	<tr>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
		                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
		                                 		<td>${map['FORM_NAME']}</td>
		                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
		                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a></td>
		                                 		<td></td>
		                                 		<td>${map['EMP_NAME']}</td>
		                                 		<td>${map['APPROVAL_STRINGNO']}</td>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
		                                 	</tr>
		                                 </c:forEach>
		                            </tbody>
		                        </table>
		                       
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		  </div>
		  <div class="tab-pane fade" id="agreeDetail" role="#agreeDetail" aria-labelledby="contact-tab">
		  	<div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		  
		                    	<button type="button" class="btn btn-primary btn-sm" id="downloadExcel">목록 다운로드</button>
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col"><input class="form-check-input" type="checkbox" value=""></th>
		                                    <th scope="col" style="width:10%">기안일</th>
		                                    <th scope="col" style="width:10%">결재양식</th>
		                                    <th scope="col" style="width:5%">긴급</th>
		                                    <th scope="col" style="width:30%">제목</th>
		                                    <th scope="col" style="width:5%">첨부</th>
		                                    <th scope="col" style="width:10%">현재 결재자</th>
		                                    <th scope="col" style="width:20%">문서번호</th>
		                                    <th scope="col" style="width:10%">결재상태</th>
		                                 </tr>
		                                 
		                            </thead>
		                            <tbody id="tbody">
		                            	<c:forEach var="map" items="${agree}">
		                                 	<tr>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
		                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
		                                 		<td>${map['FORM_NAME']}</td>
		                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
		                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a></td>
		                                 		<td></td>
		                                 		<td>${map['EMP_NAME']}</td>
		                                 		<td>${map['APPROVAL_STRINGNO']}</td>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
		                                 	</tr>
		                                 </c:forEach>
		                            </tbody>
		                        </table>
		                       
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		  </div>
		  <div class="tab-pane fade" id="disagreeDetail" role="#disagreeDetail" aria-labelledby="contact-tab">
		  	<div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		  
		                    	<button type="button" class="btn btn-primary btn-sm" id="downloadExcel">목록 다운로드</button>
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col"><input class="form-check-input" type="checkbox" value=""></th>
		                                    <th scope="col" style="width:10%">기안일</th>
		                                    <th scope="col" style="width:10%">결재양식</th>
		                                    <th scope="col" style="width:5%">긴급</th>
		                                    <th scope="col" style="width:30%">제목</th>
		                                    <th scope="col" style="width:5%">첨부</th>
		                                    <th scope="col" style="width:10%">현재 결재자</th>
		                                    <th scope="col" style="width:20%">문서번호</th>
		                                    <th scope="col" style="width:10%">결재상태</th>
		                                 </tr>
		                                 
		                            </thead>
		                            <tbody id="tbody">
		                            	<c:forEach var="map" items="${disagree}">
		                                 	<tr>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
		                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
		                                 		<td>${map['FORM_NAME']}</td>
		                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
		                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a></td>
		                                 		<td></td>
		                                 		<td>${map['EMP_NAME']}</td>
		                                 		<td>${map['APPROVAL_STRINGNO']}</td>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
		                                 	</tr>
		                                 </c:forEach>
		                            </tbody>
		                        </table>
		                       
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		  </div>
		</div>
	    
		
	 </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    

    
</div>

    

							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/apexcharts/apexcharts.js'/>"></script>
<script src="<c:url value='/resources/js/pages/dashboard.js'/>"></script>
<script src="<c:url value='/resources/js/archiveSidebar.js'/>"></script>
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>	
<%@include file="selectFormModal.jsp"%>
</body>

</html>	