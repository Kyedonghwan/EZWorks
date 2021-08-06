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
<title>쪽지수정</title>
<meta charset="utf-8">
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
	
	 h2{
	 	font-size: 30px;
	 	text-align: center;
	 }	
	 
	 .edit-form {
	  width: 70%;
	  margin: 0 auto;
	}
</style> 
</head>
<body>
<div class="edit-form">
<form name="frmEdit" method="post" 
	action="<c:url value='/message/messageEdit'/>"> 
	<input type="hidden" name="no" value="${param.no }">
	
    <fieldset>
    <nav><br></nav>
	<h2>쪽지 수정하기</h2>
       <div class="form-group">
            <label for="name">작성자</label>
            <br><br>
            <input type="text" class="form-control" readonly="readonly" id="name" name="name" placeholder="${vo2.name}"/>
        </div >
        <div class="form-group">  
        	<label for="content">내용</label>      
        	<br><br>
 			<textarea id="content"  class="form-control" name="content" rows="12" cols="40">${vo2.content}</textarea>
        </div>
        <div style="text-align: center">
            <input type = "submit" class="btn btn-primary" value="쪽지수정"/>
            <input type = "Button" class="btn btn-success" value="쪽지목록" 
            	onclick
            ="location.href	='<c:url value='/message/sendList'/>'" />         
        </div>
	</fieldset>
</form>    
<nav><br></nav>
	<hr>
	<footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>
</div>
</body>
</html>