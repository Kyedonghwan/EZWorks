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
	tr.hover-color-change:hover{
		background-color:#f9f9f9;
	}
</style>

	<section style="padding:0px">
		<!-- <div style="width:249px;height:64px;margin:0;padding:0;padding:24px 24px 16px;float:right">
			<span class="recent-header">최신글 모음</span>
		</div> -->
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>${boardVo.boardName }</a>
			</h5>
		</div>
		
	</section>
	
	<section style="padding:0px">
		<div style="padding:5px;margin:20px;border:1px solid #dfe3e7;border-radius:3px;background-color:#f9f9f9">
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
					<span>boardcontent파라미터</span>
				</li>
			</ul>
		</div>
	</section>
	
	<section style="padding:0px;padding-right:20px;padding-left:20px;">
			<div style="display:inline-flex;">
				<a href="<c:url value='/board/writePosting?boardNo=${boardVo.boardNo }'/>"
				class="btn btn-outline-secondary btn-sm" style="font-size:0.7em;padding-top:7px">새글쓰기</a>
			</div>
			<div style="margin: 0px; padding: 0px; float: right; right: 0px; display: inline-flex">
				<select class="choices form-select" style="font-size:0.7em;width:60px">
					<option value="20">20</option>
					<option value="40">40</option>
					<option value="60">60</option>
					<option value="80">80</option>
				</select>
			</div>
	</section>
	
	<div class="table-responsive" style="margin:0px;padding:0px;">
		<table class="table mb-0 table-lg" style="width:100%;font-size:0.8em">
			<colgroup>
				<col style="width:80px">
				<col style="width:auto">
				<col style="width:110px">
				<col style="width:100px">
				<col style="width:80px">
				<col style="width:80px">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
					<th scope="col">좋아요</th>
				</tr>
			</thead>
			<tbody class="table-hover">
				<c:if test="${empty postingList }">
					<tr>
						<td colspan="6" style="text-align:center;">데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty postingList }">
				<c:forEach var="empPostingVo" items="${postingList }">
					<tr class="hover-color-change" onclick="location.href='#'">
						<td></td>
						<td>${empPostingVo.postingTitle }</td>
						<td>${empPostingVo.empName }</td>
						<td><fmt:formatDate value="${empPostingVo.postingRegdate }" pattern="yy/MM/dd"/>
						</td>
						<td></td>
						<td>${empPostingVo.postingLikes }</td>
					</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div style="margin-top:40px">
		<nav aria-label="Page navigation example">
			<ul class="pagination pagination-primary pagination-sm justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<li class="page-item active"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>