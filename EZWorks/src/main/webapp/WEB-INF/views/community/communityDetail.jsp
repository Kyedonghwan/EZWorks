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
		padding-top:20px;
	}
	#label{
		padding-top:3px;
	}
	hr{
		margin:0;
	}
	#btn1{
		margin-bottom:10px;
	}
</style>

<!-- toastify-->
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<!-- Include Choices-->
<link rel="stylesheet" href="<c:url value='/resources/vendors/choices.js/choices.min.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){	
	$('#btnSubmit').click(function(){
		var boardName = $('input[name=boardName]').val();
		var masterVal = $('#selectMaster option:selected').val();
		var typeVal = $('.radioWrapper1 input[name=Type]:checked').val();		
		var publicVal = $('.radioWrapper2 input[name=publicSet]:checked').val();

		$('input[name=c_boardType]').val(typeVal);
		$('input[name=boardMaster]').val(masterVal);
		
		if(boardName==null || boardName.isEmpty()){
			Toastify({
                text: "게시판 이름을 기입하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('.radioWrapper1 input[name=Type]').focus();
		}else if(masterVal==null || masterVal.isEmpty()){
			Toastify({
                text: "운영자를 선택하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('#selectMaster').focus();
		}else if(typeVal==null || typeVal.isEmpty()){
			Toastify({
                text: "게시판 유형을 선택하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('.radioWrapper1 input[name=Type]').focus();
		}else if(publicVal==null || publicVal.isEmpty()){
			Toastify({
                text: "공개여부를 체크하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			return false;
			$('.radioWrapper2 input[name=publicSet]').focus();
		}else{
			$('.frmWrite').submit();			
		}	
	});
});
</script>

<%@ include file="../community/sidebar/sidebar2.jsp" %>	
<%@ include file="../include/middle.jsp" %>

<!-- 소메뉴별 컨텐츠 구성 영역 -->		
<section class="row">
      <div class="col-12 col-lg-12">
           <div class="card">
               <div class="card-header">
                   <h5 class="card-title">커뮤니티 ${vo.communityName}</h5>
               </div>
               <div class="card-body">
                   <ul class="nav nav-tabs" id="myTab" role="tablist">
                       <li class="nav-item" role="presentation">
                           <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home"
                               role="tab" aria-controls="home" aria-selected="true">정보</a>
                       </li>
                       <li class="nav-item" role="presentation">
                           <a class="nav-link" id="board-tab" data-bs-toggle="tab" href="#board"
                               role="tab" aria-controls="board" aria-selected="false">게시판</a>
                       </li>
                       <li class="nav-item" role="presentation">
                           <a class="nav-link" id="member-tab" data-bs-toggle="tab" href="#member"
                               role="tab" aria-controls="member" aria-selected="false">멤버</a>
                       </li>
                       <li class="nav-item" role="presentation">
                           <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact"
                               role="tab" aria-controls="contact" aria-selected="false">폐쇄</a>
                       </li>
                   </ul><hr>
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
	                                       name="communityName" value="${vo.communityName}">
	                               </div>
	                               <div class="col-md-2" id="label">
	                                   <label>소개</label>
	                               </div>
	                               <div class="col-md-10 form-group">
	                               		<div class="form-floating">
	                                        <textarea class="form-control" id="intro" name="intro">${vo.intro}</textarea>
	                                    </div>
	                               </div>
	                               <div class="col-md-2" id="label">
                                   <label>마스터</label>
	                               </div>
	                               <div class="col-md-10">
	                                  <div class="form-group">
	                                      <select class="choices form-select multiple-remove" id="selectMaster"                                      
	                                          multiple="multiple">
	                                          <optgroup label="가입 멤버 총 ${vo.memberCount}명">
	                                          	<c:forEach var="mem" items="${memList}">
	                                              <option value="${mem.memberNo}">${mem.memberName}</option>
	                                            </c:forEach>  
	                                          </optgroup>
	                                      </select>
	                                  </div>
	                              </div>
                                <div class="col-md-2" id="label">
                                <label>부마스터</label>
	                               </div>
	                               <div class="col-md-10">
	                                  <div class="form-group">
	                                      <select class="choices form-select multiple-remove" id="selectMaster"                                      
	                                          multiple="multiple">
	                                          <optgroup label="가입 멤버 총 ${vo.memberCount}명">
	                                          	<c:forEach var="mem" items="${memList}">
	                                              <option value="${mem.memberNo}">${mem.memberName}</option>
	                                            </c:forEach>  
	                                          </optgroup>
	                                      </select>
	                                  </div>
	                              </div>
	                               <div class="col-md-2" id="label">
	                                   <label>공개여부</label>
	                               </div>
	                               <div class="col-md-10 form-group">
	                               	<div class="radioWrapper">
	                               	  <div class="form-check">
	                                        <input type="hidden" id="publicSetStatus" value="${vo.publicSet}" >
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
                       <div class="tab-pane fade" id="board" role="tabpanel"
                           aria-labelledby="board-tab">
                         <p> 우리 커뮤니티에 개설된 게시판을 변경하거나 삭제 할 수 있습니다.</p>
                         <span>
                         		<button id="btn1" class="btn btn-sm btn-outline-primary" onclick="boardEdit">수정</button>
                         		<button id="btn1" class="btn btn-sm btn-outline-primary" onclick="boardDelete">삭제</button>
                         		<button id="btn1" class="btn btn-sm btn-outline-primary" onclick="boardAdd">추가</button>
                         </span><hr>
						 <!-- Hoverable rows start -->
	                     <div class="row" id="table-hover-row">
	                                <!-- table hover -->
	                                    <div class="table-responsive">
	                                        <table class="table table-hover mb-0">
	                                            <thead>
	                                                <tr>
	                                                    <th>
		                                                   	 <input type="checkbox" id="ck1" class="form-check-input" >
	                                                    </th>
	                                                    <th>게시판</th>
	                                                    <th>게시판 운영자</th>
	                                                    <th>설정</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
		                                            <c:if test="${empty boardList}">
		                                            	<tr>
		                                            		<td colspan="4">등록된 게시판이 없습니다.</td>
		                                            	</tr>
		                                            </c:if>
		                                            <c:if test="${!empty boardList}">
			                                            <c:forEach var="vo1" items="${boardList}">
			                                                <tr>
			                                                    <td>
			     													<input type="checkbox" id="ck2" class="form-check-input" >
				         					                    </td>
			                                                    <td>${vo1.boardName}</td>
			                                                    <td>${vo1.boardMaster }</td>
			                                                    <td>
			                                                    	<button class="btn btn-sm btn-outline-primary" onclick="boardSet">설정</button>
			         											</td>
			                                                </tr>
			                                            </c:forEach>
		                                            </c:if>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                        <div class="tab-pane fade" id="member" role="tabpanel"
	                            aria-labelledby="member-tab">
	                         	<div class="radioWrapper">
                               	  <div class="form-check">
                                        <input class="form-check-input" type="radio" name="enroll"
                                             id="enroll1" value="Y" checked>
                                        <label class="form-check-label" for="enroll">사용중</label>&nbsp&nbsp&nbsp
                                  </div>
                                  <div class="form-check">
                                  		<input class="form-check-input" type="radio" name="enroll"
                                            id="enroll2" value="N">
                                        <label class="form-check-label" for="enroll">가입 승인 대기</label>
                                    </div>
                               	</div><br>
							<p style="margin-top:5px"> 사용 멤버 (총 0명)</p> <hr>
							 <!-- Hoverable rows start -->
				                    <div class="row" id="table-hover-row">
				                                <!-- table hover -->
				                                    <div class="table-responsive">
				                                        <table class="table table-hover mb-0">
				                                            <thead>
				                                                <tr>
				                                                    <th>
					                                                   	 <input type="checkbox" id="ck1" class="form-check-input" >
				                                                    </th>
				                                                    <th>이름</th>
				                                                    <th>소속</th>
				                                                    <th>이메일</th>
				                                                    <th>가입신청일</th>
				                                                    <th>게시글 수</th>
				                                                    <th>탈퇴</th>
				                                                </tr>
				                                            </thead>
				                                            <tbody>
					                                            <c:if test="${empty empList}">
					                                            	<tr>
					                                            		<td colspan="7" style="text-align: center">가입한 멤버가 없습니다.</td>
					                                            	</tr>
					                                            </c:if>
					                                            <c:if test="${!empty empList}">
						                                            <c:forEach var="vo2" items="${empList}">
						                                                <tr>
						                                                    <td>
						     													<input type="checkbox" id="ck2" class="form-check-input" >
							         					                    </td>
						                                                    <td>${vo2.empName}</td>
						                                                    <td>${vo2.deptName }</td>
						                                                    <td>${vo2.email}</td>
						                                                    <td>${vo2.regdate}</td>
						                                                    <td>${vo2.boardNum}</td>
						                                                    <td>
						                                                    	<button id="btn1" class="btn btn-sm btn-outline-primary" onclick="boardEdit">탈퇴</button>
						         											</td>
						                                                </tr>
						                                            </c:forEach>
					                                            </c:if>
				                                            </tbody>
				                                        </table>
				                                    </div>
				                                </div>
				                            </div>
			                        <div class="tab-pane fade" id="contact" role="tabpanel"
			                            aria-labelledby="contact-tab">
			                            <p class="mt-2"></p>
			                        </div>
		                        </div>
		              		 <!-- Hoverable rows end -->
	                    </div>
	                </div>
	            </div>
		</section> 

<!-- Include Choices JavaScript -->	
<script src="<c:url value='/resources/vendors/choices.js/choices.min.js'/>"></script>
		
 <%@ include file="../include/bottom.jsp" %> 