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
			<a>결재 대기함
			</a>			
		</h5>
		<p> 내가 결재해야 할 문서 목록을 표시합니다.</p>
	</section>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
                    	<button type="button" class="btn btn-primary btn-sm" id="makeFolder">일괄 결재</button>
                        <table class="table project-table table-centered table-nowrap">
                            <thead>
                                <tr>
                                    <th scope="col"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
                                    <th scope="col" style="width:12%">기안일</th>
                                    <th scope="col" style="width:12%">결재양식</th>
                                    <th scope="col" style="width:8%">긴급</th>
                                    <th scope="col" style="width:50%">제목</th>
                                    <th scope="col" style="width:11%">첨부</th>
                                    <th scope="col" style="width:7%">기안자</th>
                                 </tr>
                                 
                            </thead>
                            <tbody id="tbody">
                            	<c:forEach var="map" items="${list}">
                                 	<tr>
                                 		<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
                                 		<td><fmt:formatDate value='${map["APPROVAL_REGDATE"]}' pattern="yyyy-MM-dd"/></td>
                                 		<td>${map['FORM_NAME'] }</td>
                                 		<td><c:if test="${map['EMERGENCY']=='Y'}"><span class="state emergency">긴급</span></c:if></td>
                                 		<td><a href="<c:url value='/approval/detail?approvalNo=${map["APPROVAL_NO"]}&formNo=${map["FORM_NO"]}'/>">${map['FORM3_TITLE']}</a></td>
                                 		<td></td>
                                 		<td>${map['EMP_NAME']}</td>
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