<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal" id="disagreeModal">
	<form method="post" name="disagreeApprovalFrm" action="<c:url value='/approval/disagree'/>">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:500px;height:500px">
	      <div class="modal-header">
	        <h5 class="modal-title">반려하기</h5>
	        <button type="button" class="btn-close disagreeModal-close" data-bs-dismiss="modal" aria-label="Close">X</button>
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
	      			<th style="width:30%;color:#00001f">반려결재의견
	      			</th>
	      			<td style="width:70%">
	      				<textarea class="form-control" style="width:90%;height:70%" rows="3" name='alOpinion' placeholder='반려 결재 의견 입력은 필수입니다.'></textarea>
	      			</td>
	      		</tr>
	      		<tr>
	      			<th style="width:30%;color:#00001f">결재옵션
	      			</th>
	      			<td style="width:70%;color:#00001f">
	      				<input class="form-check-input" type="checkbox" value="" id="nextApprovalCheckDisagree">&nbsp;다음 문서로 이동
	      				<p>(다음결재할 문서로 이동합니다.)</p>
	      			</td>
	      		</tr>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="disagreeModalOk">확인</button>
	        <button type="button" class="btn btn-secondary disagreeModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	      
	      	<input type="hidden" name="approvalNo" value="${param.approvalNo}">
	      	<input type="hidden" name="nextApproval">
	  </div>
	</div>
</form>  
</div>


<script>
	$(function(){
		
		
		$('.disagreeModal-close').click(function(){
			$('#disagreeModal').hide();
		});
		
		
		
		$('.disagreeBtn').click(function(){
			console.log("@2");
			$('#disagreeModal').show();
		}) 
		
		$('#disagreeModalOk').click(function(){
			if($('#disagreeModal textarea[name=alOpinion]').val()==0){
				Toastify({
					text:"반려 결재 의견 입력은 필수입니다.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				$('#disagreeModal textarea[name=alOpinion]').focus();
				return false;
			}
			
			if($('#nextApprovalCheckDisagree').is(':checked')){
				$('#disagreeModal input[name=nextApproval]').val('Y');
			}else{
				$('#disagreeModal input[name=nextApproval]').val('N');
			}
			
			
			$('form[name=disagreeApprovalFrm]').submit();
		});
	})
	
	
</script>