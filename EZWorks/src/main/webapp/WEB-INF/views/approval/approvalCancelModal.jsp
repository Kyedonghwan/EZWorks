<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal" tabindex="-1" id="approvalCancelModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">결재 취소</h5>
        <button type="button" class="btn-close approvalCancelModal-close" data-dismiss="modal" aria-label="Close">
         X</button>
      </div>
      <div class="modal-body">
        <p>${approval.form3Title} 문서에 대한 결재를 취소하시겠습니까?</p>
        <form action="<c:url value='/approval/cancel'/>" method="post" name="cancelApprovalFrm">
        	<input type="hidden" name="approvalNo" value="${param.approvalNo}">
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary approvalCancelModalOk">결재 취소하기</button>
        <button type="button" class="btn btn-secondary approvalCancelModal-close" data-dismiss="modal">돌아가기</button>
      </div>
    </div>
  </div>
</div>




<script>
	$(function(){
		
		
		$('.approvalCancelModal-close').click(function(){
			$('#approvalCancelModal').hide();
		});
		
		$('.cancelBtn').click(function(){
			
			$('#approvalCancelModal').show();
		}) 
		
		$('.approvalCancelModalOk').click(function(){
			
			$('form[name=cancelApprovalFrm]').submit();
		});
	})
	
	
</script>