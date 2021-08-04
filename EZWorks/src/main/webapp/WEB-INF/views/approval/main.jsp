<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>
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
	<section style="height:64px;padding:24px 24px 16px">
		<h5>
			전자결재 홈		
		</h5>
		
	</section>
	<div style="padding:12px 24px;margin-top:30px">
		<div style="display:table!important;table-layout:fixed">
			<c:forEach var="map" items="${list1 }">
				<section style="display:block!important;margin:0 0 0 0;margin-bottom:20px;transition:0.3s;border:1px solid #ddd;border-radius:6px">
				<div style="margin:0 0 16px 0!important">
					<header style="padding: 12px 16px 0; border-top: 5px solid #fff; border-radius: 6px">
						<c:if test="${map['EMEREGENCY']=='Y'}"><span class="state emergency" style="margin-right:5px">긴급</span></c:if>
						<span class="state ongoing" style="margin-right:5px">진행중</span>
					</header>
					<div style="margin:0px;padding-left:16px;padding-right:140px;padding-top:5px;font-weight:bold;color:black">
						<a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a>
					</div>
					<div style="margin:0px 140px 16px 16px">
						<div style="display:table;width:100%;table-layout:fixed">
							<div style="display:table-cell">
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top">기안자:</div>
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top">${map['EMP_NAME']} ${map['POS_NAME']}</div>
							</div>
							<div style="display:table-cell">
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top">기안일:</div>
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top"><fmt:formatDate value="${map['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd"/></div>
							</div>
							<div style="display:table-cell">
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top">결재양식:</div>
								<div style="display:inline-block;width:auto;padding:2px 0;font-size:13px;color:#888;vertical-align:top">${map['FORM_NAME']}</div>
							</div>
							<div style="display:table-cell">
								<a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>"><button type="button" class="btn btn-primary btn-sm goApproval">바로 결재하기</button></a>
							</div>
						</div>
						<div>
							<img src="https://img.icons8.com/ios/14/000000/comments.png"/> <span>${map['ACCOUNT']}</span>
							<img src="https://img.icons8.com/ios/14/000000/attach.png"/> <span>${map['AFCOUNT']}</span>
						</div>
					</div>
					
				</div>
			</section>
			</c:forEach>
		</div>
	</div>
	<div style="padding:12px 24px;border-top:1px solid #ddd;margin-top:30px">
		<header style="padding:10px;0px">
			<h6>기안 진행 문서</h6>
		</header>
		<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
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
		                            	<c:forEach var="map" items="${list2}">
		                                 	<tr>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
		                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
		                                 		<td>${map['FORM_NAME']}</td>
		                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
		                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}<img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> ${map['ACCOUNT']}</a></td>
		                                 		<td><c:if test="${map['AFCOUNT']>0}"><img src="https://img.icons8.com/ios/14/000000/attach.png" title="첨부"/> ${map['AFCOUNT']}</c:if></td>
		                                 		<td>${map['EMP_NAME']}</td>
		                                 		<td>${map['APPROVAL_STRINGNO']}</td>
		                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
		                                 	</tr>
		                                 </c:forEach>
		                            </tbody>
		                        </table>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	</div>
	<div style="padding:12px 24px;border-top:1px solid #ddd;margin-top:30px">
		<header style="padding:10px;0px">
			<h6>기안 완료 문서</h6>
		</header>
		<div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
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
                            	<c:forEach var="map" items="${list3}">
                                 	<tr>
                                 		<td><c:if test="${map['CURRENT_STATE']=='결재완료'}"><input class="form-check-input" type="checkbox" value=""></c:if></td>
                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
                                 		<td>${map['FORM_NAME']}</td>
                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}<img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> ${map['ACCOUNT']}</a></td>
                                 		<td><c:if test="${map['AFCOUNT']>0}"><img src="https://img.icons8.com/ios/14/000000/attach.png" title="첨부"/> ${map['AFCOUNT']}</c:if></td>
                                 		<td>${map['EMP_NAME']}</td>
                                 		<td>${map['APPROVAL_STRINGNO']}</td>
                                 		<td><c:if test="${map['CURRENT_STATE']=='진행중'}"><span class="state ongoing" style="margin-right:5px">진행중</span></c:if><c:if test="${map['CURRENT_STATE']=='반려'}"><span class="state disagree" style="margin-right:5px">반려</span></c:if><c:if test="${map['CURRENT_STATE']=='결재완료'}"><span class="state complete" style="margin-right:5px">결재완료</span></c:if></td>
                                 	</tr>
                                 </c:forEach>
                            </tbody>
                        </table>
                     
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