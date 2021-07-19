<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../include/top.jsp"%>
<style type="text/css">
	#btnMenu{
		width:160px;
	}
	.sp1{
		font-size:0.8em;
		padding:0;
		width:200px;
		text-align: left;
	}
	.col-12 col-lg-12{
		padding:0;
	}
	#btnWrite{
		text-align: center;
	}
	#headingOne{
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
	<div class="card-header">
	   <h5 class="card-title">커뮤니티</h5> 
	</div>
	<div class="card-body" style="height:725px">
		 <div class="btn-group dropdown me-1 mb-1">
            <button type="button" class="btn btn-light">
            	<i class="bi bi-chevron-left"></i>
            </button>
            <button type="button"
                class="btn btn-light dropdown-toggle dropdown-toggle-split"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                data-reference="parent" id="btnMenu">
                <span>YOLO EZ <img src="<c:url value='/resources/images/accordion/gear.svg'/>" style="float:right"></span>
            </button>
            <div class="dropdown-menu">
                  <span><a class="dropdown-item" href="#">
                  	YOLO EZ<img src="<c:url value='/resources/images/accordion/gear.svg'/>" style="float:right"></a></span>
	              <span><a class="dropdown-item" href="#">
	              	BLIND<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right"></a></span>
	              <span><a class="dropdown-item" href="#">
	              	<img src="<c:url value='/resources/images/accordion/hold2.png'/>"> 아이디어 공유</a></span>
	              <span><a class="dropdown-item" href="#">
	              	독서합시다<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right"></a></span>
	              <span><a class="dropdown-item" href="#">
	              	<img src="<c:url value='/resources/images/accordion/hold2.png'/>"> A-팀 프로젝트</a></span>
	              <span><a class="dropdown-item" href="#">
	              	<img src="<c:url value='/resources/images/accordion/hold2.png'/>"> 운동합시다</a></span>
             	<div class="dropdown-divider"></div>
            </div>
        </div><br><br>
	   <div class="buttons" id="btnWrite">
          <a href="<c:url value='/community/communityWrite'/>" class="btn btn-outline-primary" style="width:200px">글쓰기</a>
       </div>
       <div class="board">
       	  <span class="sp1"><a class="dropdown-item" href="#">Wish list 적고 가세요
         	<img src="<c:url value='/resources/images/accordion/gear.svg'/>" style="float:right"></a></span>
          <span class="sp1"><a class="dropdown-item" href="#">암벽클라이밍 동호회
         	<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right"></a></span>
          <span class="sp1"><a class="dropdown-item" href="#">+ 게시판 추가</a></span>
       </div><br>  
        <div class="member">
          <p style="font-size:0.9em">가입 멤버 5</p>
         	 <div class="avatar avatar-md">
	       	  <span class="sp1"><a class="dropdown-item" href="#">
	       	  	<img src="<c:url value='/resources/images/faces/1.jpg'/>"> 홍길동 과장</a></span></div>
	          <div class="avatar avatar-md">
	          <span class="sp1"><a class="dropdown-item" href="#">
	       	  	<img src="<c:url value='/resources/images/faces/2.jpg'/>"> 김길동 부장</a></span></div>
	       	  <div class="avatar avatar-md">
	       	  <span class="sp1"><a class="dropdown-item" href="#">
	       	  	<img src="<c:url value='/resources/images/faces/3.jpg'/>"> 박길동 상무</a></span></div>
	       	  <div class="avatar avatar-md">
	       	  <span class="sp1"><a class="dropdown-item" href="#">
	       	  	<img src="<c:url value='/resources/images/faces/4.jpg'/>"> 최길동 대리</a></span></div>
	       	  <div class="avatar avatar-md">
	       	  <span class="sp1"><a class="dropdown-item" href="#">
	       	  	<img src="<c:url value='/resources/images/faces/5.jpg'/>"> 이길동 대표</a></span></div>		
          <span class="sp1"><a class="dropdown-item" href="#">+ 초대하기</a></span>
       </div>           
	</div>	

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
	                                         <!-- Button trigger for small size modal modal -->
	                                         <button type="button" class="btn btn-primary rounded-pill" data-bs-toggle="modal"
	                                             data-bs-target="#primary">추가</button>

	                                         <!--small size modal -->
	                                         <div class="modal fade text-left" id="small" tabindex="-1" role="dialog"
	                                             aria-labelledby="myModalLabel19" aria-hidden="true">
	                                             <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-sm"
	                                                 role="document">
	                                                 <div class="modal-content">
	                                                     <div class="modal-header bg-primary">
	                                                         <h4 class="modal-title white" id="myModalLabel19">Small Modal</h4>
	                                                         <button type="button" class="close" data-bs-dismiss="modal"
	                                                             aria-label="Close">
	                                                             <i data-feather="x"></i>
	                                                         </button>
	                                                     </div>
	                                                     <div class="modal-body">
	                                                         Biscuit chocolate cake gummies. Lollipop I love macaroon
	                                                         bear claw
	                                                         caramels. I love
	                                                         marshmallow tiramisu I love fruitcake I love gummi bears.
	                                                         Carrot cake topping liquorice. Pudding caramels liquorice
	                                                         sweet I love.
	                                                         Donut powder cupcake
	                                                         ice cream tootsie roll jelly.
	                                                     </div>
	                                                     <div class="modal-footer">
	                                                         <button type="button" class="btn btn-light-secondary btn-sm"
	                                                             data-bs-dismiss="modal">
	                                                             <i class="bx bx-x d-block d-sm-none"></i>
	                                                             <span class="d-sm-block d-none">Close</span>
	                                                         </button>
	                                                         <button type="button" class="btn btn-primary ml-1 btn-sm"
	                                                             data-bs-dismiss="modal">
	                                                             <i class="bx bx-check d-block d-sm-none"></i>
	                                                             <span class="d-sm-block d-none">Accept</span>
	                                                         </button>
	                                                     </div>
	                                                 </div>
	                                             </div>
	                                         </div>
	                                     </div>
		                               </div>
		                               <div class="col-md-2" id="label">
		                                   <label>부마스터</label>
		                               </div>
		                               <div class="col-md-10 form-group">
		                                   <input type="text" id="communityName" class="form-control"
		                                       name="communityName" placeholder="커뮤니티 명을 적어주세요">
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