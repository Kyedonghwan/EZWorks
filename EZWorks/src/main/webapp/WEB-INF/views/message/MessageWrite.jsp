<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>  
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
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
<style type="text/css">
	  .a {
        border: 4px dashed #bcbcbc;
      }
      .frmChat {
	  width: 70%;
	  margin: 0 auto;
	  }
</style>

<title>쪽지 작성</title>
		<div class="a">
		<div class="form-group">
			<form name="frmChat" method="post" action="<c:url value='/message/MessageWrite'/>">
				<h1>쪽지 작성</h1>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" placeholder="제목 입력">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="10"
						placeholder="전송할 내용"></textarea>
						<div class="text-center m-3">
					<input class="btn btn-primary" type="submit" value="전송">
					<input class="btn btn-success" type="reset" value="취소">
					</div>
				</div>
			</form>
		</div>
		</div>


<%@ include file="../include/bottom.jsp"%>
