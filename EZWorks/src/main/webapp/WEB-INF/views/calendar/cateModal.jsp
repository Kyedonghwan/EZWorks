<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function () {
	 $('#cateInsertOk').click(function(){
          $('form[name=insertMyCal]').submit();
     });
});
</script>

<style>
#insertCateName{
	width:90%;
}
</style>
<div class="modal fade text-left" id="insertMyCal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true"
	data-bs-backdrop="false">
	<form name="insertMyCal" method="post" action="<c:url value='/calendar/cateModal'/>">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content"
				style="width: 400px; height: 250px; box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, .2);">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel4">내 캘린더 추가</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" name="empNo" id="showEmpNo" value="1"> 
					<input
						type="text" id="insertCateName" class="form-control round"
						name="schCateName">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">취소</span>
					</button>
					<input type="submit" class="btn btn-primary ml-1"
						data-bs-dismiss="modal" id="cateInsertOk" value="확인">
				</div>
			</div>
		</div>
	</form>
</div>