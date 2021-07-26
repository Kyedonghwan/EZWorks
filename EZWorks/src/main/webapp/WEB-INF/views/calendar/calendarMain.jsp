<%@page import="com.it.ez.calendar.model.CalendarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">

<!-- full calendar -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fullcalendar-5.8.0/lib/main.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/fullcalendar-5.8.0/lib/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type='text/javascript'>
	var calendar = null;
	
	
	$(function(){
		var calendarEl = document.getElementById('calendar');
		
		calendar = new FullCalendar.Calendar(calendarEl,{
			headerToolbar :{
				right : 'today',
				center : 'prev,title,next',
				left : 'timeGridDay,timeGridWeek,dayGridMonth,listWeek'
			}
			,locale : "ko"
			,navLinks : true	//날짜 클릭시 해당일 상세일정으로 view변경
			,nowIndicator : true
			,editable : true	//일정 수정 여부
			,selectable : true	//날짜셀 클릭여부
			,dayMaxEvents : true // 일정이 많을 경우 'more'표시
			,select : function() { // 날짜셀 클릭시(아래는 일정 추가) 
				$('#writeModal').modal('show');
			}
			,eventClick:function(info){
				location.href="${pageContext.request.contextPath}/calendar/calDetail?schNo="+info.event.id;
			}
			, events: function(info, successCallback, failureCallback){
				$.ajax({
					type:"get",
					url:"<c:url value='/calendar/showCal'/>",
					dataType:"json",
					
					success:function(res){
						var events=[];
						
						$.each(res, function(idx,item){
							events.push({
								id:item.schNo,
								title:item.schTitle,
								start:item.schStart+"T"+item.schStartTime,
								end:item.schEnd+"T"+item.schEndTime,
								color:item.schColor,
							});
							console.log(events);
						});
						
						successCallback(events);
					},error:function(){
						alert("error");
					}
				});
				}
		});
		calendar.render();
		
		$('#regBtn').click(function(){
			location.href="${pageContext.request.contextPath}/calendar/calRegister"
		});
		
	});
	
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

ul, li {
	list-style-type: none;
}
</style>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div class="card-header">
		<h4>캘린더</h4>
	</div>

	<jsp:include page="sidebar2.jsp" />
	
	<%@ include file="../include/middle.jsp"%>
	<div class="card-header">
		<h4>일정목록</h4>
	</div>
	<div class="card-body" style="height: 100%;">
		<div id="radialGradient">
			<div id='calendar'></div>
		</div>
	</div>
	
	<%@ include file="writeModal.jsp"%>
	<%@ include file="../include/bottom.jsp"%>
	<script type="text/javascript">
		$(function(){
			var bool=true;
			$('.accordion').click(function(){
				$('.panel').slideToggle('fast');
				
				if(bool){
					$('.more').html('<img src="<c:url value='/resources/images/accordion/chevron-right.svg'/>">');
				}else{
					$('.more').html('<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>">');
				}
				bool=!bool;
			});
		});
	</script>
</body>
</html>



<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>
<script src="<c:url value='/resources/js/extensions/toastify.js'/>"></script>

