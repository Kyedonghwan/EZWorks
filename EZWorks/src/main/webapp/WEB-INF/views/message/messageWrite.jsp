<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmChat]').submit(function(){
			if($('#title').val().length<1){
				alert('제목을 입력하세요');
				$('#title').focus();
				return false;
			}else if($('#content').val().length<1){
				alert('내용을 입력하세요');
				$('#content').focus();
				return false;
			}
		});
	});
</script>
<title>messageWrite.jsp</title>
		<div class="col-13 col-sm-7 col-md-8">
			<form name="frmChat" method="post" action="<c:url value='/message/messageWrite'/>">
				<nav>
				<br>
				</nav>
				<h1 style="text-align: center">쪽지쓰기</h1>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" placeholder="제목을 입력하세요">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3"
						placeholder="내용을 입력하세요"></textarea>
						<div class="text-center m-3">
					<input class="btn btn-primary m-3" type="submit" value="전송">
					<input class="btn btn-primary m-3" type="reset" value="취소">
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>
