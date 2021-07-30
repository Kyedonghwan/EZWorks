<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<beans:bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
	<beans:property name="messageConverters">
		<beans:list>
			<beans:bean class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter"/>
		</beans:list>
	</beans:property>
</beans:bean>
<style type="text/css">
	#buttons button{
		border-color:white;
		font-size:0.8em;
		color:#607080
	}
	#buttons button:hover{
		background-color:#eeeeee;
	}
	#content {
    all: initial;
    * {
        all: unset;
    	}
    }
    #fileDownload{
    	border-color:white;
		font-size:0.8em;
		color:#607080;
    }
    #fileDownload:hover{
    	background-color:#eeeeee;
    }
    #comment-submit{
    	color:#607080;
    	border-color:#607080;
    }
</style>
	<section style="padding:0px">

		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>${boardVo.boardName }</a> <a href="#" id="favBoard"><span id="fav-toggle" class="fa-fw select-all fas" style="height:15px"></span></a>
			</h5>
		</div>

	</section>
	
	<section style="padding:0px">
		<div style="padding:5px;padding-top:10px;margin:20px;border:1px solid #dfe3e7;border-radius:3px;background-color:#f9f9f9">
			<ul style="font-size:0.8em;list-style:none">
				<li>
					<c:if test="${!empty adminList }">
					<span>운영자:
						<c:forEach var="admin" items="${adminList }">
							${admin } 
						</c:forEach>
					</span></c:if>
				</li>
				<li>
					<span>${boardVo.boardDescription }</span>
				</li>
			</ul>
		</div>
	</section>
	
	<section style="padding:0px;border-bottom:1px solid #dfe3e7">
		<div id = "buttons" style="margin:0px 20px 10px 20px">
			<button class="btn btn-outline-primary btn-sm" onclick='location.href="<c:url value='/board/writePosting?boardNo=${vo.boardNo }'/>"'><span class="fa-fw select-all fas"></span>&nbsp&nbsp새글쓰기</button>
			<c:if test="${vo.empNo == loginEmpNo }">
				<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp수정</button>
				<button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#confirmDelete"><span class="fa-fw select-all fas"></span>&nbsp&nbsp삭제</button>
			</c:if>
			<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp메일발송</button>
			<button class="btn btn-outline-primary btn-sm" href="#" style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp인쇄</button>
			<button class="btn btn-outline-primary btn-sm" onclick='location.href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>"' style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp목록</button>
			<button class="btn btn-outline-primary btn-sm" onclick='location.href="<c:url value='/board/postingClassicPrev?postingNo=${vo.postingNo }&boardNo=${vo.boardNo }'/>"' style="float:right"
			<c:if test="${vo.currentStatusVal==1 }">
				disabled='disabled'
			</c:if>
			><span class="fa-fw select-all fas"></span>&nbsp&nbsp아래</button>
			<button class="btn btn-outline-primary btn-sm" onclick='location.href="<c:url value='/board/postingClassicNext?postingNo=${vo.postingNo }&boardNo=${vo.boardNo }'/>"' style="float:right"
			<c:if test="${totalCount==vo.currentStatusVal }">
				disabled='disabled'
			</c:if>
			><span class="fa-fw select-all fas"></span>&nbsp&nbsp위</button>
		</div>
	</section>

	<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<p style="font-size:0.8em">게시글을 삭제하면 복구가 되지 않습니다.
						계속 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block" style="font-size: 0.8em">취소</span>
					</button>
					<button type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal" style="background-color:#607080"
						onclick='location.href="<c:url value='/board/deletePosting?postingNo=${vo.postingNo }&boardNo=${vo.boardNo }'/>"'
					>
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block" style="font-size: 0.8em">삭제</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<section style="padding:0px 20px 0px 20px;">
		<div style="display:inline;align-content:stretch">
			<div style="padding:0px;margin:0px;margin-top:20px;margin-bottom:20px;display:inline-block">
				<h5>${vo.postingTitle }</h5>
			</div>
			<div id="likeBtn" style="display:inline-block;float:right;padding-right:60px;margin-top:20px">
				<a href="#" id="like-icon"> 
				<img alt="" class='<c:if test="${hasLiked==0 }">unlike</c:if><c:if test="${hasLiked==1 }">like</c:if>' 
				src="
				<c:if test="${hasLiked==0 }">
				<c:url value='/resources/images/board/unlike.svg'/>				
				</c:if>
				<c:if test="${hasLiked==1 }">
				<c:url value='/resources/images/board/like.svg'/>
				</c:if>
				" style="width:20px;height:20px"> </a>
			</div>
		</div>
		<div style="padding:0px;margin:0px">
			<span class="avatar avatar-sm"><img alt="" src="<c:url value='/resources/empImages/${vo.empImg }'/>">&nbsp</span>
			<span style="font-size:0.8em;font-weight:400">${vo.empName } ${vo.posName }&nbsp&nbsp </span>
			<span style="font-size:0.78em;color:#999999"><fmt:formatDate value="${vo.postingRegdate }" pattern="yyyy-MM-dd (E) HH:mm"/></span>
		</div>
	</section>
	<section style="padding:10px 20px 10px 20px;margin-top:20px;min-height:300px">
		<div id="content">
			${vo.postingContent }
		</div>
		<div id="filesList">
			<c:if test="${!empty filesList }">
				<c:forEach var="fileVo" items="${filesList }">
					<form action="<c:url value='/board/download'/>">
						<input type="hidden" value="${fileVo.pfFileName }" name="pfFileName">
						<input type="hidden" value="${fileVo.pfOFileName }" name="pfOFileName">
						<div>
							<span class="fa-fw select-all fas" style="font-size:0.8em"></span><input type="submit" id="fileDownload" class="btn btn-outline-primary" value="${fileVo.pfOFileName } (${fileVo.pfFileSize })">
						</div>
					</form>
				</c:forEach>
			</c:if>
		</div>
	</section>
	<section name="comments" style="padding:10px 20px 10px 20px;">
			<div style="margin-bottom: 5px">
				<div name="comments-icons" style="border-bottom:1px solid #dfe3e7;">
					<a><span class="fa-fw select-all fas"></span> 댓글 <span id="totalReplyCount">${initTotalCount }</span> 개</a>&nbsp&nbsp&nbsp&nbsp<a><span
						class="fa-fw select-all fas"></span> 좋아요 누른 사람 <span id="likes">${likes }</span>명</a>
				</div>
			</div>
			<%-- <c:if test="">
				<c:forEach>
					
				</c:forEach>
			</c:if> --%>
			<div id="replyList" style="margin-top:10px;padding-left:5px">
				<c:if test="${!empty commentsList }">
					<c:forEach items='${commentsList}' var='thisiscomment'>
						<div style="display: inline; align-content: stretch">
							<span class="avatar avatar-md"
								style="display: inline; float: left; position: absolute; margin-top: 6px">
								<img alt="사원 사진"
								src="<c:url value='/resources/empImages/${thisiscomment.empImg }'/>">
							</span>
							<div class="input-group input-group-sm"
								style="padding-left: 40px; display: block;">
								<div>
									<a style="font-weight: bold">${thisiscomment.empName }</a>&nbsp&nbsp<span style="font-size:0.8em"><fmt:formatDate value='${thisiscomment.replyRegdate}' pattern="yyyy-MM-dd (E) hh:mm"/> </span>
								</div>
								<div>
									<span style="font-size: 0.8em">${thisiscomment.replyText}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<%-- <div style="display:inline;align-content:stretch">
					<span class="avatar avatar-md" style="display:inline;float:left;position:absolute;margin-top:6px">
						<img alt="사원 사진" src="<c:url value='/resources/empImages/${vo.empImg }'/>">
					</span>
					<div class="input-group input-group-sm" style="padding-left: 40px;display:block;">
						<div>
							<a style="font-weight:bold">사원이름</a>
						</div>
						<div>
							<span style="font-size:0.8em">댓글 내용</span>
						</div>
					</div>
				</div> --%>
			</div>
			<form name="replyForm">
				<div style="padding: 20px 5px 20px 5px;align-content:stretch;">
					<span class="avatar avatar-md" style="display:inline;float:left;position:absolute;">
						<img alt="사원 사진" src="<c:url value='/resources/empImages/${vo.empImg }'/>">
					</span>
					<div class="input-group input-group-sm" style="padding-left: 40px;">
						<input type="text" class="form-control form-control-sm" name="replyText">
						<button type="button" class="btn btn-outline-primary btn-sm" id="replySubmit">댓글 작성 데헷</button>
						<input type="hidden" name="postingNo" value="${vo.postingNo }">
						<input type="hidden" name="empNo" value="${loginEmpNo }">
					</div>
				</div>
			</form>
	</section>
<script type="text/javascript">
	$(function(){
		$('#like-icon').click(function(){
			if($(this).children('img').attr("class")=="like"){
				$(this).children('img').attr("src", "<c:url value='/resources/images/board/unlike.svg'/>");
				$(this).children('img').attr("class", "unlike");
				$.ajax({
					url:'<c:url value="/board/deleteLike"/>'
					,type:"get"
					,data:"empNo="+$('input[name=empNo]').val()+"&postingNo="+$('input[name=postingNo]').val()
					,dataType:"json"
					,success:function(res){
						$('#likes').html(res);
					}
				});
			}else if($(this).children('img').attr("class")=="unlike"){
				$(this).children('img').attr("src", "<c:url value='/resources/images/board/like.svg'/>");
				$(this).children('img').attr("class", "like");
				$.ajax({
					url:'<c:url value="/board/addLike"/>'
					,type:"get"
					,data:"empNo="+$('input[name=empNo]').val()+"&postingNo="+$('input[name=postingNo]').val()
					,dataType:"json"
					,success:function(res){
						$('#likes').html(res);
					}
				});
			}
		});
		$('input[name=replyText]').keydown(function() {
			  if (event.keyCode === 13) {
				  if($('input[name=replyText]').val()==''){
				    event.preventDefault();
					  
				  }
			  };
			});
		
		$('#replySubmit').click(function(){
			if($('input[name=replyText]').val()==''){
				return false;
			}
			var queryString = $('form[name=replyForm]').serialize();
			$.ajax({
				url: '<c:url value="/board/addComments"/>'
				,type: "post"
				,data: queryString
				,dataType: 'json'
				,success: function(res){
					if(res != null){
						makeCommentsList(res);
						console.log('성공했다 싀발');
					}
				},error: function(xhr, status, error){
					alert(error);
				}
			});
		});
	});
	
	function makeCommentsList(res){
		var htmlStr = "";
		var regdate = res.replyRegdate;
		
		htmlStr += "<div style='display: inline; align-content: stretch'>";
		htmlStr += "<span class='avatar avatar-md' style='display: inline; float: left; position: absolute; margin-top: 6px'>";
		htmlStr += "<img alt='사원 사진' src='<c:url value='/resources/empImages/"+res.empImg+"'/>'>";
		htmlStr += "</span>";
		htmlStr += "<div class='input-group input-group-sm' style='padding-left: 40px; display: block;'>";
		htmlStr += "<div>";
		htmlStr += "<a style='font-weight: bold'>"+res.empName+"</a>&nbsp&nbsp<span style='font-size:0.8em'>";
		htmlStr += res.brandnewdate+"</span>";
		htmlStr += "</div>";
		htmlStr += "<div>";
		htmlStr += "<span style='font-size: 0.8em'>"+res.replyText+"</span>";
		htmlStr += "</div>";
		htmlStr += "</div>";
		htmlStr += "</div>";
		
		$('#replyList').append(htmlStr);
		$('input[name=replyText]').val('');
		$('#totalReplyCount').html(res.initTotalCount);
		
		
	}
</script>