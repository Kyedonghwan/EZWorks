<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>이지웍스</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="${pageContext.servletContext.contextPath}/resources/css/message/write.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/message/common.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/message/write.js" type="text/javascript"></script>

</head>
<body>

	<c:import url="/WEB-INF/views/includes/header.jsp" />
	<c:import url="/WEB-INF/views/includes/top_gnb.jsp" />
		<form name="boardWriteForm" method="post" action="${pageContext.servletContext.contextPath }/board/write">
			<table class="board_view">
				<colgroup>
					<col width="15%">
					<col width="*" />
				</colgroup>
				<caption id="title">${boardName} 게시글작성</caption>
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
			<div class="right">
					<button id="submit">작성하기</button> 
					<button type="button"  onclick = "location.href = '${pageContext.servletContext.contextPath }/board?boardId=${boardId }' ">돌아가기</button>
			</div>
				<span>
				</span>
		</form>
	<footer id="main_footer">
		<address>Copyright &copy; <a href="#"></a> (주)Ez Works All Rights Reserved.</address>
		<address>블로그 : <a href="#" >https://blog.naver.com/ha98222</a></address>
		<address>깃허브 : <a href="#" >https://github.com/eykgond/EZWorks</a></address>
    </footer>
</body>
</html>

<%@ include file="../include/bottom.jsp" %>
