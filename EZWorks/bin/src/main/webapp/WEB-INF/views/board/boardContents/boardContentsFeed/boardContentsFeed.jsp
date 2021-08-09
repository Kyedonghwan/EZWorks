<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.nav-link{
		font-size:0.75em;
	}
	.tab-pane li {
    border-bottom: 1px solid #dfe3e7;
    border-collapse:collapse;
	}
	
	.tab-pane li:last-child {
	    border-bottom: 1px solid #dfe3e7;
	}
	
	.tab-pane li:first-child{
		border-top: 1px solid #dfe3e7;
	}
	
	#contents{
		border-left: 1px solid #dfe3e7;
		border-right: 1px solid #dfe3e7;
	}
	span.recent-header{
		font-size:0.9em;
		font-weight:bold;
	}
	span.recent-menu{
		font-size:0.8em;
		font-weight:bold;
	}
	
	div.contents {
    all: initial;
    * {
        all: unset;
    	
    	}
    }
    div.contents{
	    padding:10px 20px 10px 20px;
    }
</style>
	<section style="padding:0px">
		<!-- <div style="width:249px;height:64px;margin:0;padding:0;padding:24px 24px 16px;float:right">
			<span class="recent-header">최신글 모음</span>
		</div> -->
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left;">
			<h5>
				<a>${boardVo.boardName}<!-- parameter: 어느 게시판?  --></a>
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
	
	<section style="padding:0px">
		<form action="">
		<div style="padding:10px;padding-top:10px;margin:20px;border:1px solid #dfe3e7;border-radius:3px;min-width:50px;display:block">
			<div>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="min-width:50px;width:100%;font-size:0.8em" placeholder="새로운 정보, 기분 좋은 소식을 부서원들과 공유하세요."></textarea>
			</div>
			<div name="buttons" style="display:block;">
				<div>
					
				</div>
				<div>
					<button class="btn btn-primary btn-sm">
						이야기 하기
					</button>
				</div>
			</div>
		</div>
		
		</form>	
	</section>

	<div style="margin:0px;padding:20px;">
		<div style="padding:20px;margin:0px">
				<ul style="list-style:none;padding:0px;">
					<c:forEach var="vo" items="${postingList }">
					<li style="padding:16px 0px;border-top:1px solid #dfe3e7;">
					<div class="article_wrap" style="display:inline;align-content:stretch">
						
							<span class="avatar avatar-lg" style="display:inline;float:left" align="absmiddle"> <img alt="사원 사진"
								src="<c:url value='/resources/empImages/${vo.empImg }'/>" align="absmiddle">
							</span>
						
						<div name="restofVO" style="display:block;margin-left:60px;">
							<div name="empname">
								<a class="name" style="font-weight:bold;font-size:0.85em">${vo.empName } ${vo.posName }</a>
							</div>
							<div name="regdate">
								<span class="date"><fmt:formatDate value="${vo.postingRegdate }" pattern="MM-dd hh:mm"/></span>
							</div>
							<div name="content">
								<div class="contents" name="contents" style="padding: 10px 20px 10px 20px">
								${vo.postingContent }
								</div>
							</div>
							<div name="comments" style="margin-bottom:5px">
								<div name="comments-icons">
									<a><span class="fa-fw select-all fas"></span> 댓글 0 개</a>&nbsp&nbsp&nbsp&nbsp<a><span class="fa-fw select-all fas"></span> 좋아요 누른 사람 0명</a>
								</div>
							</div>
							<div style="padding:20px 5px 20px 5px;border:1px solid #dfe3e7;border-radius:3px;display:block">
								
									<span class="avatar avatar-md" style="display:inline;float:left"> <img alt="사원 사진"
										src="<c:url value='/resources/empImages/${vo.empImg }'/>">
									</span>

								<div style="display:block;margin-left:40px;margin-right:80px;">
									<input type="text" class="form-control form-control-sm">
									<button class="btn btn-outline-primary btn-sm">댓글 작성</button>
								</div>
								<div>
									
								</div>
							</div>
						</div>
							
					</div>
						<!-- 원글 -->
							
							<!-- //원글 -->
							<!-- <div class="reply_header">
								<span class="ic_classic ic_reply"></span> <span class="txt_b">댓글<span
									class="num txt_b" id="commentCount"> 0</span> 개
								</span> <a class="txt_b btn_viewAll" style="display: none"> <span
									class="txt_b commentFold" data-comment="part"
									data-loading="false">모두 보기</span>
								</a> <span class="ic ic_feedPlus_s"></span> <span class="txt_ txt_b">
									좋아요 누른 사람 <a id="listPostRecommend" class="linkNum"> 1</a> 명
								</span>
							</div>
							<div class="reply_wrap" data-boardid="195" data-postid="1082"> -->
								<!-- 댓글 시작 -->
								<!-- <div class="reply_common" id="replyArea">
									<ul class="reply"></ul>
									<div class="reply_create">
										<span class="photo"><img
											src="/thumb/user/small/4302-21683"></span>
										<div class="msg_wrap">
											<div class="compo_reply_create">
												<p class="form_wrap " style="">
													<span class="textarea_edit"> <textarea type="text"
															class="edit w_max"></textarea>
													</span>
												</p>
												<span class="btn_fn7 posi1" id="uploadBtn" style="">
													<span class="ic_con ic_file_up_s" id="fileControl"></span>
												</span> <span class="btn_minor_s" id="create" style=""> <span
													class="txt">댓글 작성</span>
												</span>
											</div>
											<div id="progressArea" style="display: none;">
												<span id="progressBarWriteWrapview1893"
													style="margin: 0px; display: inline-block; vertical-align: top; position: relative; padding: 10px 17px 0 0; line-height: 110%"></span>
											</div>
											<div class="" id="commentAttachPart" style="display: none">
												<ul class="file_wrap">
												</ul>
												<ul class="img_wrap">
												</ul>
											</div>
										</div>
										<div class="action_wrap" style="display: none">
											<span class="btn_fn4"><span
												class="ic_feed ic_edit_white"></span></span> <span class="btn_fn4"><span
												class="ic_feed ic_del_white"></span></span>
										</div>
									</div>
								</div>
							</div> -->
							<!-- //댓글 -->
						<!-- </div>  -->
						<!-- <div style="margin:0px;">
							<span>다우그룹 <span>></span>
							<a>다우오피스 소식</a>
							</span>
							
							<span>
								<span>댓글 아이콘</span>
								<span>댓글 수</span>
							</span>
							<div>
								<a>게시글 제목</a>
							</div>
							<div>
								<span><a><img alt="" src="">이미지 사진</a></span>
								<a>김지연 부장</a>
								<span>등록일</span>
							</div>
						</div> -->
					</li>
					</c:forEach>
				</ul>
		</div>	
	</div>
