<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ include file="attendanceMenu/attendanceMenu.jsp"%>
<%@ include file="../include/middle_temp_board.jsp"%>

<!-- Contents 영역 추가 -->
<jsp:include page="attendanceContents/attendanceMainContents.jsp">
	<jsp:param name="" value=""/>
</jsp:include>
<%@ include file="../include/bottom.jsp"%>