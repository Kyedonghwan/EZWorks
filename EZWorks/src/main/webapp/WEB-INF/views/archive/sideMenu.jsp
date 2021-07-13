<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
</style>
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
		<ul style="list-style:none">
			<li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">전사자료실</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="component-alert.html">전사 공지</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-badge.html">주간식단표</a>
                    </li>
                    
                    <li class="submenu-item ">
                        <a href="component-breadcrumb.html" style="color:grey" disable="disabled">사내 소식</a>
                    </li>
                    <li class="submenu-item active">
                        <a href="component-button.html">이주의 IT뉴스</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-card.html">다우오피스 소식</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-carousel.html">다우오피스 활용Tip!</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-dropdown.html">사내이벤트</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-list-group.html">사진공모전</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-modal.html">다우오피스 세미나&회의</a>
                    </li>
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