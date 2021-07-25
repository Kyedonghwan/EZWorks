<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%> 
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/css/message/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/formLayout.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/message/mystyle.css'/>" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/message/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/message/jquery-ui.css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script type="text/javascript" 
   src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
<script type="text/javascript">
		$(function(){
			$('#startD').datepicker({
				dateFormat:'yy-mm-dd',
				changeYear:true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			})
			$('#endD').datepicker({
				dateFormat:'yy-mm-dd',
				changeYear:true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			})
			
			$('input[name=chkAll]').click(function(){
				$('tbody input[type=checkbox]').prop('checked',this.checked);			
			});
			
			$('#delete').click(function(){
				var chkLen=$('tbody input[type=checkbox]:checked').length;
				if(chkLen==0){
					alert('먼저 삭제할 쪽지를 선택하세요');
				}else{			
					if(!confirm('삭제하시겠습니까?')){
						event.preventDefault();
						return false;
					}
					$('form[name="frmList"]').prop('action',
							'<c:url value="/message/deleteMulti"/>');
					$('form[name="frmList"]').submit();
				}
			});
			
			
			
	});
		
	function messageList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<form name="frmPage" method="post" 
	action="<c:url value='/message/ReceiveInbox'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	<input type="hidden" name="startDay" value="${dateSearchVO.startDay }">
	<input type="hidden" name="endDay" value="${dateSearchVO.endDay }">
</form>
<div class="main-content">
	<div class="section__content section__content--p30">
		<section class="p-t-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 style="text-align: center">받은 쪽지함(${pagingInfo.totalRecord })</h2>	
						<form name="frmList" >
						<div class="table-responsive table-responsive-data2">
						
							<table class="table table-data2">
								<thead>
									<tr>
										<th><label class="au-checkbox"> <input
												type="checkbox" name="chkAll" > <span class="au-checkmark"></span>
										</label></th>
										<th>회원번호</th>
										<th>제목</th>
										<th>내용</th>
										<th>보낸날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="6">받은 쪽지가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:set var="idx" value="0"/>
										<c:forEach var="vo" items="${list }">
											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="radio" name="sMessage[${idx }].messageNo" value="${vo.messageNo }"> <span class="au-checkmark"></span>
												</label></td>
												<td><span class="block-email">${vo.userNo }</span></td>
												<td>
													<c:if test="${fn:length(vo.messageTitle)>10 }">
														${fn:substring(vo.messageTitle, 0, 10) }...
													</c:if> 
													<c:if test="${fn:length(vo.messageTitle)<=10 }">
														${vo.messageTitle}
													</c:if>
													</td>
													<td class="desc"><a  href="<c:url value='/message/receiveDetail?messageNo=${vo.messageNo }'/>">
													<c:if test="${fn:length(vo.messageContent)>30 }">
														${fn:substring(vo.messageContent, 0, 30) }...
													</c:if> 
													<c:if test="${fn:length(vo.messageContent)<=30 }">
														${vo.messageContent}
													</c:if></a></td>
												<td><fmt:formatDate value="${vo.messageRegdate }"
														type="date" pattern="yyyy-MM-dd" /></td>
											</tr>
											<c:set var="idx" value="${idx+1 }"/>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
        					
						</div>
						</form>
						<input class="btn btn-primary btn-sm" type="button" id="delete" value="선택한 쪽지 삭제">
						<br>
						<form name="frmSearch" method="post"
							action='<c:url value="/message/ReceiveInbox"/>'>
							조회기간
							<div class="row">
							<div class="col-md-2">
							<input type="text" name="startDay" id="startD" class="form-control form-control-sm" 
								 value="${searchVOChat.startDay }">
							</div>
							~
							<div class="col-md-2">
							<input type="text" name="endDay" id="endD" class="form-control form-control-sm" 
								 value="${searchVOChat.endDay }">
							</div>
							<div class="col-md-2">
							<select name="searchCondition" class="form-control form-control-sm">
								<option value="MESSAGE_TITLE" 
					            	<c:if test="${param.searchCondition == 'MESSAGE_TITLE' }">            	
					            		selected="selected"
					            	</c:if>
					            >제목</option>
					            <option value="MESSAGE_CONTENT" 
					            	<c:if test="${param.searchCondition == 'MESSAGE_CONTENT' }">            	
					            		selected="selected"
					            	</c:if>
					            >내용</option>
					            <option value="USER_NO" 
					            	<c:if test="${param.searchCondition == 'USER_NO' }">            	
					            		selected="selected"
					            	</c:if>
					            >회원번호</option>
							</select> 
							</div>
							<div class="col-md-4">
							<input name="searchKeyword" class="form-control form-control-sm" type="text" value="${param.searchKeyword }">
							</div>
							<div class="col-md-1">
							<input class="btn btn-primary" type="submit" value="검색">
							</div>
							</div>
							
						</form>
					  <ul class="pagination justify-content-center" >
						<c:if test="${pagingInfo.firstPage>1 }">
							<li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous" onclick="messageList(${pagingInfo.firstPage-1})">
						        <span aria-hidden="true">&laquo;</span>
						        <span class="sr-only">이전으로</span>
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
							        <span class="sr-only">다음으로</span>
							      </a>
							</li>
						</c:if>
					  </ul>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<%@ include file="../include/bottom.jsp"%>
