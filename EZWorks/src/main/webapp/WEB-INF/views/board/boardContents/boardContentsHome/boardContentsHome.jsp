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
	
	.htmlArea {
    all: initial;
    * {
        all: unset;
    	}
    }
    li.postvos{
    	padding:16px 24px;
    	margin:0px 0px;
    }
    
    li.postvos:hover {
    	background-color:#f9f9f9;
    }

</style>
<script type="text/javascript">
    $(function(){
        
    });
</script>
	<section style="padding:0px">
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>게시판 홈<!-- parameter: 어느 게시판?  --></a>
			</h5>
		</div>
		
	</section>
	
	<section style="padding:0px;border-bottom:1px solid #dfe3e7;">
		<div style="width:249px;margin:0;padding:0;float:right;">
			<span class="recent-header">최신글 모음</span>
		</div>
		<div style="padding:0px;margin:0px;margin-right:250px;">
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item" role="presentation" style="background-color:white">
					<a class="nav-link" id="favorites-tab" data-bs-toggle="tab" href="#favorites" role="tab" 
					aria-controls="favorites" aria-selected="false" style="background-color:whiteborder-bottom:1px solid #dfe3e7;">
						즐겨찾기
					</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab"
					aria-controls="home" aria-selected="true" style="background-color:white;border-bottom:1px solid #dfe3e7;">
						전체 게시판
					</a>
				</li>
			</ul>
		</div>
	</section>
	
	<div style="margin:0px;padding:0px;">
	
		<div style="width:249px;float:right;">
			<div style="margin:0px;padding:10px">
				<span class="recent-menu">전사게시판</span>
				<ul style="list-style:none;padding:0px">
					<%-- <c:forEach var="" items="">
					<li>
						<a href=""></a>
					</li>
					</c:forEach> --%>
					
				</ul>
			</div>
			
		</div>
	
	
	
				<div class="tab-content" id="myTabContent" style="border-right:1px solid #dfe3e7;border-collapse:collapse;margin-right:250px;height:100%;">
					<div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="favorites-tab">
						<ul style="list-style:none;padding:0px">
						<c:if test="${!empty favBoardPostingList }">
							<c:forEach var="posts" items="${favBoardPostingList }">
								<li class="postvos" onclick="location.href='<c:url value="/board/postingDetail?postingNo=${posts.postingNo }"/>'">
									<div style="margin:0px;">
											<c:if test="${posts.deptNo==0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">EZ그룹 </span>
											</c:if>
											<c:if test="${posts.deptNo!=0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">부서|${posts.deptName }</span>
											</c:if>
											<span style="font-size: 0.7em;color:#aaaaaa">></span>
											<a style="font-size: 0.7em;color:#aaaaaa">${posts.boardName }</a>
											&nbsp&nbsp&nbsp
											<span style="font-size: 0.7em;color:#aaaaaa">
												<span class="fa-fw select-all fas"></span>
												<span>댓글 수</span>
											</span>
											<div style="padding-top:5px">
												<h6>${posts.postingTitle }</h6>
											</div>
											<div class="htmlArea">
												<span id="content">${posts.postingContent }</span>
											</div>
											<div style="margin-top:5px">
												<span class="avatar avatar-sm"><a><img alt="" src="<c:url value='/resources/empImages/${posts.empImg }'/>"></a></span>
												<a style="font-size: 0.7em">${posts.empName } ${posts.posName }</a>
												<span style="font-size: 0.7em">
												<fmt:formatDate value="${posts.postingRegdate }" pattern="yyyy-MM-dd"/>
												</span>
												<span></span>
											</div>
									</div>
								</li>
							</c:forEach>
							</c:if>
						</ul>
					</div>
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<ul style="list-style:none;padding:0px">
							<c:forEach var="posts" items="${allPostingList }">
								<li class="postvos" onclick="location.href='<c:url value="/board/postingDetail?postingNo=${posts.postingNo }"/>'">
									<div style="margin:0px;">
											<c:if test="${posts.deptNo==0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">EZ그룹 </span>
											</c:if>
											<c:if test="${posts.deptNo!=0 }">
											<span  style="font-size: 0.7em;color:#aaaaaa">부서|${posts.deptName }</span>
											</c:if>
											<span style="font-size: 0.7em;color:#aaaaaa">></span>
											<a style="font-size: 0.7em;color:#aaaaaa">${posts.boardName }</a>
											&nbsp&nbsp&nbsp
											<span style="font-size: 0.7em;color:#aaaaaa">
												<span class="fa-fw select-all fas"></span>
												<span>댓글 수</span>
											</span>
											<div style="padding-top:5px">
												<h6>${posts.postingTitle }</h6>
											</div>
											<div class="htmlArea">
												<span id="content">${posts.postingContent }</span>
											</div>
											<div style="margin-top:5px">
												<span class="avatar avatar-sm"><a><img alt="" src="<c:url value='/resources/empImages/${posts.empImg }'/>"></a></span>
												<a style="font-size: 0.7em">${posts.empName } ${posts.posName }</a>
												<span style="font-size: 0.7em">
												<fmt:formatDate value="${posts.postingRegdate }" pattern="yyyy-MM-dd"/>
												</span>
											</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				
				
	</div>