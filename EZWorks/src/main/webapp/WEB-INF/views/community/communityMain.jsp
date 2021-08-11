<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-8, .col-12 col-lg-4{
		padding:0;
	}
	.col-auto, .col-3{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
	}
	#cName{
		width:110px;
	}
	.th1, .tr1{
		text-align: center;
	}
	#btnEnroll{
	    font-size: 0.9em;
	    padding: 0;
	}
	#btnOut{
	    font-size: 0.9em;
	    padding: 0;
	}
	p{
		margin-bottom:0;
	}
</style>
<script type="text/javascript">	
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();	
}
</script>

<%@ include file="../community/sidebar/sidebar1.jsp" %>
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->	
<!-- 페이징 처리를 위한 form -->
<form action="<c:url value='/community/communityMain'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>	
</form>
								
	<section class="row">
      <div class="col-12 col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">커뮤니티 홈</h5>
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home"
                                role="tab" aria-controls="home" aria-selected="true">최근글</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="enroll-tab" data-bs-toggle="tab" href="#enroll"
                                role="tab" aria-controls="enroll" aria-selected="false">가입 커뮤니티</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact"
                                role="tab" aria-controls="contact" aria-selected="false">전체 커뮤니티</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="table-responsive">
		                       <table class="table table-hover table-lg">
		                        <tbody>
		                        <c:forEach var="vo" items="${classicList}">
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">${vo.communityName } > ${vo.boardName}</p>
	                                       <p class=" mb-0" id="mainTitle">
	                                       	<a href="<c:url value='/community/countUpdate?boardNo=${vo.boardNo}&communityNo=${vo.communityNo}&contentNo=${vo.contentNo}'/>">${vo.title}</a></p>	                                      
	                                       <p class=" mb-0">${vo.text }</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/${vo.empImg}'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp${vo.empName} ${vo.posName}
												<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd (E) HH:mm"/> </span>
										   </div>
	                                   </td>
	                               </tr>
		                        </c:forEach>
		                        <c:forEach var="vo" items="${feedList}">
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">${vo.communityName } > ${vo.boardName}</p>
	                                       <p class=" mb-0" id="mainTitle">
	                                       <a href="<c:url value='/community/communityOneFeed?boardNo=${vo.boardNo}&communityNo=${vo.communityNo}'/>"></a>${vo.text}</p>	                                      
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/${vo.empImg}'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp${vo.empName} ${vo.posName}  
												<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd (E) HH:mm"/> </span>
										   </div>
	                                   </td>
	                               </tr>
		                        </c:forEach>
		                       </tbody>
		                     </table>
		                   </div>
                        </div>
                        <div class="tab-pane fade" id="enroll" role="tabpanel"
                            aria-labelledby="enroll-tab"><br>
	                         <!-- Hoverable rows start -->
		                     <div class="row" id="table-hover-row">
	                            <!-- table hover -->
	                                <div class="table-responsive">
	                                    <table class="table table-hover mb-0">
	                                        <thead>
	                                            <tr class="th1">
	                                            	<th>No.</th>
	                                                <th>커뮤니티</th>
	                                                <th>회원수</th>
	                                                <th>전체글</th>
	                                                <th>마스터</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                         <c:if test="${empty communityList}">
	                                         	<tr>
	                                         		<td colspan="5" style="text-align: center">가입한 커뮤니티가 없습니다.</td>
	                                         	</tr>
	                                         </c:if>
	                                         <c:if test="${!empty communityList}">
		                                          <c:forEach var="vo2" items="${communityList}">
		                                              <tr class="tr1">
			                                              <td>${vo2.currentStats}</td>
			                                              <td style="text-align:left; padding-left:30px">
			                                              	<a href="<c:url value='/community/communityOneMain?communityNo=${vo2.communityNo}'/>">
			                                              		${vo2.communityName}</a></td>
			                                              <td>${vo2.memberCount}</td>
			                                              <td>${vo2.writingCount}</td>
			                                              <td>${vo2.communityMaster}</td>
			                                          </tr>
		                                          </c:forEach>
	                                         </c:if>
	                                        </tbody>
	                                    </table>
	                                  </div>
	                               </div>
	                            </div><br> 
		                     <div class="tab-pane fade" id="contact" role="tabpanel"
	                            aria-labelledby="contact-tab">
	                           <!-- Hoverable rows start -->
		                     <div class="row" id="table-hover-row">
	                            <!-- table hover -->
	                                <div class="table-responsive">
	                                    <table class="table table-hover mb-0">
	                                        <thead>
	                                            <tr class="th1">
	                                            	<th>No.</th>
	                                                <th>커뮤니티</th>
	                                                <th>회원수</th>
	                                                <th>마스터</th>
	                                                <th>가입</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                         <c:if test="${empty list}">
	                                         	<tr>
	                                         		<td colspan="4" style="text-align: center">가입한 커뮤니티가 없습니다.</td>
	                                         	</tr>
	                                         </c:if>
	                                         <c:if test="${!empty list}">
		                                       <c:forEach var="vo" items="${list}">
		                                       	 <tr class="tr1">
	                                              <td class="td1">${vo.currentStats}</td>
	                                              <td style="text-align:left; padding-left:30px">
	                                              	<a href="<c:url value='/community/communityOneMain?communityNo=${vo.communityNo}'/>">
	                                              		${vo.communityName}</a></td>
	                                              <td>${vo.memberCount}</td>
	                                              <td>${vo.communityMaster}</td>
	                                            <c:forEach var="No" items="${memNo}">
	                                      			<c:if test="${No.memberNo==empVo.empNo}">
	                                            		<%-- <c:set var="memNumber" value="${No.memberNo}" /> --%>
	                                            		<c:set var="comNo" value="${No.communityNo}" />
	                                            	</c:if>
	                                            </c:forEach>
	                                            <c:forEach var="memNoVo" items="${memNo}">
                                                   <c:if test="${memNoVo.communityNo==vo.communityNo}">
                                                   <span>나옴ㅎ</span>
	                                                   <c:choose>
	                                                       <c:when test="${memNoVo.memberNo==empVo.empNo}">
	                                                       <span>${memNoVo.memberNo}</span>
	                                                           <td>
	                                                           <!-- button trigger for  Vertically Centered modal -->
	                                                           <button type="button" class="btn btn-outline-primary block"
	                                                               data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id="btnOut">탈퇴</button>
	                                                           <%@ include file="outModal.jsp" %>   
	                                                           </td>
	                                                       </c:when>
	                                                       <c:when test="${memNoVo.memberNo!=empVo.empNo}">
	                                                       <span>${memNoVo.memberNo}</span>
	                                                       	   <td>
	                                                           <!-- button trigger for  Vertically Centered modal -->
	                                                           <button type="button" class="btn btn-outline-primary block"
	                                                               data-bs-toggle="modal" data-bs-target="#exampleModalCenter" id="btnEnroll" 
	                                                               onclick="location.href='<c:url value='/community/communityEroll?communityNo=${vo.communityNo}'/>">가입</button>
	                                                           <%@ include file="enrollModal.jsp" %>    
	                                                           </td>
	                                                   	   </c:when>
	                                                   </c:choose>
                                                   </c:if>
                                               </c:forEach> 
	                                          </tr>
										   </c:forEach>
										</c:if>  
									 </tbody>
                                   </table>
                                </div>
                            </div><br>
	                            <div class="paging">
									<nav aria-label="Page navigation example">
										<ul class="pagination pagination-primary pagination-sm justify-content-center">
											<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.firstPage }'>disabled</c:if>">
											<a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">Previous</a></li>
											<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
												<c:if test="${i==pagingInfo.currentPage }">
													<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
												</c:if>
												<c:if test="${i!=pagingInfo.currentPage }">
													<li class="page-item"><a class="page-link" href="#" onclick="pageProc(${i})">${i }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
												<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> 
													<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
												</a>
											</c:if>
											<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a class="page-link" href="#">Next</a></li>
										</ul>
									</nav>
								</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	         </div> 
	       <div class="col-12 col-lg-4">
	           <div class="card">
	               <div class="card-header">
	                   <h4>전체 커뮤니티 정보</h4>
	               </div>
	               <div class="card-body" style="text-align:center;padding:0">
	                 <fieldset class="form-group">
		                 <select class="form-select" id="basicSelect">
		                     <option>가장 회원이 많은 커뮤니티</option>
		                     <option>가장 글이 많은 커뮤니티</option>
		                     <option>가장 최근에 개설한 커뮤니티</option>
		                 </select>
		             </fieldset>
	                   <div class="table-responsive">
	                       <table class="table table-hover table-lg">
	                           <thead>
	                               <tr>
	                                   <th>Name</th>
	                                   <th>Regdate</th>
	                               </tr>
	                           </thead>
	                           <tbody>
		                           <c:if test="${!empty comList}">                           
			                           <c:forEach var="vo" items="${comList}">
			                               <tr>
			                                   <td class="col-3">
			                                       <div class="d-flex align-items-center" style="text-align:left">
			                                           <p class="font-bold ms-3 mb-0" id="cName"><a href="<c:url value='/community/communityOneMain?communityNo=${vo.communityNo}'/>">${vo.communityName}</a></p>
			                                       </div>
			                                   </td>
			                                   <td class="col-auto" style="text-align:left">
			                                       <p class=" mb-0">마스터 : ${vo.communityMaster}</p>
			                                       <p class=" mb-0">개설일자 : <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd (E)"/> </p>
			                                   </td>
			                               </tr>
			                           </c:forEach>
		                           </c:if>
	                           </tbody>
	                       </table>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </section>											
<%@ include file="../include/bottom.jsp" %>