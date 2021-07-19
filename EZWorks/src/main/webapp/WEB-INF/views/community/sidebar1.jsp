<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.btn btn-light{
		padding:0;
	}
	#btnWrite{
		text-align: center;
		margin-left:8px;
	}
	#headingOne{
		padding:0;
		padding-top:5px;
		padding-left:8px;
	}
	.listContent{
		margin-left:13px;
		width: 195px;
		padding-left: 15px;
	}
</style>    
<div class="card-header">
	   <h5 class="card-title">커뮤니티</h5> 
	</div>
	<div class="card-body" style="height:760px">
	   <div class="buttons" id="btnWrite">
          <a href="<c:url value='/community/communityNew'/>" 
           	class="btn btn-outline-primary" style="width:200px">커뮤니티 만들기</a>
       </div>
       <div class="accordion" id="cardAccordion">
        <div class="card">
            <div class="card-header" id="headingOne" data-bs-toggle="collapse"
                data-bs-target="#collapseOne" aria-expanded="false"
                aria-controls="collapseOne" role="button">
             <span><img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
	         <span class="collapsed collapse-title">가입 커뮤니티</span>
            </div>
            <div id="collapseOne" class="collapse pt-1" aria-labelledby="headingOne"
                data-parent="#cardAccordion">
	        <div class="listContent">
             <span><a href="<c:url value='/community/communityOne'/>">YOLO EZ</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>" style="float:right">
             </span><br>
             <span><a href="">BLIND</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right">
             </span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">아이디어 공유</a></span><br>
             <span><a href="">독서합시다</a>
             	<img src="<c:url value='/resources/images/accordion/gear.svg'/>"style="float:right">
             </span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">A-팀 프로젝트</a></span><br>
             <span><img src="<c:url value='/resources/images/accordion/hold2.png'/>">
             	<a href="">운동합시다</a></span><br>
	         </div>
	       </div>
	     </div>             
	   </div>
     </div>	