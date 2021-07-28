<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../include/top.jsp"%>
<style type="text/css">
	#label{
		padding-top:3px;
	}
	.notice{
		font-size: 0.8em;
		margin:0;
	}
	#intro{
		height: 150px;
	}
	.radioWrapper1, .radioWrapper2{
		display: inline-flex;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>

<%@ include file="../../community/sidebar/sidebar2.jsp" %>	
<%@ include file="../../include/middle.jsp" %>

<!-- 소메뉴별 컨텐츠 구성 영역 -->									
	<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">게시판 개설</h5>
                </div>
                <div class="card-body">
                     <form class="form form-horizontal" method="post" 
                     		action="<c:url value='/community/c_boardNew'/>">
                     <input type='hidden' value="${param.communityNo }">
                     <input type='hidden' name="c_boardType" value="">
                     
                       <div class="form-body">
                           <div class="row">
                               <div class="col-md-2" id="label">
                                   <label>게시판 이름</label>
                               </div>
                               <div class="col-md-10 form-group">
                                   <input type="text" id="boardName" class="form-control"
                                       name="boardName" placeholder="게시판 이름을 적어주세요">
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>마스터 이름</label>
                               </div>
                               <div class="col-md-10 form-group">
                                   <input type="text" id="boardMaster" class="form-control"
                                       name="boardMaster" placeholder="운영 마스터 이름을 적어주세요">
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>게시판 설명</label>
                               </div>
                               <div class="col-md-10 form-group">
                               		<div class="form-floating">
                                        <textarea class="form-control" id="intro" name="intro"
                                         placeholder="관련 게시판 설명을 간략하게 적어주세요"></textarea>
                                        <label for="intro">관련 게시판 설명을 간략하게 적어주세요</label>
                                    </div>
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>유형</label>
                               </div>
                               <div class="col-md-10 form-group">
                               	<div class="radioWrapper1">
                               	  <div class="form-check">
                                        <input class="form-check-input" type="radio" name="c_boardType"
                                             id="c_boardClassic" value="Classic" checked>
                                        <label class="form-check-label" for="c_boardType">클래식</label>&nbsp&nbsp&nbsp
                                  </div>
                                  <div class="form-check">
                                  		<input class="form-check-input" type="radio" name="c_boardType"
                                            id="c_boardFeed" value="Feed">
                                        <label class="form-check-label" for="c_boardType">피드</label>
                                    </div>
                               	</div>
                               </div>
                               <div class="col-md-2" id="label">
                                   <label>공개여부</label>
                               </div>
                               <div class="col-md-10 form-group">
                               	<div class="radioWrapper2">
                               	  <div class="form-check">
                                        <input class="form-check-input" type="radio" name="publicSet"
                                             id="publicSet1" value="Y" checked>
                                        <label class="form-check-label" for="publicSet">공개</label>&nbsp&nbsp&nbsp
                                  </div>
                                  <div class="form-check">
                                  		<input class="form-check-input" type="radio" name="publicSet"
                                            id="publicSet2" value="N">
                                        <label class="form-check-label" for="publicSet">비공개</label>
                                    </div>
                               	</div>
                                   <p class="notice">※ 공개로 설정 할 경우, 멤버가 아니어도 게시물을 열람할 수 있습니다.</p>
                                   <p class="notice">※ 게시판 공개여부는 운영자만 설정할 수 있습니다.</p>
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
            </div>
         </div> 
	</section>											
<%@ include file="../../include/bottom.jsp" %> 