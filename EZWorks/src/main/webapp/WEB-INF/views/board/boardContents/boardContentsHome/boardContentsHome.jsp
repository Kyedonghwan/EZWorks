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
</style>
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
						<p>favorites</p>
							<ul style="list-style:none;padding:0px">
								<c:forEach var="i" begin="0" end="10">
								<li style="padding:16px 24px">
									<div style="margin:0px;">
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
									</div>
								</li>
								</c:forEach>
							</ul>
					</div>
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<ul style="list-style:none;padding:0px">
							<c:forEach var="posts" items="${allPostingList }">
								<li style="padding:16px 24px;margin:0px 0px;">
									<div style="margin:0px;">
											<c:if test="${posts.deptNo==0 }">
											<span>
											<span>다우그룹 </span>
											</c:if>
											<c:if test="${posts.deptNo!=0 }">
											<span>부서|${posts.deptName }</span>
											</c:if>
											></span>
											<a>${posts.boardName }</a>
											<span>
												<span>댓글 아이콘</span>
												<span>댓글 수</span>
											</span>
											<div>
												<a>${posts.postingTitle }</a>
											</div>
											<div>
												<span>${posts.postingContent }</span>
											</div>
											<div>
												<span><a><img alt="" src="">이미지 사진</a></span>
												<a>${posts.empName } ${posts.posName }</a>
												<span>
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