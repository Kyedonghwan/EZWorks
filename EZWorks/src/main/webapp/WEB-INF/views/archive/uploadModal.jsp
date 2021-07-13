<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 업로드 모달 -->
    <div class="modal" tabindex="-1" id="uploadModal">
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
		        	<select class="form-select" aria-label="Default select example">
					  <option selected>Open this select menu</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
		        </div>
		        <div class="card-content">
		            <div class="card-body">
		                <p class="card-text">Using the basic table up, upload here to see how
		                    <code>.multiple-files-filepond</code>-based basic file uploader look. You can use
		                    <code>allowMultiple</code> or <code>multiple</code> attribute too to implement multiple upload.
		                </p>
		                <!-- File uploader with multiple files upload -->
		                <input type="file" class="multiple-files-filepond" multiple>
		            </div>
		        </div>
    		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">업로드</button>
	        <button type="button" class="btn btn-secondary uploadModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
   	