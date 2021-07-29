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
<title>보낸 편지함</title>
<meta charset="utf-8">
<link rel="stylesheet" typ	e="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" />
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script type="text/javascript">	
	
	$(function(){
		$('.table tbody tr').hover(function(){
			$(this).css('background',"Aquamarine");
		}, function(){
			$(this).css('background',"");
		});
	});
	
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
	 h2{
	 	font-size: 30px;
	 	text-align: center;
	 }	
	 
	 .divSearch{
		margin: 0 auto;
	}
	
	body{
		padding:10px;
		margin:10px;
	 }	
	 
	 .table-bordered {
	  width: 85%;
	  margin: 0 auto;
	}
	
 
</style>	
</head>	
<body>
<nav>
<br>
</nav>
<h2>보낸 쪽지함</h2>
<c:if test="${!empty param.searchKeyword }">
	<p>검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord} 건 검색되었습니다.</p>
</c:if>
<form action="<c:url value='/message/sendList'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"><br>	
</form>

<table class="table table-bordered">
	<thead class="thead-dark">
	  <tr class="table-info" style="text-align: center">
	    <th scope="col">no</th>
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
		  	<c:forEach var="vo2" items="${list }">			 
				<tr class="align_center">
					<td>${vo2.no}</td>
					<td>
						<a href
						="<c:url value='/message/senddetail?no=${vo2.no }'/>">
							${vo2.content}
						</a>
					</td>
					<td>${vo2.name}</td>
					<td>
						<fmt:formatDate value="${vo2.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>	
					</td>
				</tr> 
			</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	 </tbody>
</table>
<div style="margin-top:40px">
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary pagination-sm justify-content-center">
				<li class="page-item 
				<c:if test='${pagingInfo.currentPage==pagingInfo.firstPage }'>
				</c:if>">
				<a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
					Previous		
				</a></li>
				
				<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item"><a class="page-link" href="#" onclick="pageProc(${i})">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value='/resources/images/message/last.JPG'/>" alt="다음 블럭으로">
					</a>
			
				</c:if>
				<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
	<nav><br></nav>
<nav><br></nav>

<div class="divSearch" style="display:flex;
		justify-content: center!important;">
   	<form name="frmSearch" method="post" action='<c:url value="/message/sendList"/>'>
   		<div class="input-group input-group-sm mb-1">
        <select name="searchCondition" class="form-select input-group-text" style="width:80px">
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
	<nav><br></nav>
	<hr>
	<footer id="main_footer" style="text-align: center">
		<address>Copyright &copy; <a href=https://kkimsangheon.github.io >이지웍스</a> All Rights Reserved.</address>
		<address>Blog : <a href=https://kkimsangheon.github.io ></a>https://blog.naver.com/hyunki89</address>
		<address>Github : <a href=https://github.com/KKimSangHeon >https://github.com/eykgond/EZWorks</a></address>
    </footer>
</body>

</body>
</html>

<%@ include file="../include/bottom.jsp" %>