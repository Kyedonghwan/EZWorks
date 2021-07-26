<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style type="text/css">
	#btnLight{
		margin-left:8px;
	}
	.btn btn-light{
		padding:0;
	}
	#btnMenu{
		width:160px;
	}
	#btnWrite{
		text-align: center;
		margin-top:5px;
		margin-left:8px;
	}
	.sp1{
		font-size:0.8em;
		padding:0;
		width:200px;
		text-align: left;
	}
	.sp2{
		display: inline-flex;
		align-items: center;
		flex-wrap: nowrap;
	}
	img#gear{
		float:right;
		margin-top:2.5px;
	}
	.dropdown-menu.show {
	    /* width: min-content; */
	    min-width: auto;
	}
</style>	    
	<div class="card-header">
	   <h5 class="card-title">커뮤니티</h5> 
	</div>
	<div class="card-body" style="height:725px">
		 <div class="btn-group dropdown me-1 mb-1" id="btnLight">
            <button type="button" class="btn btn-light">
            	<i class="bi bi-chevron-left"></i>
            </button>
            <button type="button"
                class="btn btn-light dropdown-toggle dropdown-toggle-split"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                data-reference="parent" id="btnMenu">
                <span>${vo.communityName}
                <img id="gear" src="<c:url value='/resources/images/accordion/gear.svg'/>" align="absmiddle"></span>
            </button>
            <div class="dropdown-menu">
				<c:forEach var="vo" items="${list}">
                  <span class="sp2">
                   <a class="dropdown-item" href="<c:url value='/community/communityOne?communityNo=${vo.communityNo}'/>">${vo.communityName}</a>
	               <a href="<c:url value='/community/communityDetail?communityNo=${vo.communityNo}'/>">
				   <img id="gear" src="<c:url value='/resources/images/accordion/gear.svg'/>" align="absmiddle"></a></span>
				</c:forEach>
            </div>
        </div><br>
	   <div class="buttons" id="btnWrite">
          <a href="<c:url value='/community/c_boardWrite?communityNo=${vo.communityNo}'/>" class="btn btn-outline-primary" style="width:200px">글쓰기</a>
       </div>
       <div class="board">
       <c:forEach var="vo2" items="${boardList}">
       	  <span class="sp1"><a class="dropdown-item" href="#">${vo2.boardName}
         	<img id="gear" src="<c:url value='/resources/images/accordion/gear.svg'/>" align="absmiddle"></a></span>
       </c:forEach>
          <span class="sp1"><a class="dropdown-item" href="<c:url value='/community/c_boardNew?communityNo=${vo.communityNo }'/>">+ 게시판 추가</a></span>
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