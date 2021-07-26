<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/top.jsp" %>																
<%@ include file="addrmenu/addrMenu.jsp" %>									
<%@ include file="../include/middle.jsp" %>
									
																
<!-- 전사용 주소록 -->									
									
									
									
<jsp:include page="addrcontent/coAddrContent.jsp">								
	<jsp:param name="" value=""/>
</jsp:include>										
										
										
<%@ include file="../include/bottom.jsp" %>

</body>
</html>