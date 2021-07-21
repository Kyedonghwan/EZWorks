<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	$(function(){
		
		$('#fileUpload').click(function(){
			$.ajax({
				url:"<c:url value='/archiveFolder/list'/>",
				dataType:"json",
				type:"get",
				success:function(res){
					var temp="";
					temp+='<option value="1">전사자료실</option>';
					$.each(res,function(idx,item){
						if(item.step==1){
							temp+='<option value='+item.no+'>-'+item.name+'</option>';
								$.each(res,function(idx2,item2){
									if(item2.step==2 && item2.parentNo==item.no){
										temp+='<option value='+item2.no+'>--'+item2.name+'</option>';
											$.each(res,function(idx3,item3){
												if(item3.step==3 && item3.parentNo==item2.no){
													temp+='<option value='+item3.no+'>---'+item3.name+'</option>';
														$.each(res,function(idx4,item4){
															if(item4.step==4 && item4.parentNo==item3.no){
																temp+='<option value='+item4.no+'>----'+item4.name+'</option>';
															}	
														})
												}	
											})
									}	
								})
						}
					})
					$('#selectModal').html(temp);
					$('#uploadModal').modal('show');
				},
				error:function(e){
					alert("uploadModal - 에러");
				}
			})
		})
		
		var pond = FilePond.create( document.querySelector('.multiple-files-filepond'), { 
	        allowImagePreview: true,
	        allowMultiple: true,
	        allowFileEncode: false,
	        required: false
	    });
		
		$('#uploadOk').click(function(){
			var formData=new FormData();
			formData.append('folderNo',$('#selectModal option:selected').val());
			pondFiles = pond.getFiles();
			for(var i=0;i<pondFiles.length;i++){
				   formData.append("file" + i, pondFiles[i].file);}
			

			$.ajax({
				type:"POST",
				enctype:'multipart/form-data',
				url:'<c:url value="/archive/upload"/>',
				data: formData,
				dataType:"json",
				processData:false,
				contentType: false,
				cache: false,
				success: function (res) {
					$('#uploadModal').modal('hide');
					alert('자료 등록 성공');
					$.showFolderList();
				}, 
				error: function (e) {
					alert('파일 생성중 오류발생');
				}

			});
		})
	})
	
</script>
<!-- 업로드 모달 -->
    <div class="modal" tabindex="-1" id="uploadModal">
    	<form name="uploadFrm" method="post" 
			 enctype="multipart/form-data" >
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:800px;height:550px">
	      <div class="modal-header">
	        <h5 class="modal-title">파일 업로드</h5>
	        <button type="button" class="btn-close uploadModal-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="card">
		        <div class="card-header">
		            <h5 class="card-title">대상 폴더 선택</h5>
		        	<select id="selectModal" class="form-select" aria-label="Default select example" name="folderNo">
		        	 
					</select>
		        </div>
		        <div class="card-content">
		            <div class="card-body">
		                <p class="card-text">Using the basic table up, upload here to see how
		                    <code>.multiple-files-filepond</code>-based basic file uploader look. You can use
		                    <code>allowMultiple</code> or <code>multiple</code> attribute too to implement multiple upload.
		                </p>
		                <!-- File uploader with multiple files upload -->
		                <input type="file" class="multiple-files-filepond" name="file" multiple="true">
		            </div>
		        </div>
    		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="uploadOk">업로드</button>
	        <button type="button" class="btn btn-secondary uploadModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	  </form>
	</div>
   	