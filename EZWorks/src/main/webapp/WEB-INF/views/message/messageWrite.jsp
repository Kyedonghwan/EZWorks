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
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" /> 
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	h2{
		text-align: center;
	} 

</style>

<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href="<c:url value='/message/messageList'/>";
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
<div class="divForm">
<form name="frmWrite" method="post" 
	action="<c:url value='/message/messageWrite'/>" >
 <fieldset>
	<legend style="text-align: center">쪽지작성</legend>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" class="infobox" />
        </div>
        <div>
            <label for="pwd">패스워드</label>
            <input type="password" id="pwd" name="pwd" class="infobox" />
        </div>
        <div>  
        	<label for="content">내용</label> 
 			<textarea id="content" name="content" rows="12" cols="30"></textarea>
        </div>
        <div class="center">
            <input type = "submit" value="쪽지등록"/>
            <input type = "Button" value="쪽지목록" class="btList"/>         
        </div>
	<footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>
    </fieldset>
</form>
</div>   
</body>
</html>

 	
<%@ include file="../include/bottom.jsp" %>