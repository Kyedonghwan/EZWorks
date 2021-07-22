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
	.write-form {
	  width: 70%;
	  margin: 0 auto;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('.btn-success').click(function(){
			location.href="<c:url value='/message/messageList'/>";
		});

	});
</script>
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "2d01734a-cbdf-4f33-b485-746dd3e743e8"
  });
</script>
</head>
<body>
<div>
<form name="frmWrite" method="post" class="write-form"
	action="<c:url value='/message/messageWrite'/>" >
 <fieldset>
 	<br>
	<legend>쪽지 작성</legend>
        <div class="form-group">
            <label for="name">작성자</label>
            <br><br>
            <input type="text" class="form-control" id="name" name="name"/>
        </div >
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <br><br>
            <input type="password" class="form-control" id="pwd" name="pwd"/>
        </div>
        <div class="form-group">  
        	<label for="content">내용</label>      
        	<br><br>
 			<textarea id="content"  class="form-control" name="content" rows="12" cols="40"></textarea>
        </div>
        <div style="text-align: center">
            <input type = "submit" class="btn btn-primary" value="등록"/>
            <input type = "Button" value="쪽지목록" class="btn btn-success" />         
        </div>
         <br><br>
    </fieldset>
</form>
</div>   

 <hr>
  <footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>
</body>
</html>

 	
<%@ include file="../include/bottom.jsp" %>