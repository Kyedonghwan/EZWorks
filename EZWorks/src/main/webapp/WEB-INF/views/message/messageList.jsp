<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/MessageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>
<nav id="top_gnb">
<a href="${pageContext.servletContext.contextPath }/searchemployee" class="menu item_1"></a>
<a href="${pageContext.servletContext.contextPath }/message" class="menu item_2"></a>
</nav>
<br>
<br>

<h2>쪽지 리스트</h2>
<br>
<br>
<br>
<table class="board_list">
	<colgroup>
		<col width="10%" />
		<col width="*" />
		<col width="15%" />
		<col width="20%" />
	</colgroup>

	<thead>
		<tr>
			<th scope="col">발신자</th>
			<th scope="col">내용</th>
			<th scope="col">수신시간</th>
			<th scope="col">답장</th>
			<th scope="col">삭제</th>

		</tr>
	</thead>
	<tbody>
		        <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list }" var="row">
                       
                        <tr>
                            <td>${row.sender }</td>
                            <td class="title">
                                <a href="${pageContext.request.contextPath }/message/view?messageId=${row.messageId}">
                                
							          <c:choose>
							           <c:when test="${fn:length(row.message) > 23}">
							            <c:out value="${fn:substring(row.message,0,23)}"/>....
							           </c:when>
							           <c:otherwise>
							            <c:out value="${row.message}"/>
							           </c:otherwise> 
							          </c:choose>
								
                                </a>
                                <input type="hidden" id="IDX" value="temp">
                            </td>
                            <td>${row.writeDate }</td>
                			<td><button id="sendMessageButton" onclick="openForm('${row.messageId}')">답장</button></td>
							<td><button id="deleteMessageButton" onclick="deleteMessage('${row.messageId}')">삭제</button></td>
                        </tr>
                       
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">수신한 쪽지가 존재하지 않습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
	</tbody>
</table>
<br />


<%@ include file="../include/bottom.jsp" %>