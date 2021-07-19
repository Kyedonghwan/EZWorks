<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	$(function(){
		
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
					console.log(res);
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
		        	  <option value="1">전사자료실</option>
					  <c:forEach var="vo" items="${archiveFolderList}">
					  	<c:if test="${vo.step==1}">
					  		<option value="${vo.no}">-${vo.name}</option>
					  		<c:forEach var="vo2" items="${archiveFolderList}">
					  			<c:if test="${vo2.step==2 && vo.no==vo2.parentNo}">
					  				<option value="${vo2.no}">--${vo2.name}</option>
					  				<c:forEach var="vo3" items="${archiveFolderList}">
					  					<c:if test="${vo3.step==3 && vo2.no==vo3.parentNo}">
					  						<option value="${vo3.no}">---${vo3.name}</option>
					  						<c:forEach var="vo4" items="${archiveFolderList}">
					  							<c:if test="${vo4.step==4 && vo3.no==vo4.parentNo}">
					  								<option value="${vo4.no}">----${vo4.name}</option>
					  							</c:if>
					  						</c:forEach>
					  					</c:if>
					  				</c:forEach>
					  			</c:if>
					  		</c:forEach>
					  	</c:if>
					  </c:forEach>
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
   	