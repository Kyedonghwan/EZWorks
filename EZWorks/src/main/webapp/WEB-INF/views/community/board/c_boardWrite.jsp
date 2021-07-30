<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">		
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript">	
$(function(){
	$('#btnSubmit').click(function(){
		var selectVal= $('#selectBoard option:selected').val();
		$('input[name=boardNo]').val($('#selectBoard option:selected').val());
		
		if(selectVal==null || selectVal.isEmpty()){
			Toastify({
                text: "게시판을 선택하세요",
                duration: 2000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#4fbe87",
            }).showToast();
			event.preventDefault();
			$('select[name=communityBoard]').focus();
		}else{
			$('.frmWrite').submit();
		}	
	});
});
</script>

<%@ include file="../../community/sidebar/sidebar2.jsp" %>	
<%@ include file="../../include/middle.jsp" %>

<!-- 소메뉴별 컨텐츠 구성 영역 -->
<section class="row">
	<div class="col-12 col-lg-12">
		<div class="card-header">
			<h5 class="card-title">글쓰기</h5>
		</div>
		<div class="card-body">
			<form class="frmWrite" method="post" action="<c:url value='/community/c_boardWrite?communityNo=${param.communityNo}'/>">
			   <input type="hidden" name="boardNo">
			   <div class="form-group row align-items-center">
			   		<div class="col-1">
                        <label class="col-form-label" for="communityBoard">TO.</label>
                    </div>
                    <div class="col-8">
		              	<select class="form-select" id="selectBoard" name="selectBoard">
		                    <optgroup label="작성할 게시판을 선택하세요">                 	
		                    	<c:forEach var="vo2" items="${boardList}">
		                   			<option value="${vo2.boardNo}">${vo2.boardName}</option>                 	
		                    	</c:forEach>
		                   	</optgroup>
		               	</select>
	            	</div>
               </div>
               <div class="row">
	               <div class="col-12">
		               <div class="form-group row align-items-center">
		               		<div class="col-1">
		                        <label class="col-form-label" for="title">제목</label>
		                    </div>
		                    <div class="col-11">
		                        <input type="text" id="title" class="form-control" name="title">
		                    </div>
		          	   </div>
	          	   </div>
          	   </div>
          	   <div class="row">
	               <div class="col-12">
		               <div class="form-group row align-items-center">
		               		<div class="col-12">
		                    	<div data-bs-toggle="tooltip" data-bs-placement="top">
		                        <label class="col-form-label" for="title">파일 첨부</label>
		                        	<span class="fa-fw select-all fas"></span>
		                        	<span style="font-weight:0.8em">첨부파일 1개의 최대 용량은 100 MB 이며 최대 2 개 까지 등록 가능합니다</span>
			                        <input type="file" class="multiple-files-filepond" multiple>
		                        </div>
		                    </div>
		          	   </div>
	          	   </div>	               
		       </div>
               <div class="summernote">
				   <textarea id="summernote" name="text"></textarea><br>
               </div>
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
         
<!-- toastify -->
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<!-- image editor -->
<script src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-filter/dist/filepond-plugin-image-filter.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>
<!-- filepond validation -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script type="text/javascript">
   		 // register desired plugins...
		FilePond.registerPlugin(
        // validates the size of the file...
        FilePondPluginFileValidateSize,
        // validates the file type...
        FilePondPluginFileValidateType,

        // calculates & dds cropping info based on the input image dimensions and the set crop ratio...
        FilePondPluginImageCrop,
        // preview the image file type...
        FilePondPluginImagePreview,
        // filter the image file
        FilePondPluginImageFilter,
        // corrects mobile image orientation...
        FilePondPluginImageExifOrientation,
        // calculates & adds resize information...
        FilePondPluginImageResize,
    );
    
	// Filepond: Multiple Files
    FilePond.create( document.querySelector('.multiple-files-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: false,
        maxFiles: 2,
        checkValidity: false,
        maxFileSize: '100MB',
        storeAsFile: true
    });
		    
    $('.multiple-files-filepond').on('FilePond:addfile', function(e){
    	console.log('file added event', e);
    });    
    
</script>
		
<!-- summernote -->
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: '자유롭게 글을 작성할 수 있습니다. <br>명예훼손이나 상대방을 비방, 불쾌감을 주는 글, 욕설, 남을 모욕하는 글은 임의로 제제가 있을 수 있습니다.',
	    tabsize: 2,
	    minHeight : null,
		maxHeight : null,
		lang: 'ko-KR',
		height: 350,
		toolbar: [
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']				
	});
	
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
        }
       e.preventDefault();
  	})
  	
	
	});
</script>

<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script type="text/javascript">
    function saveContent(){
    	var summernoteContent = $('#summernote').summernote('code');
    	console.log("summernoteContent : "+summernoteContent);
    }
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
</script>
<%@ include file="../../include/bottom.jsp" %>