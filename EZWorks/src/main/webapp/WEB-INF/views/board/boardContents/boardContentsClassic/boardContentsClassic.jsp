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
	
	#fav-toggle{
		color:yellow;
	}
</style>
<script type="text/javascript">
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
	/* $(function(){
		$('#fav-toggle').click(
		function(){
			$('#fav-toggle').css({"color":"yellow"});
		},
		function(){
			$('#fav-toggle').css({"color":"black"});
		});
	}); */
	
	$(function(){
		$('select[name=recordCountPerPage]').change(function(){
			var recordCountPerPage = $('select[name=recordCountPerPage]').val();
			$('input[name=recordCountPerPage]').val(recordCountPerPage);
			$('form[name=frmPage]').submit();
		});
		
		
	});
</script>
<form action="<c:url value='/board/selectedBoard'/>" name="frmPage" method="post" style="padding:none;margin:none">
	<input type="hidden" name="currentPage" value="<c:if test='${empty param.currentPage }'>1</c:if><c:if test='${!empty param.currentPage }'>${param.currentPage }</c:if>">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	<input type="hidden" name="boardNo" value="${boardVo.boardNo }">
	<input type="hidden" name="recordCountPerPage" value="${pagingInfo.recordCountPerPage }">
</form>

	<section style="padding:0px">

		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>${boardVo.boardName }</a> <a href="#"><span id="fav-toggle" class="fa-fw select-all fas" style="height:15px"></span></a>
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
	
	<section style="padding:0px;padding-right:20px;padding-left:20px;">
			<div style="display:inline-flex;">
				<a href="<c:url value='/board/writePosting?boardNo=${boardVo.boardNo }'/>"
				class="btn btn-outline-secondary btn-sm" style="font-size:0.7em;padding-top:7px">새글쓰기</a>
			</div>
			<div style="margin: 0px; padding: 0px; float: right; right: 0px; display: inline-flex">
				<select class="choices form-select" name="recordCountPerPage" style="font-size:0.7em;width:60px">
					<option value="20"
					<c:if test="${pagingInfo.recordCountPerPage==20 }">
					selected="selected"
					</c:if>
					>20</option>
					<option value="40"
					<c:if test="${pagingInfo.recordCountPerPage==40 }">
					selected="selected"
					</c:if>
					>40</option>
					<option value="60"
					<c:if test="${pagingInfo.recordCountPerPage==60 }">
					selected="selected"
					</c:if>
					>60</option>
					<option value="80"
					<c:if test="${pagingInfo.recordCountPerPage==80 }">
					selected="selected"
					</c:if>
					>80</option>
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
				<c:forEach var="postVo" items="${postingList }">
					<tr class="hover-color-change" onclick="location.href='<c:url value="/board/postingDetail?postingNo=${postVo.postingNo }&currentStatusVal=${postVo.currentStatusVal }"/>'">
						<td>${postVo.currentStatusVal }</td>
						<td>${postVo.postingTitle }</td>
						<td>${postVo.empName }</td>
						<td><fmt:formatDate value="${postVo.postingRegdate }" pattern="yy/MM/dd"/>
						</td>
						<td>${postVo.postingViewCount }</td>
						<td>${postVo.postingLikes }</td>
					</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
	<div style="margin-top:40px">
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
					<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
					</a>
				</c:if>
				<li class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="divSearch" style="display:flex;justify-content: center!important;">
   	<form name="frmSearch" method="post" action='<c:url value="/board/selectedBoard"/>'>
   		<div class="input-group input-group-sm mb-1">
        <select name="searchCondition" class="form-select input-group-text" style="width:80px">
            <option value="posting_title" 
            	<c:if test="${searchVo.searchCondition == 'posting_title' }">            	
            		selected="selected"
            	</c:if>
            >제목</option>
            <option value="posting_content"
            	<c:if test="${searchVo.searchCondition == 'posting_content' }">            	
            		selected="selected"
            	</c:if>
            >내용</option>
            <option value="emp_name" 
            	<c:if test="${searchVo.searchCondition == 'emp_name' }">            	
            		selected="selected"
            	</c:if>
            >작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력" class="form-control" value="${searchVo.searchKeyword }" style="width:200px "> 
        <input type="hidden" name="boardNo" value="${boardVo.boardNo }">
		<input type="submit" class= "btn btn-primary" value="검색">
		</div>
    </form>
	</div>
