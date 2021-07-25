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
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>		
<script type="text/javascript">
	$(function(){
		$('form[name=frmChat]').submit(function(){
			if($('#title').val().length<1){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
				return false;
			}else if($('#content').val().length<1){
				alert('내용을 입력하세요');
				$('#content').focus();
				event.preventDefault();
				return false;
			}
		});
		
		$('#deleteSend').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
		
		$('#deleteReceive').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
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
					<textarea class="form-control" id="messageContent" name="messageContent" rows="5" readonly="readonly">${sendVo.messageContent }</textarea>
				</div>
				
				<br>
				
				<c:if test="${empty receiveVo }">
				<div class="a">
				<h2 style="text-align: center">받은 쪽지</h2>
				<form name="frmChat" method="post" action="<c:url value='/message/receiveWrite'/>">
				<div class="form-group">
				<input type="hidden" name="messageNo" value="${sendVo.messageNo }">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" placeholder="제목을 입력하세요">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="text-center">
					<input class="btn btn-primary" type="submit" value="등록">
					<input class="btn btn-success" type="reset" value="취소">
				</div>
			</form>
			</div>
			</c:if>
			<c:if test="${!empty receiveVo }">
			<div class="border border-warning p-3">
			<h3 class="title-5 m-b-35">답변</h3>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${receiveVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${receiveVo.messageContent }</textarea>
				</div>
				<div style="text-align: center">
					<a href="<c:url value='/message/receiveEdit?messageNo=${receiveVo.messageNo }'/>">
					<input class="btn btn-primary" type="button" value="수정">
					</a> 
					<a id="deleteReceive" href="<c:url value='/message/deleteReceive?messageNo=${receiveVo.messageNo }'/>">
        		<input class="btn btn-success" type="button" value="답변 삭제">
        		</a> 
				</div>
			</div>
			</c:if>
				<div style="text-align: center">
        	<a id="deleteSend" href="<c:url value='/message/receiveDelete?messageNo=${receiveVo.messageNo }'/>">
        		<input class="btn btn-warning" type="button" value="쪽지 삭제">
        		</a> 
        	<a href="<c:url value='/message/ReceiveInbox'/>">
        	<input class="btn btn-info" type="button" value="쪽지목록"></a>	
        	</div>
			
			
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>