<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
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
    
    
    $('#startTime').timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '00:00',
        maxTime: '23:30',
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
        startTime: '00:00',
        dynamic: true,
        dropdown: true,
        scrollbar: true
    });
    
    $('#reg_ok').click(function(){
    	if($('#title').val().length<1){
    		$('#append').append("<p>일정명을 입력하세요</p>");
    		$('#title').focus();
    		event.preventDefault();
    	}
    });
    
    $('#close').click(function(){
    	location.href="<c:url value='/calendar/calendarMain'/>";
    });
    
    
    $('#schAll').change(function(){
        if($('#schAll').is(':checked')){
        	$('#inschAll').val('Y');
        	$('#startTime').hide();
        	$('#endTime').hide();
        }else{
        	$('#inschAll').val('N');
        	$('#startTime').show();
        	$('#endTime').show();
        }
    });
    
    $('#addExtAttend').click(function(){
    	$('.addExtAttend').show();
    	var joinVal = $('#join').val();
    	$('#add').append("<input type='text' class='joinVal' name='schExtAttend' value='"+joinVal+"'>&nbsp;&nbsp;");
    	$('.joinVal').click(function(){
			$(this).remove();
		});
    	$('#join').val('');
    });
    
    $('.joinVal').click(function(){
		$(this).remove();
	});
    
    
});
</script>
<style>
.joinVal{
	background-color: #D9E5FF;
	border-radius: 10px;
	border: 1px solid #D9E5FF;
	width: 14%;
	padding: 3px 3px 3px 3px;
}
.tree{
	background-color: #D9E5FF;
	border-radius: 10px;
	border: 1px solid #D9E5FF;
	width: 14%;
	padding: 3px 3px 3px 3px;
}
p{
	font-size: 0.5em;
	display: inline-block;
}

.registerDiv {
	margin: 10px 0 15px 0;
}

.writeLabel {
	width: 20%;
	float: left;
	text-align: left;
	padding: 5px 10px 0 10px;
	clear: left;
}

.chkbox {
	margin-right: 5px;
}

#startDate, #endDate, #startTime, #endTime {
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

#join {
	width: 30%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}

#place {
	width: 70%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}

#exampleFormControlTextarea1 {
	border: 1px solid #CFCFCF;
	width: 70%;
}

#basicSelect {
	width: 15%;
	height: 30px;
	font-size: 0.9em;
}
.form-group{
	width: 70%;
	display: inline-block;
}
</style>

<%@ include file="sidebar2.jsp" %>
<%@ include file="../include/middle.jsp"%>
<div class="card-header" style="border-left: 1px solid #BDBDBD">
	<h4>일정수정</h4>
</div>
<div class="card-body" style="height: 100%;border-left: 1px solid #BDBDBD">
	<form name="regFrm" action="<c:url value='/calendar/calEdit'/>" method="post">
		<input type="hidden" value="${param.schNo}" name="schNo">
		<div class="registerDiv">
			<input type="text" id="title" class="form-control round" 
				name="schTitle" value="${vo.schTitle }"><span id="append" style="color: red;display:inline-block;font-size: 1.6em;">*</span>
		</div>
		<div class="registerDiv">
			<input type="text" id="startDate" name="schStart"
				class="form-control round" value="${vo.schStart }"> 
			<input type="text" id="startTime" name="schStartTime"
				class="form-control round" value="${vo.schStartTime }"> 
			<label for="to">~</label> 
			<input type="text" id="endDate" name="schEnd" 
				class="form-control round" value="${vo.schEnd }">
			<input type="text"  id="endTime" name="schEndTime" 
				class="form-control round" value="${vo.schEndTime }">
				&nbsp;&nbsp;
                    <div class="custom-control custom-checkbox" style="display: inline-block;">
                        <input type="checkbox" class="form-check-input form-check-primary form-check-glow" 
                        	name="customCheck" style="margin-right: 0px" id="customColorCheck6" id="schAll">
                        <label style="font-size: 1em">종일</label>
                    </div>
		</div>
		<div class="registerDiv" id="myCalSelect">
			<label class="writeLabel">내 캘린더</label> 
			<select class="form-select" name="schCate"
				id="basicSelect">
			<c:forEach var="vo" items="${list }">
				<option value="${vo.schCateNo }">${vo.schCateName }</option>
			</c:forEach>
			</select>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">참석자</label> 
			<c:forTokens var="attend" items="${vo.schAttend }" delims=",">
				<input type="text" class='tree' name="schAttend" value="${attend }">
			</c:forTokens>
			<span id="addAttend"></span>
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>"> 
			<span id="selectAttend">참석자선택</span>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">외부참석자</label> 
			<input type="text" id="join" name="schExtAttend" 
				class="form-control round"> 
			<input type="button" class="btn btn-outline-primary" id="addExtAttend" style="width:50px;height:30px; padding:3px 6px" value="추가">
		</div>
		<div class="addExtAttend">
			<label class="writeLabel"></label> 
			<c:forTokens var="extAttend" items="${vo.schExtAttend }" delims=",">
				<input type="Text" class="tree" name="schExtAttend" value="${extAttend }">
			</c:forTokens>
			<span id="add"></span>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">장소</label> 
			<input type="text" id="place" name="schPlace" 
				class="form-control round" value="${vo.schPlace }">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="10" name="schContent">${vo.schContent }</textarea>
		</div>
		<div style="text-align: center" class="registerDiv">
			<input type="submit" class="btn btn-primary ml-1" id="reg_ok" value="수정">
			<input type="button" class="btn btn-light-primary" id="close" value="닫기">
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
				$('#addAttend').append("<input type='text' class='tree' name='schAttend' value='"+$(this).text()+"'>&nbsp;&nbsp; ");
				$('.tree').click(function(){
					$(this).remove();
				});
				event.stopImmediatepropagation();
			});
		});
		
		$('.tree').click(function(){
			$(this).remove();
		});
	});
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- timepicker -->
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<%@ include file="../include/bottom.jsp"%>