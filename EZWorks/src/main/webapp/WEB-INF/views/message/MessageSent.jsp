<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#delete').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
	});
	function messageList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action="<c:url value='/message/MessageSent'/>">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->
<title>보낸 쪽지함</title>
  <div align="center" class="col-13 col-sm-7 col-md-9">
  	<table class="table table-striped">
  <thead class="thead-dark">
    <tr>
      <th scope="col">no</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">작성일</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty list }">
  	<tr>
  		<td colspan="5">보낸 쪽지가 없습니다.</td>
  	</tr>
  </c:if>
  <c:if test="${!empty list }">
  	<c:forEach var="vo" items="${list }">
	  	<tr>
	      <th scope="row">${vo.messageNo }</th>
	      <td><c:if test="${fn:length(vo.messageTitle)>5 }">
				${fn:substring(vo.messageTitle, 0, 5) }...
			</c:if> 
			<c:if test="${fn:length(vo.messageTitle)<=5 }">
				${vo.messageTitle}
			</c:if>
		</td>
	      <td><a href="<c:url value='/message/MessageDetail?messageNo=${vo.messageNo }'/>">
	      	<c:if test="${fn:length(vo.messageContent)>10 }">
				${fn:substring(vo.messageContent, 0, 10) }...
			</c:if> 
			<c:if test="${fn:length(vo.messageContent)<=10 }">
				${vo.messageContent}
			</c:if>
	      </a></td>
	      <td><fmt:formatDate value="${vo.messageRegdate }" type="date" pattern="yyyy-MM-dd"/></td>
	      <td><a id="delete" href="<c:url value='/message/deleteMessage?messageNo=${vo.messageNo }'/>">삭제</a>
	      </td>
	    </tr>
  	</c:forEach>
  	
  </c:if>
  </tbody>
</table>
  <br>
  <ul class="pagination justify-content-center" >
	<c:if test="${pagingInfo.firstPage>1 }">
		<li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous" onclick="messageList(${pagingInfo.firstPage-1})">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
		</li>
	</c:if>
    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
		<li class="page-item">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color:blue;font-weight:bold" class="page-link" >${i }</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">						
				<a class="page-link" href="#" onclick="messageList(${i})">${i }</a>
			</c:if>		
		</li>
	</c:forEach>
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<li class="page-item">
		      <a class="page-link" href="#" aria-label="Next" onclick="messageList(${pagingInfo.lastPage+1})">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		</li>
	</c:if>
  </ul>
  </div>


<%@ include file="../include/bottom.jsp" %> 