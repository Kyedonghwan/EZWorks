<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<title>쪽지작성</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="${pageContext.servletContext.contextPath}/resources/css/message/write.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/message/common.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/message/write.js" type="text/javascript"></script>
<!-- Channel Plugin Scripts -->
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
<!-- End Channel Plugin -->

</head>
<body>

		<form name="boardWriteForm" method="post" action="${pageContext.servletContext.contextPath }/board/write">
			<table class="board_view">
				<colgroup>
					<col width="15%">
					<col width="*" />
				</colgroup>
				<caption id="title">${boardName}</caption>
				<tbody>
					<tr>
						<th scope="row" >제목</th>
						<td><input  type="text" id="contentTitle" name="contentTitle" class="wdp_90"></input></td>
					</tr>
					<tr>
						<td colspan="2" class="view_text"><textarea rows="20"
								cols="110" title="내용" id="contentContent" name="contentContent"></textarea></td>
					</tr>

				</tbody>

			</table>
			<input type="hidden" id="employeeNo" name="employeeNo" value=${authUser.employeeNo }>
			<input type="hidden" id="teamId" name="teamId" value=${authUser.teamId }>
			<input type="hidden" id="boardId" name="boardId" value=${boardId }>
			<div class="center">
					<button id="submit">작성하기</button> 
					<button type="button"  onclick = "location.href = '${pageContext.servletContext.contextPath }/board?boardId=${boardId }' ">돌아가기</button>
			</div>
			
				<span>
				</span>
		</form>
		
		
</body>

</html>

<%@ include file="../include/bottom.jsp" %>
