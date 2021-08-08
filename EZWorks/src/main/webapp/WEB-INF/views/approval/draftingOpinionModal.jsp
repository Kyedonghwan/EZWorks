<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal" tabindex="-1" id="draftingOpinionModal">
	
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:500px;height:500px">
	      <div class="modal-header">
	        <h5 class="modal-title">결재요청</h5>
	        <button type="button" class="btn-close draftingOpinionModal-close" data-bs-dismiss="modal" aria-label="Close">X</button>
	      </div>
	      <div class="modal-body" style="height:300px">
	      	<p id="noApprovalLine"></p>
	      	<table style="height:90%">
	
	      		<tr>
	      			<th style="width:30%;color:#00001f">결재문서명
	      			</th>
	      			<td style="width:70%" id="approvalName2">
	      			</td>
	      		</tr>
	      		<tr>
	      			<th style="width:30%;color:#00001f">기안의견
	      			</th>
	      			<td style="width:70%">
	      				<textarea class="form-control" style="width:90%;height:70%" rows="3" name='approvalDraftingOpinionTemp'></textarea>
	      			</td>
	      		</tr>
	      		<tr>
	      			<th style="width:30%;color:#00001f;">긴급문서
	      			</th>
	      			<td style="width:70%;color:#00001f">
	      				<input class="form-check-input" type="checkbox" value="" id="emergencyCheck">&nbsp;긴급
	      				<p>결재자의 대기문서 상단에 표시됩니다.</p>
	      			</td>
	      		</tr>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="draftingOpinionModalOk">확인</button>
	        <button type="button" class="btn btn-secondary draftingOpinionModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	      
	      </div>
	  </div>
</div>

<script>
	$(function(){
		
		
		$('.draftingOpinionModal-close').click(function(){
			$('#draftingOpinionModal').hide();
		});
		
		
		
		$('.approvalBtn').click(function(){
			if($('#approvalLineDetail').children().children('li').eq(1).length){
				
				$('#noApprovalLine').empty();
				$('input[name=currentState]').val('진행중');
				$('#currentOrder').val(1);
				
			}else{
				$('#noApprovalLine').text('설정된 결재자가 없으므로 결재요청하면 바로 완료처리 됩니다.');
				$('input[name=currentState]').val('결재완료');
				$('#currentOrder').val(0);
			}
			$('#approvalName2').html($('#approvalName1').val())
			$('#draftingOpinionModal').show();
		}) 
		
		$('#draftingOpinionModalOk').click(function(){
			$('#draftingOpinionModal').hide();
			
			
			if($('#emergencyCheck').is(':checked')){
				$('input[name=emergency]').val('Y');
			}else{
				$('input[name=emergency]').val('N');
			}
			
			$('input[name=formNo]').val($('#currentFormNo').val())
			$('input[name=approvalStringNo]').val($('#approvalStringNo').text());
			$('input[name=form3Title]').val($('#approvalName1').val());
			$('textarea[name=form3Content]').text($('.note-editable').html());
			$('input[type=radio]').each(function(){
				if($(this).is(':checked')){
					$('input[name=form20Div]').val($(this).val());
				}
			})
			$('input[name=form20Startdate]').val($('#startdate').val());
			$('input[name=form20A]').val($('#startHourSelect').val());
			$('input[name=form20B]').val($('#startMinuteSelect').val());
			$('input[name=form20C]').val($('#endHourSelect').val());
			$('input[name=form20D]').val($('#endMinuteSelect').val());
			$('input[name=form20E]').val($('#totalTime').text());
			$('input[name=form20Description]').val($('#description').val());
			
			<!-- 결재선 저장 -->
			$('#approvalLineDetail').children().children('li:gt(0)').each(function(idx,item){
				if(idx==0){
					$('input[name=alEmpNo]').remove();
					$('input[name=alDeptNo]').remove();
					$('input[name=alOrderNo]').remove();
				}
					
				$('#isExisted').append('<input name="alEmpNo" type="hidden" value="'+$(this).children().eq(1).children().eq(0).children().val()+'">');
				$('#isExisted').append('<input name="alDeptNo" type="hidden" value="'+$(this).children().eq(1).children().eq(1).children().val()+'">');
				$('#isExisted').append('<input name="alOrderNo" type="hidden" value="'+(idx+1)+'">');
			})
			<!-- 참조 저장 -->
			$('#formDetail3').children().each(function(idx,item){
				if(idx==0){
					$('input[name=referenceEmpNo]').remove();
					$('input[name=referenceDeptNo]').remove();
				}
				$('#isExisted').append('<input name="referenceEmpNo" type="hidden" value="'+$(this).children().eq(0).val()+'">');
				$('#isExisted').append('<input name="referenceDeptNo" type="hidden" value="'+$(this).children().eq(1).val()+'">');
			})
			<!-- 열람 저장 -->
			$('#formDetail4').children().each(function(idx,item){
				if(idx==0){
					$('input[name=browseEmpNo]').remove();
				}
				$('#isExisted').append('<input name="browseEmpNo" type="hidden" value="'+$(this).children().eq(0).val()+'">');
			})
			<!-- 수신 저장 -->
			$('#formDetail2').children().each(function(idx,item){
				if(idx==0){
					$('input[name=receptionEmpNo]').remove();
				}
				$('#isExisted').append('<input name="receptionEmpNo" type="hidden" value="'+$(this).children().eq(0).val()+'">');
			})
			
			<!-- 관련문서 저장 -->
			
			$('.raRow').each(function(idx,item){
				if(idx==0){
					$('input[name=raapprovalNo]').remove();
					$('input[name=raapprovalName]').remove();
				}
				$('#isExisted').append('<input name="raapprovalNo" type="hidden" value="'+$(this).children().children('input').val()+'">');
				$('#isExisted').append('<input name="raapprovalName" type="hidden" value="'+$(this).children().children('span').text()+'">');
			})
			
			$('textarea[name=approvalDraftingOpinion]').val($('textarea[name=approvalDraftingOpinionTemp]').val());
			$('form[name=approvalFrm]').submit();
		});
		
	})
	
	
</script>