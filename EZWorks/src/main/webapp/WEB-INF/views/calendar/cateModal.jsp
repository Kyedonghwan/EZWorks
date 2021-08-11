<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>
<script>
$(document).ready(function () {
	 $('#cateInsertOk').click(function(){
		 if($('#insertCateName').val().length<1){
			 Toastify({
	               text:"이름을 입력하세요.",
	               duration: 2000,
	               close:false,
	               gravity:"top",
	               position:"center",
	               backgroundColor:"black",
	            }).showToast();
			
			return false;
		 }else{
         	$('form[name=insertMyCal]').submit();
		 }
     });
});
</script>

<style>
#insertCateName{
	width:60%;
	margin-left: 76px;
}
@media screen {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 25%;
	}
}

.modal-body {
	margin-top: 7px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.modal {
	text-align: center;
}
#color {
	width:30%;
    height: 3rem;
    padding: .5rem;
    background-color: transparent;
    border: 0;
    border-radius: 100%;
    margin-top: 10px;
}
.registerDiv {
	margin: 10px 0 15px 0;
	height: 18%;
}
.writeLabel2 {
	width: 15%;
	float: left;
	text-align: left;
	padding: 10px 10px 20px 10px;
	clear: left;
}
</style>
<div class="modal" id="insertMyCal">
	<form name="insertMyCal" method="post" action="<c:url value='/calendar/cateModal'/>">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 500px; height: 300px">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel4">내 캘린더 추가</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<input type="hidden" name="empNo" id="showEmpNo" value="1"> 
					<div class="registerDiv">
					<label class="writeLabel2">이름</label>
					<input type="text" id="insertCateName" class="form-control round"
						name="schCateName">
					</div>
					<div class="registerDiv">
					<label class="writeLabel2">색상</label>
					<input class="txt2 w_max" type="color" name="schColor" id="color">
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-primary ml-1"
						data-bs-dismiss="modal" id="cateInsertOk" value="확인">
					<button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> 
						<span class="d-none d-sm-block">취소</span>
					</button>
				</div>
			</div>
		</div>
	</form>
</div>