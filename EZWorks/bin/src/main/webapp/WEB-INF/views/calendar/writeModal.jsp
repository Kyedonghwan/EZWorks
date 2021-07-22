<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.writeLabel{
	width: 20%;
	float: left;
	text-align: right;
	padding: 3px 15px 20px 0;
	clear: left;		
}
@media screen { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 25%;
        }
}
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
.modal {
        text-align: center;
}
.input{
	 	width: 55%;
		height: 1.5em;
		font-size: 0.9em;
		margin : 5px 0 20px 0;
}
.chkbox, select{
	margin : 10px 0 25px 0;
}

</style>
<div class="modal" tabindex="-1" id="writeModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form name="writeSch" method="post"
		action="<c:url value='/calendar/calendarMain'/>">
		<div class="modal-dialog">
					<div class="modal-content" style="width:700px;height: 400px">
						<div class="modal-header">
							<h5 class="modal-title">일정등록</h5>
							<button type="button" class="close rounded-pill"
								data-bs-dismiss="modal" aria-label="Close">
								<i data-feather="x"></i>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<label class="writeLabel">
									일정명
								</label>
								<input type="text" value="" class="input">
							</div>
							<div>
								<label class="writeLabel">일정일</label>
								<input type="checkbox" value="종일" class="chkbox">종일
							</div>
							<div>
								<label class="writeLabel">전사일정</label>
								<input type="checkbox" value="전사일정" class="chkbox">전사일정
							</div>
							<div>
								<label class="writeLabel">내 캘린더</label>
								<select>
									<option>(기본)내 일정</option>
									<option>내 일정(중요)</option>
									<option>연차</option>
								</select>
							</div>
							<div>
								<label class="writeLabel">장소</label>
								<input type="text" class="input">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">일정상세입력</span>
							</button>
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">확인</span>
							</button>
							<button type="button" class="btn btn-light-primary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> <span
									class="d-none d-sm-block">닫기</span>
							</button>
							
						</div>
					</div>
				</div>
	</form>
</div>
