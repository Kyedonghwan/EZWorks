<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ include file="boardMenu/boardMenu.jsp"%>
<%@ include file="../include/middle_temp_board.jsp"%>

<!-- Contents 영역 추가 -->
<jsp:include page="boardContents/boardContentsFeed/boardContentsFeedDetail.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<%@ include file="../include/bottom.jsp"%>