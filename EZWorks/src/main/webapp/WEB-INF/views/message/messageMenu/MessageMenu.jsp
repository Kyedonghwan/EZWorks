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
		<a>쪽지</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="<c:url value='/message/messageWrite'/> class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				쪽지쓰기
			</a>
	</div>
</section>
<section>
	<div>
		<ul style="list-style:none">
			<li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">기능</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="component-alert.html">받은쪽지함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-badge.html">보낸쪽지함</a>
                    </li>           
                    <li class="submenu-item ">
                        <a href="component-alert.html">휴지통</a>
                    </li>
                   
                </ul>
             </li>
             
         </ul>
	</div>
</section>