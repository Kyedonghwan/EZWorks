<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	#gear{
		float:right;
		margin-top:2.5px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#headingOne').click(function(){
			if($(this).prop('class')=="card-header collapsed"){
				$('#headingOne span img').attr('src',"<c:url value='/resources/images/accordion/chevron-right.svg'/>");				
			}else if($(this).prop('class')=="card-header"){
				$('#headingOne span img').attr('src',"<c:url value='/resources/images/accordion/chevron-down.svg'/>");
			}
		});
	});
</script>    
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
             <span id="chevronRight"><img src="<c:url value='/resources/images/accordion/chevron-right.svg'/>"></span> 가입한 커뮤니티
	         <span class="collapsed collapse-title">${vo.communityName}</span>
            </div>
            <div id="collapseOne" class="collapse pt-1" aria-labelledby="headingOne"
                data-parent="#cardAccordion">
	        <div class="listContent">
		        <c:if test="${!empty list}">
			        <c:forEach var="vo" items="${list}">
			             <span>
			             	<a href="<c:url value='/community/communityOne?communityNo=${vo.communityNo}'/>">${vo.communityName}</a>
			             	<a href="<c:url value='/community/communityDetail?communityNo=${vo.communityNo}'/>">
			             	<img id="gear" src="<c:url value='/resources/images/accordion/gear.svg'/>" align="absmiddle"></a>
			             </span><br>
			        </c:forEach>
		        </c:if>
		     </div>
	       </div>
	     </div>             
	   </div>
     </div>	