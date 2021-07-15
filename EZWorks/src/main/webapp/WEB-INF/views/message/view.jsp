<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<title>쪽지 쓰기</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="${pageContext.servletContext.contextPath}/resources/css/message/write.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/js/message/common.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/message/messageview.js" type="text/javascript"></script>

</head>
<body>
	<nav id="top_gnb">
	    <a href="${pageContext.servletContext.contextPath }/board" class="menu item_1 "></a>
	    <a href="${pageContext.servletContext.contextPath }/calendar" class="menu item_2"></a>
	    <a href="${pageContext.servletContext.contextPath }/searchemployee" class="menu item_3"></a>
	    <a href="${pageContext.servletContext.contextPath }/message" class="menu item_4"></a>
	    <a href="${pageContext.servletContext.contextPath }/mypage" class="menu item_5"></a>
 	 </nav>
		<form name="boardWriteForm" method="post" action="${pageContext.servletContext.contextPath }/write">
			<table class="board_view">
				<colgroup>
					<col width="15%">
					<col width="*" />
				</colgroup>
				<tbody>
					<tr >
						<th scope="row" >발신자</th>
						<td><input id="contentTitle" class="wdp_90" value="${sender}"  readonly style="border:0px;"></input></td>
					</tr>
					<tr>
						<td colspan="2" class="view_text"><textarea rows="20"
								cols="110" title="내용" id="contentContent" name="contentContent" readonly>${message}</textarea></td>
					</tr>

				</tbody>

			</table>
			<input type="hidden" id="employeeNo" name="employeeNo" value=${authUser.employeeNo }>
			<input type="hidden" id="teamId" name="teamId" value=${authUser.teamId }>
			<input type="hidden" id="boardId" name="boardId" value=${boardId }>
			<div class="right">
					<button type="button"  onClick="history.back();">돌아가기</button>
			</div>
				<span>
				</span>
		</form>

	<footer id="main_footer">
		<address>Copyright &copy; <a href="#"></a> (주)EZ Works All Rights Reserved.</address>
		<address>블로그 : <a href="#" >https://blog.naver.com/ha98222</a></address>
		<address>깃허브 : <a href="#" >https://github.com/eykgond/EZWorks</a></address>
    </footer>
</body>
</html>

<%@ include file="../include/bottom.jsp"%>