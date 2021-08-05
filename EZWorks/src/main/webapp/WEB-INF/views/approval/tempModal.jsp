<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<div class="modal" tabindex="-1" id="tempModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">임시 저장</h5>
        <button type="button" class="btn-close tempModal-close" data-dismiss="modal" aria-label="Close">
         X</button>
      </div>
      <div class="modal-body">
        <h5>임시저장 하시겠습니까?</h5>
		<p>임시저장된 문서는 임시 저장함에 보관됩니다.</p>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary tempModalOk">확인</button>
        <button type="button" class="btn btn-secondary tempModal-close" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		
		
		$('.tempModal-close').click(function(){
			$('#tempModal').hide();
		});
		
		$('.tempSaveBtn').click(function(){
			
			$('#tempModal').show();
		}) 
		
		$('.tempModalOk').click(function(){
			
				
				$('#currentOrder').val(0);
				$('input[name=formNo]').val($('#currentFormNo').val())
				$('input[name=approvalStringNo]').val($('#approvalStringNo').text());
				$('input[name=form3Title]').val($('#approvalName1').val());
				$('textarea[name=form3Content]').text($('.note-editable').html())
				
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
				$('input[name=currentState]').val('임시저장');
				$('form[name=approvalFrm]').submit();
			});
			
			
	})
	
	
</script>