<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>

<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>메시지 리스트</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" />
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script type="text/javascript">	
	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
	
</script>

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<nav>
<br>
</nav>
<h2 style="text-align: center">쪽지 리스트</h2>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.	searchKeyword}, ${pagingInfo.totalRecord} 건 검색되었습니다.</p>
</c:if>



<table class="table table-striped">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:20%;" />
		<col style="width:20%;" />	
	</colgroup>
	<thead>
	  <tr style="text-align: center">
	    <th scope="col">번호</th>
	    <th scope="col">내용</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	  </tr>
	</thead> 
	<tbody> 
		<c:if test="${empty list }">
			<tr>
				<td colspan="5" class="align_center">null!!</td>
			</tr>
		</c:if>		
		<c:if test="${!empty list }">			 
		  	<!-- 반복문 시작  -->		
		  	<c:forEach var="vo" items="${list }">			 
				<tr class="align_center">
					<td>${vo.no}</td>
					<td>
						<a href
						="<c:url value='/message/messagedetail?no=${vo.no }'/>">
							${vo.content}
						</a>
					</td>
					<td>${vo.name}</td>
					<td>
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>	
					</td>
				</tr> 
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	 </tbody>
</table>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전페이지</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">다음페이지</a>
    </li>
  </ul>
</nav>

</body>
</html>

<%@ include file="../include/bottom.jsp" %>