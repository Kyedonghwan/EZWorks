<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<beans:bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
	<beans:property name="messageConverters">
		<beans:list>
			<beans:bean class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter"/>
		</beans:list>
	</beans:property>
</beans:bean>
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/summernote/summernote-lite.min.css'/>">
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
<script type="text/javascript">
	$(function(){
/* window.onload=function(){
			var boardType = $('#boardTypeSelect1').val();
			$.ajax({
				url:'<c:url value="/board/getBoardList"/>'
				,type:"post"
				,data:"boardType="+$('#boardTypeSelect1').val()
				,datatype:"json"
				,success:function(res){
					$('#boardTypeSelect2').empty();
					for(var i = 0;i<res.length;i++){
						$('#boardTypeSelect2').append("<option value='"+res[i]['boardNo']+"'>"+res[i]['boardName']+"</option>");
					}
				}
			});
		}; */
		
		$('#boardTypeSelect1').change(function(){
			
			var boardType = $('#boardTypeSelect1').val();
				$.ajax({
					url:'<c:url value="/board/getBoardList"/>'
					,type:"post"
					,data:"boardType="+$('#boardTypeSelect1').val()
					,datatype:"json"
					,success:function(res){
						$('#boardTypeSelect2').empty();
						for(var i = 0;i<res.length;i++){
							$('#boardTypeSelect2').append("<option value='"+res[i]['boardNo']+"'>"+res[i]['boardName']+"</option>");
						}
					}
				});
		});
		
/* submitBtn tempSubmitBtn */
		
		$('#submitBtn').click(function(){
			$('input[name=postingIsTemp]').val(0);
			$('input[name=boardNo]').val($('#boardTypeSelect2').val());
			if($('input[name=postingIsNotice]').is(':checked')){
				$('input[name=postingIsNotice]').val(1);
			}else{
				$('input[name=postingIsNotice]').val(0);
			}
			
			if($('#boardTypeSelect1').val()==''){
				Toastify({
			        text: "게시판을 선택하세요",
			        duration: 2000,
			        close:false,
			        gravity:"top",
			        position: "center",
			        backgroundColor: "black",
			    }).showToast();
				event.preventDefault();
			}else if($('input[name=postingTitle]').val()==''){
				Toastify({
			        text: "제목을 입력하세요",
			        duration: 2000,
			        close:false,
			        gravity:"top",
			        position: "center",
			        backgroundColor: "black",
			    }).showToast();
				event.preventDefault();
			}else if($('textarea[name=postingContent]').val()==''){
				Toastify({
			        text: "내용을 입력하세요",
			        duration: 2000,
			        close:false,
			        gravity:"top",
			        position: "center",
			        backgroundColor: "black",
			    }).showToast();
				event.preventDefault();
			}else{
				$('form[name=postingWriteForm]').submit();
			}
		});
		
		
		
		/* $('#tempSubmitBtn').click(function(){
			$.ajax({
				
			});
		}); */
	});
	function checkfiles(input){
		if(input.files){
			console.log(input.files)
		}
	}
</script>
<form name="postingWriteForm" action="<c:url value='/board/writePosting'/>" method="post" enctype="multipart/form-data" style="padding:0px;margin:0px;" >
<input type="hidden" name="boardNo">
<input type="hidden" name="postingIsTemp">
	<section style="padding:0px;">
	
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;">
			<h5>
				<a>글쓰기</a>
			</h5>
			
		</div>
		<div style="margin: 0px; padding: 0px; float: left; display: inline-flex;margin-bottom:20px;" class="form-group">
			<div style="display: inline-flex;left:0px;padding-left:20px">
			<span>to.&nbsp&nbsp&nbsp</span>
			</div>
			<select class="choices form-select" id="boardTypeSelect1" style="font-size: 0.7em; width: 100px">
				<option value="">선택하세요</option>
				<option value="전사게시판" <c:if test="${!empty boardVo&&boardVo.boardType=='전사게시판' }">selected</c:if>>전사게시판</option>
				<option value="부서게시판" <c:if test="${!empty boardVo&&boardVo.boardType=='부서게시판' }">selected</c:if>>부서게시판</option>
			</select>
			&nbsp
			<select class="choices form-select" id="boardTypeSelect2" style="font-size: 0.7em; width: 150px;display:hidden">
				<c:if test="${!empty boardVo }">
					<option value="${boardVo.boardNo }">${boardVo.boardName }</option>
				</c:if>
			</select>
		</div>
	</section>
	
	<section style="padding:0px;margin-top:50px">
		<div style="padding:20px 20px 0px 20px;margin:0px;border-top:1px solid #dfe3e7;">
			<table class="table">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
			<tr>
				<th><span class="title" style="font-size:0.85em">제목</span></th>
				<td>
					<table class="form_article">
						<tbody><tr>
							<td style="padding-bottom:10px;">
								<input class="form-control" type="text" id="subject" name="postingTitle" style="min-width:500px;clear:both;float:left"
								<c:if test="${!empty postingVO }">
									value="${postingVO.postingContent }"
								</c:if>
								>
							</td>
						</tr>
					</tbody></table>
				</td>
			</tr>
			<tr id="attachPart">
				<th>
					<span class="title" style="font-size:0.85em">파일 첨부
				<div style="display:inline;width:250;height:250" data-bs-toggle="tooltip" data-bs-placement="top" title="첨부파일 1개의 최대 용량은 100 MB 이며 최대 2 개 까지 등록 가능합니다">
						
						<span class="fa-fw select-all fas"></span></div>
				</span></th>
				<td>
					<!-- 첨부파일 default -->
						<input type="file" name="filepond" class="multiple-files-filepond" multiple>
				</td>
			</tr>		
			</tbody>
			</table>
		</div>
	</section>
	
	<!-- SUMMERNOTE -->
	<section style="margin:0px 20px 0px 20px;padding:0px;">
	<div style="display:block;float:right;padding-right:20px">
	<a href="#" style="right:0px;font-size:0.7em">임시 저장된 글</a>
	</div>
			<div class="card-body" style="padding-top:25px">
				<textarea id="summernote" style="min-width:500px" name="postingContent"></textarea>
			</div>
	</section>
	
	<section style="padding:0px;">
		<div style="padding:10px 20px 0px 20px;margin:0px;border-top:1px solid #dfe3e7;">
			<table class="table" style="border-top:none;border-bottom:none">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr style="border-top:hidden;border-bottom:hidden">
						<th><span class="title" style="font-size:0.85em">공개 설정</span></th>
						<td>
							<input class="form-check-input" type="radio" name="postingIsPublic" value="0" checked="checked">
                                <label class="form-check-label" for="flexRadioDefault1" style="font-size:0.75em">
                                    공개
                                </label>
                                &nbsp&nbsp&nbsp
                            <input class="form-check-input" type="radio" name="postingIsPublic" value="1">
                                <label class="form-check-label" for="flexRadioDefault1" style="font-size:0.75em">
                                    비공개
                                </label>
						</td>
					</tr>	
					<tr style="border-top:hidden;border-bottom:hidden">
						<th><span class="title" style="font-size:0.85em">공지로 등록</span></th>
						<td>
							<div class="form-check form-check-sm">
							<input type="checkbox" class="form-check-input form-check-primary form-check-glow" name="postingIsNotice">
							<span style="font-size:0.75em;color:#999999">공지로 등록</span>
							</div>
						</td>
					</tr>	
				</tbody>
			</table>
		</div>	
	</section>
</form>
		<div class="justify-content-center" style="display:block;text-align: center;">
			<button class="btn btn-primary btn-sm" id="submitBtn" style="font-size:0.8em;width:80px;height:35px">
				등록			
			</button>
			&nbsp&nbsp&nbsp
			<button class="btn btn-secondary btn-sm" id="tempSubmitBtn" style="font-size:0.8em;width:80px;height:35px">
				임시저장			
			</button>
		</div>

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
    FilePondPluginImageResize
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
<script src="<c:url value='/resources/vendors/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/summernote/summernote-lite.min.js'/>"></script>
<script type="text/javascript">
    $('#summernote').summernote({
        tabsize: 2,
        height: 360,
    });
    $("#hint").summernote({
        height: 100,
        toolbar: false,
        placeholder: 'type with apple, orange, watermelon and lemon',
        hint: {
            words: ['apple', 'orange', 'watermelon', 'lemon'],
            match: /\b(\w{1,})$/,
            search: function (keyword, callback) {
                callback($.grep(this.words, function (item) {
                    return item.indexOf(keyword) === 0;
                }));
            }
        }
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
