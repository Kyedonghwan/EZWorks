<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	p{
		margin-bottom:0;
	}
	.col-12 col-lg-12{
		padding:0;
	}
	.col-auto{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
	}
	div#boardTitle{
		display: flex;
		align-items: center;
	}
	#boardInfo_Wrap{
		min-width: 500px;
		border:1px solid #dcdcdc;
		background-color: #f9f9f9;
		position: relative;
		border-radius: 4px;
		margin: 10px 24px;
		margin-top: 0px;
		padding: 14px 10px 14px;
	}
	.detail_info{
		margin: 0;
		list-style: none;
    	padding: 0 8px 0;
	}
	.simple_info {
	    display: flex;
	    align-items: center;
	    margin: 0;
	}
	#toolbar{
		margin: 4px 0 0;
	}
	header.article_header {
    position: relative;
    padding: 24px 24px 0;
    margin: 0;
	}
	
	article.article_view {
	    min-height: 200px;
	    padding: 24px 24px;
	}
	
	.writer_info {
	    margin-top: 8px;
	    position: relative;
	    display: inline-flex;
	    align-items: center;
	}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
</script>

<%@ include file="../../community/sidebar/sidebar2.jsp" %>		
<%@ include file="../../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header" id="boardTitle">
	               <h5 class="card-title">${cboardVo.boardName}</h5>&nbsp
	               <span style="font-size:0.9em">${cboardVo.communityName}&nbsp(총 ${cboardVo.writingCount}건)</span>
                </div>
                <div class="card-body" id="boardInfo_Wrap">
                	<ul class="simple_info">
                		<li>
                			<strong>게시판 주소 : </strong>
                			<span><a href="<c:url value='/community/communityOneClassic?boardNo=${cboardVo.boardNo}&communityNo=${cboardVo.communityNo}'/>">
                				community/communityOneClassic/${cboardVo.boardName}</a></span>&nbsp
                		</li>                	
                	</ul>
                	<ul class="detail_info">
                		<li>
                			<strong>운영자 : </strong>
                			<span>${cboardVo.masterName}</span>
                		</li>
                		<li style="none">${cboardVo.intro}</li>
                	</ul>
                </div>
                <div class="card-body">
	                <div class="tool_bar">
	                	<div class="buttons">
		                	 <a id="toolbar" href="<c:url value='/community/c_boardWrite?communityNo=${cboardVo.communityNo}'/>" 
		                	 	class="btn btn-sm btn-outline-secondary">새글쓰기</a>
		                	 <a id="toolbar" href="#" class="btn btn-sm btn-outline-secondary">삭제</a>
	                	</div>
	                </div><hr style="margin-bottom:0">
                    <div class="tab-content" id="myTabContent">  
                    <section class="classic_detail">
                    	<header class="article_header">
                    		<h4>${classicVo.title}</h4>
                    		<div class="writer_info">
                    			<span class="avatar bg-warning me-3">
           							<img src="<c:url value='/resources/images/faces/${classicVo.empImg}'/>">
           						</span>
                    			<div class="info">
                    				<span class="name" style="font-weight: bold">${classicVo.empName} ${classicVo.posName}</span>&nbsp
                    				<span class="date">
                    					<fmt:formatDate value="${classicVo.regdate}" pattern="yyyy-MM-dd (E) HH:mm"/>
                    				</span>
                    			</div>
                    		</div>
                    		<div class="fileInfo" style="margin-left:43px">
                    			<c:if test="${!empty classicVo.fileName}">
									<a href="<c:url value='/community/download?contentNo=${classicVo.contentNo}&fileName=${classicVo.fileName}&originalFileName=${classicVo.originalFileName}'/>">
										<span>${fileInfo}</span>
									</a>
									<span class="sp1">다운 : ${classicVo.downCounts}회</span>
								</c:if>
                    		</div>
                    	</header>
                    	<article class="article_view">
                    		<div class="content">${fn:replace(classicVo.text, newLine, "<br>")}</div>
                    	</article>
                    </section>
                    <div class="contentList"><hr style="margin-bottom:0">
                    	 <!-- table hover -->
	                    <div class="table-responsive">
	                        <table class="table table-hover mb-0" style="border-top">
		                        <colgroup>
									<col style="width:10%">
									<col style="width:50%">
									<col style="width:10%">
									<col style="width:20%">
									<col style="width:5%">
								</colgroup>
	                            <thead>
	                                <tr>
	                                    <th style="text-align: center">번호</th>
	                                    <th>제목</th>
	                                    <th style="text-align: center">작성자</th>
	                                    <th style="text-align: center">작성일</th>
	                                    <th style="text-align: center">조회</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:if test="${empty classicList}">
	                                	<tr>
	                                   		<td colspan="6" style="text-align: center">작성된 글이 없습니다.</td>
	                                   	</tr>
	                                </c:if>
	                                <c:if test="${!empty classicList}">
	                                	<c:forEach var="vo" items="${classicList}">
			                                <tr>
			                                    <td style="text-align:center">${vo.currentStats}</td>
			                                    <td class="text-bold-500"><a href="<c:url value='/community/countUpdate?boardNo=${vo.boardNo}&communityNo=${vo.communityNo}&contentNo=${vo.contentNo}'/>">${vo.title}</a></td>
			                                    <td class="text-bold-500" style="text-align: center">${vo.empName}</td>
			                                    <td style="text-align: center"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
			                                    <td style="text-align: center">${vo.readCounts}</td>
			                                </tr>
	                                	</c:forEach>
	                                </c:if> 
	                            </tbody>
	                        </table>
	                    </div><br>
	                    <div class="paging">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-primary pagination-sm justify-content-center">
									<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.firstPage }'>disabled</c:if>">
									<a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">Previous</a></li>
									<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
										<c:if test="${i==pagingInfo.currentPage }">
											<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
										</c:if>
										<c:if test="${i!=pagingInfo.currentPage }">
											<li class="page-item"><a class="page-link" href="#" onclick="pageProc(${i})">${i }</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
										<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> 
											<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
										</a>
									</c:if>
									<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a class="page-link" href="#">Next</a></li>
								</ul>
							</nav>
						</div>
                    </div>
	             </div>
	          </div>
	       </div>
	   </div>
</section>				
		
<%@ include file="../../include/bottom.jsp" %> 