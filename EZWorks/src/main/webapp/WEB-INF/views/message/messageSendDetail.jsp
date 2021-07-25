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
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href="<c:url value='/message/messageSendList'/>";
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
	
	.a {
         border: 5pt groove #3f51b5;
      }
</style>  
</head>
<nav>
<br>
</nav>
<body>
<form class="write-form">
	<h2 style="text-align: center">답변 작성하기</h2>
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
<div>
<div class="a">
<form class="write-form" name="frmWrite" method="post" 
	action="<c:url value='/message/messageSendDetail'/>" >
 <fieldset>
 	<br>
	<legend>답변작성</legend>
        <div class="form-group">
            <label for="name">작성자</label>
            <br><br>
            <input type="text" class="form-control" id="name" name="name" class="infobox" />
        </div >
        <div class="form-group">  
        	<label for="content">내용</label>      
        	<br><br>
 			<textarea id="content"  class="form-control" name="content" rows="5" cols="40"></textarea>
        </div>
        
    </fieldset>
</form>
</div> 
</div>  
<nav><br></nav>
		<div style="text-align: center">
            <input type = "submit" class="btn btn-primary" value="답변등록"/>
            <input type = "Button" class="btn btn-primary" value="쪽지목록" class="btList"/>         
        </div>

</body>
</html>