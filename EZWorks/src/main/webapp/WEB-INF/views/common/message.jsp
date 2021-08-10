<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
</head>
<body>
<%
	String msg=(String)request.getAttribute("msg");
	String url=(String)request.getAttribute("url");
	
	String ctxPath = request.getContextPath();  //=> /mymvc
	url = ctxPath+url;  //=> /mymvc + /pd/pdList.do
						//=> /mymvc/pd/pdList.do
							
							
							
%>

<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>
<script type="text/javascript">

alert("<%=msg%>");

	location.href="<%=url%>";
</script>

</body>
</html>



