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
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>

<%@ include file="../community/sidebar/sidebar1.jsp" %>
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
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
                            <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile"
                                role="tab" aria-controls="profile" aria-selected="false">가입 커뮤니티</a>
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
		                        <c:forEach var="vo2" items="${viewList}">
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">${vo2.communityName } > ${vo2.boardName}</p>
	                                       <p class=" mb-0" id="mainTitle">${vo2.title}</p>	                                      
	                                       <p class=" mb-0">${vo2.text }</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/1.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp${vo2.name } 
												<fmt:formatDate value="${vo2.regdate }" pattern="yyyy-MM-dd (E) HH:mm"/> </span>
										   </div>
	                                   </td>
	                               </tr>
		                        </c:forEach>
		                       </tbody>
		                     </table>
		                   </div>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel"
                            aria-labelledby="profile-tab">
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel"
                            aria-labelledby="contact-tab">
                            <p class="mt-2">
                            
                            </p>
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
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">1. EZ Works 마케팅</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 김윤경</p>
                                       <p class=" mb-0">개설일자 : 2015-10-07(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="col-3">
                                       <div class="d-flex align-items-center">
                                           <p class="font-bold ms-3 mb-0" id="cName">2. A-팀 프로젝트</p>
                                       </div>
                                   </td>
                                   <td class="col-auto">
                                       <p class=" mb-0">마스터 : 구자현</p>
                                       <p class=" mb-0">개설일자 : 2016-02-03(수)</p>
                                   </td>
                               </tr>
                           </tbody>
                       </table>
                   </div>
               </div>
           </div>
       </div>
	</section>											
<%@ include file="../include/bottom.jsp" %>