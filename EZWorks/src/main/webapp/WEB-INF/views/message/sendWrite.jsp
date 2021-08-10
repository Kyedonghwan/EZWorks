<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" /> 
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>

<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	h2{
		text-align: center;
		font-size: 50px;
	} 
	.write-form {
	  width: 70%;
	  margin: 0 auto;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('.btn-success').click(function(){
			location.href="<c:url value='/message/sendList'/>";
		});
		
		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().text()+"을(를) 입력하세요");
					$(item).focus();
					event.preventDefault();
					return false;
				}
			});
		});
	});
</script>
</head>
<body>
<div>
<form class="write-form" name="frmWrite" method="post" 
	action="<c:url value='/message/sendWrite'/>" >
 <fieldset>
 	<br>
	<h2>답변 작성</h2>
        <div class="form-group">
            <label for="name">작성자</label>
            <br><br>
            <input type="text" class="form-control" id="name" name="name" class="infobox" />
        </div >
        <div class="form-group">  
        	<label for="content">내용</label>      
        	<br><br>
 			<textarea id="content"  class="form-control" name="content" rows="10" cols="40"></textarea>
        </div>
        <div style="text-align: center">
            <input type = "submit" class="btn btn-primary" value="답변작성"/>
            <input type = "Button" class="btn btn-success" value="쪽지목록"/>         
        </div>
    </fieldset>
</form>
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

 	
<%@ include file="../include/bottom.jsp" %>