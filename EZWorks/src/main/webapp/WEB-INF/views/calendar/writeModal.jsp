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
            
        
            var d= new Date();
            document.getElementById('startDate').value = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0,10);
            document.getElementById('endDate').value = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0,10);
            
            
            
            $('#detailSch').click(function(){
            	location.href="<c:url value='/calendar/calRegister'/>"
            });
           
            $('#modal_ok').click(function(){
            	$.ajax({
            		url:"<c:url value='/calendar/writeSchModal'/>",
            		type:"post",
            		dataType:"json",
            		data:{
            			'schTitle':$('#title').val(),
            			'schStart':$('#startDate').val(),
            			'schStartTime':$('#startTime').val(),
            			'schEnd':$('#endDate').val(),
            			'schEndTime':$('#endTime').val(),
            			'schPlace':$('#schPlace').val()
            		},
            		success:function(){
            		},error:function(){
            			alert("error!");
            		}
            	});
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
	width: 20%;
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
#basicSelect {
	width: 15%;
	height: 30px;
	font-size: 0.9em;
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
}
#place {
	width: 70%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}
</style>
<div class="modal" id="writeModal">
	<form name="writeSch" method="post" action="<c:url value='/calendar/calendarMain'/>">
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
							<div class="registerDiv">
								<label class="writeLabel1">
									일정명
								</label>
								<span style="color:red; padding-right: 55px; width: 40%">*</span>
								<input type="text" id="title" class="form-control round" 
									name="schTitle">
							</div>
							<div class="registerDiv">
								<label class="writeLabel">일시</label>
								<input type="text" id="startDate" name="schStart"
									class="form-control round" value=""> 
								<input type="text" id="startTime" name="schStartTime"
									class="form-control round" value=""> 
								<label for="to">~</label> 
								<input type="text" id="endDate" name="schEnd" 
									class="form-control round">
								<input type="text" id="endTime" name="schEndTime" 
									class="form-control round">
								&nbsp;
								<input type="checkbox" value="종일" class="chkbox">종일
							</div>
							<div class="registerDiv">
								<label class="writeLabel">전사일정</label>
								<input type="checkbox" value="전사일정" class="chkbox">전사일정
							</div>
							<div class="registerDiv">
								<label class="writeLabel">내 캘린더</label>
								<select class="form-select" name="schCate"
										id="basicSelect">
									<c:forEach var="vo" items="${list }">
										<option value="${vo.schCateNo }">${vo.schCateName }</option>
									</c:forEach>
								</select>
							</div>
							<div>
								<label class="writeLabel">장소</label>
								<input type="text" id="place" name="schPlace" 
				class="form-control round">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block" id="detailSch">일정상세입력</span>
							</button>
							<button type="button" id="modal_ok" class="btn btn-primary ml-1"
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



<!-- timepicker -->
<<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
$(function(){
	$('#startTime').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    minTime: '00:00',
	    maxTime: '23:30',
	    defaultTime: '00',
	    startTime: '00:00',
	    dynamic: true,
	    dropdown: true,
	    scrollbar: true
	});
	
	$('#endTime').timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    minTime: '00:00',
	    maxTime: '23:30',
	    defaultTime: '00',
	    startTime: '00:00',
	    dynamic: true,
	    dropdown: true,
	    scrollbar: true
	});
	
	var d=new Date();
	document.getElementById('startTime').value =  new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(11, 13)+":00";
    document.getElementById('endTime').value =  new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(11, 13)+":00";
});

</script>