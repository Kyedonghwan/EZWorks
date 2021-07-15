<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
	
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>이지웍스</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
<link href="${pageContext.servletContext.contextPath}/resources/css/message/message.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="${pageContext.servletContext.contextPath }/resources/js/message/common.js" type="text/javascript"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/message/message.js" type="text/javascript"></script>
</head>
<body>

 <nav id="top_gnb">
    <a href="${pageContext.servletContext.contextPath }/board" class="menu item_1 "></a>
    <a href="${pageContext.servletContext.contextPath }/calendar" class="menu item_2"></a>
    <a href="${pageContext.servletContext.contextPath }/searchemployee" class="menu item_3"></a>
    <a href="${pageContext.servletContext.contextPath }/message" class="menu item_4"></a>
    <a href="${pageContext.servletContext.contextPath }/mypage" class="menu item_5"></a>
 </nav>


<div id="sendForm" title="메세지 전송">
  <form>
    <fieldset>
      <label for="name">전송할 내용을 입력하세요</label>
      <input type="hidden" name="selectedEmail" id="selectedEmail">
 	  <textarea id = "messageArea" rows="15" cols="48" name="contents"></textarea>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>

 <c:import url="/WEB-INF/views/include/message_form.jsp"/>
	<footer id="main_footer">
		<address>Copyright &copy; <a href="#"></a> (주)EZ Works All Rights Reserved.</address>
		<address>블로그 : <a href="#" >https://blog.naver.com/ha98222</a></address>
		<address>깃허브 : <a href="#" >https://github.com/eykgond/EZWorks</a></address>
    </footer>

</body>
</html>

<%@ include file="../include/bottom.jsp"%>