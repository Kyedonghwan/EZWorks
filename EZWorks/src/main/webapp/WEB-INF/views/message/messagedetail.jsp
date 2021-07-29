<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>메시지 상세보기</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/mystyle.css'/>" />
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }

	.write-form {
	  width: 70%;
	  margin: 0 auto;
	}
	
	 h2{
	 	font-size: 30px;
	 	text-align: center;
	 }	
	 
</style>  
</head>
<nav>
<br>
</nav>
<body>
<form class="write-form">
	<h2>받은쪽지 상세보기</h2>
  <div class="form-group">
    <label for="exampleFormControlInput1">작성자</label>
    <input type="email" class="form-control" readonly="readonly" id="exampleFormControlInput1" placeholder="${vo.name}">
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">등록일</label>
    <input type="email" class="form-control" readonly="readonly" id="exampleFormControlInput1" placeholder="${vo.regdate}">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">쪽지내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" readonly="readonly" rows="3">${fn:replace(vo.content, newLine, "<br>") }</textarea>
  </div>
</form>
	<div style="text-align: center">
		<button type="button" class="btn btn-outline-success" onclick="location.href='<c:url value='/message/sendWrite'/>'">답변</button>		
		<a href='<c:url value='/message/messageEdit?no=${param.no}'/>'>
				<button type="button" class="btn btn-outline-warning">수정</button></a>			
		<button type="button" class="btn btn-outline-primary" onclick="location.href='<c:url value='/message/messagedelete?no=${param.no}'/>'">쪽지삭제</button>
		<button type="button" class="btn btn-outline-success" onclick="location.href='<c:url value='/message/messageList'/>'">쪽지목록</button>		
	</div>
	<nav><br></nav>
	<hr>
	<footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>

</body>
</html>