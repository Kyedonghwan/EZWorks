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
			<a href="<c:url value='/message/messageWrite'/>" class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				쪽지작성
			</a>
	</div>
</section>
