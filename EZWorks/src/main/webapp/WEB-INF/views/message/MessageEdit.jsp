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
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
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
<title>쪽지보기</title>
		<div class="a">
		<div class="col-13 col-sm-7 col-md-6">
			<form name="frmChat" method="post" action="<c:url value='/message/MessageEdit'/>">
				<h1 style="text-align: center">쪽지 수정</h1>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control is-valid" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control is-valid" id="messageContent" name="messageContent" rows="3">${sendVo.messageContent }</textarea>
					<div class="text-center m-3">
					<input class="btn btn-primary" type="submit" value="수정">
					<input type="hidden" name="messageNo" value="${sendVo.messageNo }">
					<a href="<c:url value='/message/MessageDetail?messageNo=${sendVo.messageNo }'/>">
					<input class="btn btn-primary" type="button" value="수정 취소"></a>
					<a href="<c:url value='/message/MessageSent'/>"><input class="btn btn-primary" type="button" value="목록"></a>	
					</div>
				</div>
			</form>
		</div>
		</div>

<%@ include file="../include/bottom.jsp"%>
