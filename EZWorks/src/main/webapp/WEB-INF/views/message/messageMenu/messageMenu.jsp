<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">

<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	h5{
		 text-align: center;
	} 
	.dropdown{
		font-size: 30px;
		text-align:center;
		margin: 0 auto;
	}

</style>
<br><br>
<section style="height:64px;padding:24px 24px 16px;">
	
	<h5>
		<a style="font-size: 150%">쪽지</a>
	</h5>
</section>


<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="<c:url value='/message/messageWrite'/>" class="btn btn-primary" style="width:100%;font-size:0.85em;">
				쪽지작성
			</a>
			<nav><br></nav>
			<a href="<c:url value='/message/messageList'/>" class="btn btn-outline-success" style="width:100%;font-size:0.85em;">
				받은 쪽지함
			</a>
			<nav><br></nav>
			<a href="<c:url value='/message/sendList'/>" class="btn btn-outline-warning" style="width:100%;font-size:0.85em;">
				보낸 쪽지함
			</a>
			
	</div>
</section>



