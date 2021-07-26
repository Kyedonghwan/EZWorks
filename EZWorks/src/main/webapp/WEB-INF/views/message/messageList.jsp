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
<title>받은 편지함</title>
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
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
	h2{
		font-size: 30px;	
	}
	.divSearch{
		margin: 0 auto;
	}
	

</style>	
</head>	
<body>
<nav>
<br>
</nav>
<h2 style="text-align: center">받은 쪽지함</h2>
<form action="<c:url value='/message/messageList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"><br>	
</form>


<table class="table">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
		<col style="width:20%;" />
		<col style="width:20%;" />	
	</colgroup>
	<thead class="thead-dark">
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
<ul class="pagination justify-content-center" >
	<c:if test="${pagingInfo.firstPage>1 }">
	<li class="page-item">
		<a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">Previous
		</a>
	</li>
	</c:if>
	<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
	<li class="page-item">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold" class="page-link" >${i}</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a class="page-link" href="#" onclick="pageProc(${i})">${i}
			</a>
		</c:if>
	</li>
	</c:forEach>
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
	<li class="page-item">
		<a class="page-link" href="#" onclick="pageProc(${pagingInfo.lastPage+1})">Next</a>
	</li>	
	</c:if>
</ul>
<br>

</nav>
<div class="divSearch" style="display:flex;
		justify-content: center!important;">
   	<form name="frmSearch" method="post" action='<c:url value="/message/messageList"/>'>
   		<div class="input-group input-group-sm mb-1">
        <select name="searchCondition" class="form-select input-group-text" style="width:80px">
            <option value="no" 
            	<c:if test="${param.searchCondition == 'no' }">            	
            		selected="selected"
            	</c:if>
            >번호</option>
            <option value="content"
            	<c:if test="${param.searchCondition == 'content' }">            	
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="name" 
            	<c:if test="${param.searchCondition == 'name' }">            	
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" class="form-control" value="${param.searchKeyword }" style="width:200px "> 
        <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="submit" class= "btn btn-primary" value="검색">
		</div>
    </form>
	</div>
</body>
</html>

<%@ include file="../include/bottom.jsp" %>