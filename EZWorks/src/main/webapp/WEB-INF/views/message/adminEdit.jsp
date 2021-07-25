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
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>	
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
         border: 5pt groove #3f51b5;
      }
      
</style>
<div class="main-content">
	<div class="form-group">
		<h2 style="text-align: center">받은 쪽지</h2>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
				</div>
				
				<br>
				
				<div class="a">
				<h2 style="text-align: center">쪽지답변</h2>
				<form name="frmChat" method="post" action="<c:url value='/message/receiveEdit?messageNo=${receiveVo.messageNo }'/>">
				<div class="form-group">
				<input type="hidden" name="messageNo" value="${receiveVo.messageNo }">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${receiveVo.messageTitle }">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3"
						placeholder="내용을 입력하세요">${receiveVo.messageContent }</textarea>
				</div>
				<div class="text-center">
					<input class="btn btn-primary" type="submit" value="수정">
					<a href="<c:url value='/message/receiveDetail?messageNo=${receiveVo.messageNo }'/>"><input class="btn btn-success" type="button" value="취소"></a>
				</div>
			</form>
			</div>
				<div class="text-center m-3">
        	<a id="delete" href="<c:url value='/message/receiveDelete?messageNo=${receiveVo.messageNo }'/>">
        		<input class="btn btn-secondary" type="button" value="삭제">
        		</a> 
        	<a href="<c:url value='/message/ReceiveInbox'/>"><input class="btn btn-info" type="button" value="목록"></a>	
        	</div>
			
			
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>