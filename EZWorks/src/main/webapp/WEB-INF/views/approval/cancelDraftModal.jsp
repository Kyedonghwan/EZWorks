<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" tabindex="-1" id="cancelDraftModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">작성 취소</h5>
        <button type="button" class="btn-close cancelDraftModal-close" data-dismiss="modal" aria-label="Close">
         X</button>
      </div>
      <div class="modal-body">
        <h5>상신 취소하시겠습니까?</h5>
       
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary cancelDraftModalOk">확인</button>
        <button type="button" class="btn btn-secondary cancelDraftModal-close" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<script>
$(function(){
	$('.cancelDraftModal-close').click(function(){
		$('#cancelDraftModal').hide();
	});

	$('.cancelDraftBtn').click(function(){
		$('#cancelDraftModal').show();
	}) 

	$('.cancelDraftModalOk').click(function(){
		location.href="<c:url value='/approval/cancelDraft'/>?approvalNo=${param.approvalNo}";
	});
})
</script>