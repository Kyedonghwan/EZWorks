<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
	.notice{
		font-size: 0.8em;
		margin:0;
	}
	#intro{
		height: 150px;
	}
	.radioWrapper{
		display: inline-flex;
	}
	#myTabContent{
		padding-top:25px;
	}
	#label{
		padding-top:3px;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>

<%@ include file="../community/sidebar/sidebar2.jsp" %>	
<%@ include file="../include/middle.jsp" %>

<!-- 소메뉴별 컨텐츠 구성 영역 -->		
<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">커뮤니티 이름</h5>
                </div>
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home"
                                role="tab" aria-controls="home" aria-selected="true">정보</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile"
                                role="tab" aria-controls="profile" aria-selected="false">게시판</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact"
                                role="tab" aria-controls="contact" aria-selected="false">멤버</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact"
                                role="tab" aria-controls="contact" aria-selected="false">폐쇄</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                            aria-labelledby="home-tab">
                            <form class="form form-horizontal" method="post" 
                     				action="<c:url value='/community/communityNew'/>">
		                       <div class="form-body">
		                           <div class="row">
		                               <div class="col-md-2" id="label">
		                                   <label>커뮤니티 명</label>
		                               </div>
		                               <div class="col-md-10 form-group">
		                                   <input type="text" id="communityName" class="form-control"
		                                       name="communityName" placeholder="커뮤니티 명을 적어주세요">
		                               </div>
		                               <div class="col-md-2" id="label">
		                                   <label>소개</label>
		                               </div>
		                               <div class="col-md-10 form-group">
		                               		<div class="form-floating">
		                                        <textarea class="form-control" id="intro" name="intro"
		                                         placeholder="커뮤니티 소개글을 간략하게 적어주세요"></textarea>
		                                        <label for="intro">커뮤니티 소개글을 간략하게 적어주세요</label>
		                                    </div>
		                               </div>
		                               <div class="col-md-2" id="label">
		                                   <label>마스터</label>
		                               </div>
		                               <div class="col-md-10 form-group">		    
			                               <div class="me-1 mb-1 d-inline-block">
	                                         <button type="button" class="btn btn-outline-primary block"
	                                             data-bs-toggle="modal" data-bs-backdrop="false" 
	                                             data-bs-target="#backdrop" width:"50px">추가
	                                         </button>
	                                       </div>
	                                       <%@ include file="modal.jsp" %>
		                               </div>
		                               <div class="col-md-2" id="label">
		                                   <label>부마스터</label>
		                               </div>
		                               <div class="col-md-10 form-group">		    
			                               <div class="me-1 mb-1 d-inline-block">
	                                         <button type="button" class="btn btn-outline-primary block"
	                                             data-bs-toggle="modal" data-bs-backdrop="false" 
	                                             data-bs-target="#backdrop" width:"50px">추가
	                                         </button>
	                                       </div>
	                                       <%@ include file="modal.jsp" %>
		                               </div>
		                               <div class="col-md-2" id="label">
		                                   <label>공개여부</label>
		                               </div>
		                               <div class="col-md-10 form-group">
		                               	<div class="radioWrapper">
		                               	  <div class="form-check">
		                                        <input class="form-check-input" type="radio" name="publicSetting"
		                                            id="publicSet1" value="Y" checked>
		                                        <label class="form-check-label" for="publicSet1">공개</label>&nbsp&nbsp&nbsp
		                                  </div>
		                                  <div class="form-check">
		                                  		<input class="form-check-input" type="radio" name="publicSetting"
		                                            id="publicSet2" value="N">
		                                        <label class="form-check-label" for="publicSet2">비공개</label>
		                                    </div>
		                               	</div>
		                               	<div>
		                                   <p class="notice">※ 공개로 설정 할 경우, 멤버가 아니어도 게시물을 열람할 수 있습니다.</p>
		                                   <p class="notice">※ 멤버 초대는 커뮤니티 개설 후에 할 수 있습니다.</p>
		                               	</div>
		                               </div>
		                               <div class="col-sm-12 d-flex justify-content-end">
		                                   <button type="submit" id="btnSubmit" 
		                                   		class="btn btn-primary me-1 mb-1">등록</button>
		                                   <button type="reset" 
		                                   		class="btn btn-light-secondary me-1 mb-1">취소</button>
		                               </div>
		                           </div>
		                       </div>
		                   </form>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel"
                            aria-labelledby="profile-tab">

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
     </section> 
 <%@ include file="../include/bottom.jsp" %> 