<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	ul.submenu.active {
    	padding-left: 20px;
	}
	.sideMenu-ul{
		padding-left:1rem;
	}
</style>
<script>
	$(function(){
		$('.chevron-right').click(function(){
			if($(this).children('img').attr("class")=="fold"){
				$(this).children('img').attr("src","<c:url value='/resources/images/accordion/chevron-down.svg'/>");
				$(this).children('img').attr("class","unfold");
			}else{
				$(this).children('img').attr("src","<c:url value='/resources/images/accordion/chevron-right.svg'/>");
				$(this).children('img').attr("class","fold");
			}
		});
		
	})
</script>
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a>자료실</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="#" id="fileUpload" class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				파일 업로드
			</a>
	</div>
</section>
<section>
	<div>
		<ul style="list-style:none" class="sideMenu-ul">
			<li class="sidebar-item active has-sub">
				<a href="#" class="sidebar-link chevron-right">
               		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
               	</a>
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">전사자료실</span>
                </a>
                <ul class="submenu active" style="list-style:none;">
                	<c:if test="${!empty archiveFolderList }">
	                	<c:forEach var="vo" items="${archiveFolderList }"> 
	                		<c:if test="${vo.step==1}">
			                    <li class="sidebar-item active has-sub">
			                    	<c:if test="${vo.hasChild=='Y'}">
				                    	<a href="#" class="sidebar-link chevron-right">
				                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
				                    	</a>
			                    	</c:if>
			                        <a href="#">${vo.name}</a>
			                        <c:if test="${vo.hasChild=='Y'}">
				                        <ul class="submenu active" style="list-style:none">
				                    		<!-- forEach -->
				                    		<c:forEach var="vo2" items="${archiveFolderList }"> 
				                    			<c:if test="${vo2.step==2 && vo2.parentNo==vo.no}">
				                    				 <li class="sidebar-item active has-sub">
				                    				 	<c:if test="${vo2.hasChild=='Y'}">
									                    	<a href="#" class="sidebar-link chevron-right">
									                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
									                    	</a>
								                    	</c:if>
								                    	<a href="#">${vo2.name}</a>
						                    			<c:if test="${vo2.hasChild=='Y'}">
						                    				<ul class="submenu active" style="list-style:none">
									                    		<c:forEach var="vo3" items="${archiveFolderList }">
									                    			<c:if test="${vo3.step==3 && vo3.parentNo==vo2.no}">
									                    				 <li class="sidebar-item active has-sub">
									                    				 	<c:if test="${vo3.hasChild=='Y'}">
														                    	<a href="#" class="sidebar-link chevron-right">
														                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
														                    	</a>
													                    	</c:if>
													                    	<a href="#">${vo3.name}</a>
											                    			<c:if test="${vo3.hasChild=='Y'}">
											                    				<ul class="submenu active" style="list-style:none">
														                    		<c:forEach var="vo4" items="${archiveFolderList }">
														                    			<c:if test="${vo4.step==4 && vo4.parentNo==vo3.no}">
														                    				<li class="submenu-item">
																                    			<a href="#">${vo4.name}</a>
																                    		</li>
														                    			</c:if>
														                    		</c:forEach>
														                    	</ul>
											                    			</c:if>
									                    				 </li>
									                    			</c:if>
									                    		</c:forEach>
									                    	</ul>
						                    			</c:if>
				                    				 </li>
				                    			</c:if>
	                    					</c:forEach>	
				                    	</ul>
				                    </c:if>
			                    </li>
		                    </c:if>
		                  </c:forEach>
	                 </c:if>
                </ul>
             </li>
             <br>
             <li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">개인자료실</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="sidebar-item active has-sub">
                        <a href="#" class='sidebar-link'>영업팀<!-- require parameter --></a>
                    	<ul class="submenu active" style="list-style:none">
                    		<!-- forEach -->
                    		<li class="submenu-item">
                    			<a href="#">영업실적보고</a>
                    		</li>
                    		<li class="submenu-item">
                    			<a href="#">익명게시판</a>
                    		</li>
                    		<li class="submenu-item">
                    			<a href="#">영업실적보고</a>
                    		</li>
                    	</ul>
                    
                    </li>
                </ul>
             </li>
             <li>
             	<a href="#" style="font-weight:bold;color:#999">
             		+ 자료실 추가
             	</a>
             </li>
             
         </ul>
	</div>
</section>