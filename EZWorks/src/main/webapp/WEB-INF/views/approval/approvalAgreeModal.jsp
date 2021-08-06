<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal" id="agreeModal">
	<form method="post" name="agreeApprovalFrm" action="<c:url value='/approval/agree'/>">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:500px;height:500px">
	      <div class="modal-header">
	        <h5 class="modal-title">결재하기</h5>
	        <button type="button" class="btn-close agreeModal-close" data-bs-dismiss="modal" aria-label="Close">X</button>
	      </div>
	      <div class="modal-body" style="height:300px">
	      	<p id="noApprovalLine"></p>
	      	<table style="height:90%">
	
	      		<tr>
	      			<th style="width:30%;color:#00001f">결재문서명
	      			</th>
	      			<td style="width:70%">${approval.form3Title}
	      			</td>
	      		</tr>
	      		<tr>
	      			<th style="width:30%;color:#00001f">결재의견
	      			</th>
	      			<td style="width:70%">
	      				<textarea class="form-control" style="width:90%;height:70%" rows="3" name='alOpinion'></textarea>
	      			</td>
	      		</tr>
	      		<tr>
	      			<th style="width:30%;color:#00001f">결재옵션
	      			</th>
	      			<td style="width:70%;color:#00001f">
	      				<input class="form-check-input" type="checkbox" value="" id="nextApprovalCheckAgree">&nbsp;다음 문서로 이동
	      				<p>(다음결재할 문서로 이동합니다.)</p>
	      			</td>
	      		</tr>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="agreeModalOk">확인</button>
	        <button type="button" class="btn btn-secondary agreeModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	      
	      	<input type="hidden" name="approvalNo" value="${param.approvalNo}">
	      	<input type="hidden" name="nextApproval">
	      	
	  </div>
	</form>  
</div>

<script>
	$(function(){
		
		
		$('.agreeModal-close').click(function(){
			$('#agreeModal').hide();
		});
		
		
		
		$('.agreeBtn').click(function(){
			
			$('#agreeModal').show();
			console.log("@");
		}) 
		
		$('#agreeModalOk').click(function(){
			
			
			if($('#nextApprovalCheckAgree').is(':checked')){
				$('#agreeModal input[name=nextApproval]').val('Y');
			}else{
				$('#agreeModal input[name=nextApproval]').val('N');
			}
			
			
			$('form[name=agreeApprovalFrm]').submit();
		});
	})
	
	
</script>