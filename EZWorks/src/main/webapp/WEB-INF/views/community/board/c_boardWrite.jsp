<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/top.jsp"%>
<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
</style>

<!-- toastify-->
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<!-- filefond css-->
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">		

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">	
$(function(){
	$('#btnSubmit').click(function(){
		var selectVal= $('#selectBoard option:selected').val();
		$('input[name=boardNo]').val(selectVal);
	
		if(selectVal==0){
			Toastify({
                text: "게시판을 선택하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('#selectBoard').focus();
		}else if($('#title').val()==""){
			Toastify({
                text: "제목을 입력하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('#title').focus();
		}else if($('textarea[name=text]').val()==""){
			Toastify({
                text: "내용을 입력하세요",
                duration: 5000,
                close:false,
                gravity:"top",
                position: "center",
                backgroundColor: "#b6baea",
            }).showToast();
			event.preventDefault();
			$('#summernote').focus();
		}else{
			$('.frmWrite').submit();			
		}	
	});
	
	$('#selectBoard').on('change', function(){
	 	var type=$('#selectBoard option:selected').attr("value2");
	 	var selectVal= $('#selectBoard option:selected').val();
	 	
	 	if(type==2){
			Swal.fire({
				  title: '초기화 하시겠습니까?',
				  html: "게시판 타입이 변경되면,<br>기존에 입력했던 내용은 모두 삭제됩니다.",
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonColor: '#435ebe',
				  cancelButtonColor: '#6c757d',
				  confirmButtonText: '확인',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.value) {
					  location.href="<c:url value='/community/communityOneFeed?boardNo="+selectVal+"&communityNo=${param.communityNo}'/>";
		              //"확인" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				  }else{
					  return false;
					  $('#selectBoard').focus();
				  }
			})
			
			/* var movePage = confirm('게시판 타입이 변경되면, 기존에 입력했던 내용은 모두 삭제됩니다.\r\n초기화 하시겠습니까?');
			if(movePage==true){
				location.href="<c:url value='/community/communityOneFeed'/>";
			}else{
				return false;
			} */
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
			<form class="frmWrite" method="post" enctype="multipart/form-data"
				action="<c:url value='/community/c_boardWrite?communityNo=${param.communityNo}'/>">
			   <input type="hidden" name="boardNo"> 
			   <input type="hidden" name="communityName" value="${vo.communityName}">
			   <div class="form-group row align-items-center">
			   		<div class="col-1">
                        <label class="col-form-label" for="communityBoard">TO.</label>
                    </div>
                    <div class="col-8">
		              	<select class="form-select" id="selectBoard" name="selectBoard">
		                    <!-- <option value=""></option> -->            	
		                    <option value=""></option>
		                    <optgroup label="작성할 게시판을 선택하세요">
		                    <c:if test="${!empty boardList}">
		                    	<c:forEach var="vo2" items="${boardList}">              	
		                   			<option value="${vo2.boardNo}" value2="${vo2.boardType}">${vo2.boardName}</option>
		                    	</c:forEach>
		                    </c:if>
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

<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

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