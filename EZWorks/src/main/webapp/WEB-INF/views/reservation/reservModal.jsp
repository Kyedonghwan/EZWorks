<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
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
                 minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
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
            
            $('#modal_ok').click(function(){
           	 $('form[name=writeReserv]').submit();
           });
    });
</script>
<style>
.writeLabel{
	width: 15%;
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
.input{
	 	width: 55%;
		height: 1.5em;
		font-size: 0.9em;
		margin : 5px 0 20px 0;
}
.chkbox{
	margin : 10px 0 25px 0;
}

#startDate, #endDate, #startTime, #endTime {
	width: 18%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}

#startTime, #endTime{
	width: 12%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}
#title {
	width: 70%;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}
.registerDiv {
	margin: 10px 0 15px 0;
	height: 28%;
}
#place {
	width: 70%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}
#basicSelect {
	width: 13%;
	height: 34px;
	font-size: 0.9em;
	display: inline-block;
	
}
.tree{
	background-color: #D9E5FF;
	border-radius: 10px;
	border: 1px solid #D9E5FF;
	width: 14%;
	padding: 3px 3px 3px 3px;
}
</style>
<div class="modal" id="reservModal">
	<form name="writeReserv" action="<c:url value='/reservation/reservModal'/>" method="post">
		<div class="modal-dialog">
				<input type="hidden" name="cateNo" value="${param.rvdNo }">
					<div class="modal-content" style="width:750px;height: 360px">
						<div class="modal-header">
							<h5 class="modal-title">예약</h5>
							<button type="button" class="btn-close approvalInfoModalClose" data-bs-dismiss="modal" aria-label="Close" ></button>
							<button type="button" class="close rounded-pill"
								data-bs-dismiss="modal" aria-label="Close">
								<i data-feather="x"></i>
							</button>
						</div>
						<div class="modal-body">
							<div class="registerDiv">
								<label class="writeLabel">예약일</label>
								<input type="text" id="startDate" name="startDate"
									class="form-control round" value=""> 
								<select class="form-select" id="basicSelect" id="startTime" name="startTime">
                                	<option value="00:00">00:00</option>
									<option value="00:30">00:30</option>
									<option value="01:00">01:00</option>
									<option value="01:30">01:30</option>
									<option value="02:00">02:00</option>
									<option value="02:30">02:30</option>
									<option value="03:00">03:00</option>
									<option value="03:30">03:30</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
                        	</select>
								<label for="to">~</label> 
								<input type="text" id="endDate" name="endDate" 
									class="form-control round">
								<select class="form-select" id="basicSelect" id="endTime" name="endTime" >
                                	<option value="00:00">00:00</option>
									<option value="00:30">00:30</option>
									<option value="01:00">01:00</option>
									<option value="01:30">01:30</option>
									<option value="02:00">02:00</option>
									<option value="02:30">02:30</option>
									<option value="03:00">03:00</option>
									<option value="03:30">03:30</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
                        	</select>
								&nbsp;
							</div>
							<div class="registerDiv">
								<label class="writeLabel">예약자</label> 
								<span id="addAttend"></span>
								<img src="<c:url value='/resources/images/accordion/plus.svg'/>"> 
								<span id="selectAttend">예약자선택</span>
								</div>
							<div>
								<label class="writeLabel">목적</label>
								<input type="text" id="place" name="purpose" class="form-control round">
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit" id="modal_ok" class="btn btn-primary ml-1"
								data-bs-dismiss="modal" value="확인">
								<i class="bx bx-check d-block d-sm-none"></i> 
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
<%@include file="testModal.jsp" %>
<script>
	$(document).ready(function(){
		$('#selectAttend').click(function(){
			$('#testModal').modal('show');
			
			$('#tree2 a').click(function(){
				console.log($('#tree2 a').text());
				$('#addAttend').html("<input type='text' class='tree' name='subscriber' value='"+$(this).text()+"'>&nbsp;&nbsp; ");
				$('.tree').click(function(){
					$(this).remove();
				});
				event.stopImmediatepropagation();
			});
		});
	});

</script>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>