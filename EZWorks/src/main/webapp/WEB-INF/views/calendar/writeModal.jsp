<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 <script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 //maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
            
    });
</script>
<style>
.writeLabel{
	width: 20%;
	float: left;
	text-align: left;
	padding: 5px 10px 20px 10px;
	clear: left;		
}
.writeLabel1{
	width: 10%;
	float: left;
	text-align: left;
	padding: 5px 0 20px 10px;
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
.modal-body{
	margin-top: 20px;
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
.chkbox, .selectSch{
	margin : 10px 0 25px 0;
}
.datepick{
	width: 15%;
		height: 1.5em;
		font-size: 0.9em;
		margin : 5px 0 20px 0;
}

</style>
<div class="modal" tabindex="-1" id="writeModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form name="writeSch" method="post"
		action="<c:url value='/calendar/calendarMain'/>">
		<div class="modal-dialog">
					<div class="modal-content" style="width:700px;height: 450px">
						<div class="modal-header">
							<h5 class="modal-title">일정등록</h5>
							<button type="button" class="close rounded-pill"
								data-bs-dismiss="modal" aria-label="Close">
								<i data-feather="x"></i>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<label class="writeLabel1">
									일정명
								</label>
								<span style="color:red; padding-right: 55px; width: 40%">*</span>
								<input type="text" name="schTitle" id="schTitle" value="${schTitle}" class="input">
							</div>
							<div>
								<label class="writeLabel">일시</label>
								<input type="text" id="startDate" name="schStart" value="${schStart}" class="datepick">
								<label for="to">~</label>
								<input type="text" id="endDate" name="schEnd" value="${schEnd}" class="datepick">&nbsp;&nbsp;
								<input type="checkbox" value="종일" class="chkbox">종일
							</div>
							<div>
								<label class="writeLabel">전사일정</label>
								<input type="checkbox" value="전사일정" class="chkbox">전사일정
							</div>
							<div>
								<label class="writeLabel">내 캘린더</label>
								<select class="selectSch">
									<option>(기본)내 일정</option>
									<option>내 일정(중요)</option>
									<option>연차</option>
								</select>
							</div>
							<div>
								<label class="writeLabel">장소</label>
								<input type="text" name="schPlace" value="${schPlace}" class="input">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">일정상세입력</span>
							</button>
							<button type="button" id="sch_btn"class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">확인</span>
							</button>
							<button type="button" class="btn btn-light-primary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> <span
									class="d-none d-sm-block">닫기</span>
							</button>
							<c:forEach var="vo" items="${list}">
								<input type="text" id="title" value="${vo.schTitle}">
								<input type="Text" id="start" value="${vo.schStart}">
								<input type="text" id="end" value="${vo.schEnd}">
							</c:forEach>
						</div>
					</div>
				</div>
	</form>
</div>
