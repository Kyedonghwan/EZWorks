<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	 a{
		color:black;
		font-size:0.85em;
	 }
	 span.separator{
	 	color:#949599;
	 	font-size:0.85em;
	 	background-color:white;
	 }	
	 
	 section.menus img{
	 	opacity: 0;
		transition: opacity 0.3s
	 }
	 section.menus:hover img{
	 	opacity: 1;
	 }

</style>
<script>
	$(function(){
		$('.chevron-right').click(function(){
			if($(this).children('span').children('img').attr("class")=="fold"){
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-down.svg'/>");
				$(this).children('span').children('img').attr("class","unfold");
			}else{
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-right.svg'/>");
				$(this).children('span').children('img').attr("class","fold");
			}
		});
	})
</script>
<div id="wanttocal" style="margin:0px;padding:0px;height:100%;">
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a href="<c:url value='/board/boardMain'/>">게시판</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="<c:url value='/board/writePosting'/>" class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				글쓰기
			</a>
	</div>
</section>
<section class="menus">
	<div style="padding-right:10px;padding-left:10px">
		<ul style="list-style:none;padding:0px;margin:0px;">
			<c:if test="${!empty favList }">
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>즐겨찾기</span></a>
				</p>
                <!-- c:if절, boardType => enterprise -->
                <ul class="submenu active" style="list-style:none">
                	<c:forEach var="vo" items="${favList }">
                			<li class="submenu-item" id="favBoardList" style="height:25px;">
                				<c:if test="${vo.boardIsLine==1 }">
                				<div style="display:inline-block;height:23.63px;width:100%;overflow:hidden;background-image:url('<c:url value='/resources/images/board/dotted-line.png'/>');background-size:contain;">
                				<span class="separator">${vo.boardName }&nbsp</span>
                				</div>
                				</c:if>
                				<c:if test="${vo.boardIsLine==0 }">
                				<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
                				</c:if>
                			</li>
                	</c:forEach>
               </ul>
           </li>
           <br>
			</c:if>
		
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>전사게시판</span></a>
				</p>
                <!-- c:if절, boardType => enterprise -->
                <ul class="submenu active" style="list-style:none">
                	<c:forEach var="vo" items="${boardList }">
                		<c:if test="${vo.boardType == '전사게시판' }">
                			<li class="submenu-item" style="height:25px;">
                				<c:if test="${vo.boardIsLine==1 }">
                				<div style="display:inline-block;height:23.63px;width:100%;overflow:hidden;background-image:url('<c:url value='/resources/images/board/dotted-line.png'/>');background-size:contain;">
                				<span class="separator">${vo.boardName }&nbsp</span>
                				</div>
                				</c:if>
                				<c:if test="${vo.boardIsLine==0 }">
                				<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
                				</c:if>
                			</li>
                		</c:if>
                	</c:forEach>
               </ul>
           </li>
           <br>
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>부서게시판</span></a>
				</p>
				<ul class="submenu active" style="list-style: none; padding:0px;">
					<li class="sidebar-item active has-sub">
					
					<p style="padding:0px 20px 0px 32px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 12px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right"><span>영업팀<!-- require parameter(from emp) --></span></a>
					</p>
						<ul class="submenu active" style="list-style:none;padding:0px;margin:0px;padding-left:0px">
							<!-- forEach -->
							<c:forEach var="vo" items="${boardList }">
								<c:if test="${vo.boardType == '부서게시판' }">
									<c:if test="${vo.boardIsFolder==0 and vo.boardGroupNo==0 }">
									<li class="submenu-item"style="padding-left:44px">
										<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
									</li>
									</c:if>
									<c:if test="${vo.boardIsFolder==1 }">
									<li class="sidebar-item active has-sub">
									<p style="padding:0px 20px 0px 44px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
									<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 24px;">
				           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
				           			<a href="#" class="sidebar-link chevron-right"><span>${vo.boardName }<!-- require parameter(from emp) --></span></a>
									</p>
										<ul class="submenu active" style="list-style:none;padding:0px">
										<c:forEach var="vo1" items="${boardList }">
											<c:if test="${vo1.boardGroupNo==vo.boardNo }">
												<li class="submenu-item" style="padding-left:56px">
													<a href="<c:url value='/board/selectedBoard?boardNo=${vo1.boardNo }'/>">${vo1.boardName }</a>
												</li>
											</c:if>
										</c:forEach>
										</ul>
									</li>
									</c:if>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</li>
			<li style="padding-left:14px">
			<a href="#" style="font-weight: bold; color: #999"> + 게시판 추가 </a>
			</li>
		</ul>
	</div>
</section>
</div>