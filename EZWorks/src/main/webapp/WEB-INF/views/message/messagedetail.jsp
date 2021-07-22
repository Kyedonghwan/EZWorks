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
<title>guestbookDetail.jsp</title>
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
	.divForm {
		width: 500px;
		}
	.write-form {
	  width: 70%;
	  margin: 0 auto;
	}
</style>  
</head>
<nav>
<br>
</nav>
<body>
<form class="write-form">
	<h2>쪽지 상세보기</h2>
  <div class="form-group">
    <label for="exampleFormControlInput1">작성자</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="${vo.name}">
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">등록일</label>
    <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="${vo.regdate}">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">쪽지내용</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3">${fn:replace(vo.content, newLine, "<br>") }</textarea>
  </div>
</form>
	<div style="text-align: center">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='<c:url value='/message/messagedelete?no=${param.no}'/>'">쪽지삭제</button>
		<button type="button" class="btn btn-outline-success" onclick="location.href='<c:url value='/message/messageList'/>'">쪽지목록</button>		
</div>

</body>
</html>