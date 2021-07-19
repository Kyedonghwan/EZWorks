<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<%@ include file="../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: '자유롭게 글을 작성할 수 있습니다. 명예훼손이나 상대방을 비방, 불쾌감을 주는 글, 욕설, 남을 모욕하는 글은 임의로 제제가 있을 수 있습니다.',
	    tabsize: 2,
	    minHeight : null,
		maxHeight : null,
		lang: 'ko-KR',
		height: 350,
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});
</script>
<%@ include file="sidebar2.jsp" %>					
<%@ include file="../include/middle.jsp" %>

<!-- 소메뉴별 컨텐츠 구성 영역 -->
<section class="row">
	<div class="col-12 col-lg-12">
		<div class="card-header">
			<h5 class="card-title">글쓰기</h5>
		</div>
		<div class="card-body">
			<form class="frmWrite" method="post" action="<c:url value='/community/communityWrite'/>">
			   <div class="col-md-10 form-group">
	              	<select class="form-select" id="communityBoard" name="communityBoard">
	                    <optgroup label="글 작성할 게시판을 선택하세요">
                   			<option>Wish list 적고 가세요!</option>
                   			<option>암벽클라이밍 동호회</option>
	                   	</optgroup>
	               	</select>
               </div>
			   <textarea id="summernote" name="editordata"></textarea><br>
			  
			   <div class="col-sm-12 d-flex justify-content-end">
                  <button type="submit" id="btnSubmit" 
                  		class="btn btn-primary me-1 mb-1">등록</button>
                  <button type="reset" 
                  		class="btn btn-light-secondary me-1 mb-1">취소</button>
               </div>
			</form>
		</div>
	</div>
</section>
<%@ include file="../include/bottom.jsp" %>