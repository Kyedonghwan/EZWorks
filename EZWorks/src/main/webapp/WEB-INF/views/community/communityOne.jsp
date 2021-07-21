<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.btn btn-light{
		padding:0;
	}
	#btnMenu{
		width:160px;
	}
	#btnWrite{
		text-align: center;
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
	.col-auto{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
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
                    <h5 class="card-title">커뮤니티 글</h5>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="table-responsive">
		                       <table class="table table-hover table-lg">
		                        <tbody>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">인사드리겠습니다 ^^</p>	                                      
	                                       <p class=" mb-0">안녕하세요! 홍길동입니다! ㅎㅎ 힘든 암벽하고, 맛있는 음식 먹으러가요!</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/1.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp홍길동 과장 2018-02-21(수) 14:52</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > Wish list 적고 가세요!</p>
	                                       <p class=" mb-0" id="mainTitle">안녕하세요! 발도장 찍고갑니다</p>	                                      
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/1.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp홍길동 과장 2018-02-21(수) 14:51</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">암벽은 처음이라 ^^</p>	                                      
	                                       <p class=" mb-0">안녕하세요! 김길동 부장입니다! 제가 암벽을 잘 따라갈지 너무 걱정이네요 ㅎ 그래도 열심해 해볼게요~</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/2.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp김길동 부장 2018-02-21(수) 14:10</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > Wish list 적고 가세요!</p>
	                                       <p class=" mb-0" id="mainTitle">해외로도 나가나요? 오사카도 좋은데~</p>	                                      
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/2.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp김길동 부장 2018-02-21(수) 14:35</span>
										   </div>
	                                   </td>
	                               </tr>
	                               <tr>
	                                   <td class="col-auto">
	                                       <p class=" mb-0">YOLO EZ > 암벽클라이밍 동호회</p>
	                                       <p class=" mb-0" id="mainTitle">안녕하세요~</p>	                                      
	                                       <p class=" mb-0">안녕하세요~~ 박길동 상무입니다 ^^ 제가 등산은 좀 해봤는데, 암벽은 한번도 안해봐서 서툴지만 잘 부탁드려요! 허허 ^^</p>
	                                       <div class="avatar avatar-md">
												<img src="<c:url value='/resources/images/faces/3.jpg'/>">
												<span class="mb-0" id="sp2">&nbsp&nbsp박길동 상무 2018-02-21(수) 13:58</span>
										   </div>
	                                   </td>
	                               </tr>
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
	</section>											
<%@ include file="../include/bottom.jsp" %>