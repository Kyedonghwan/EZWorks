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
		$('#delete').click(function(){
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
      
      .frmChat {
	  width: 70%;
	  margin: 0 auto;
	  }
</style>

<title>쪽지보기</title>
		<div class="col-13 col-sm-7 col-md-8">
			<form name="frmChat">
				<h2 style="text-align: center">보낸 쪽지</h2>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control is-valid" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control is-valid" id="messageContent" name="messageContent" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
				</div>
				<c:if test="${!empty receiveVo }">
			<div class="a">
			<h2 style="text-align: center">쪽지답변</h2>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control is-invalid" id="messageTitle" name="messageTitle" value="${receiveVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control is-invalid" id="messageContent" name="messageContent" rows="3" readonly="readonly">${receiveVo.messageContent }</textarea>
				</div>
			</div>
			</c:if>
			<div style="text-align: center">
			<c:if test="${empty receiveVo }">
			<a href="<c:url value='/message/MessageEdit?messageNo=${sendVo.messageNo }'/>">
					<input class="btn btn-primary" type="button" value="쪽지 수정">
					</a> 
			</c:if>
					
        	<a id="delete" href="<c:url value='/message/deleteMessage?messageNo=${sendVo.messageNo }'/>">
        		<input class="btn btn-info" type="button" value="쪽지 삭제">
        		</a> 
        	<a href="<c:url value='/message/MessageSent'/>"><input class="btn btn-success" type="button" value="쪽지목록"></a>	
        	</div>
			</form>
			
		</div>



<%@ include file="../include/bottom.jsp"%>
