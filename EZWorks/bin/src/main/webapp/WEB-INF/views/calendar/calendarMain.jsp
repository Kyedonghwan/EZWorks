<%@page import="com.it.ez.calendar.model.CalendarVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<!-- full calendar -->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fullcalendar-5.8.0/lib/main.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/fullcalendar-5.8.0/lib/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type='text/javascript'>
	var calendar = null;
	var title = null;
	var start = null;
	var end = null;
	
	if(title==null || title==""){
			alert("제목을 입력하세요");
	}
	
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
			,dayMaxEvents : false // 일정이 많을 경우 'more'표시
			,select : function() { // 날짜셀 클릭시(아래는 일정 추가) 
				$('#writeModal').modal('show');
				
				/* $('#sch_btn').on("click",function(){
					
					{
						
					var obj = {
							"title" : title,
							"start" : start,
							"end" : end
						}
					}
					console.log(obj);
					}); */
			}
			, events:[
				{
					title: $('#title').val(),
					start: $('#start').val(),
					end: $('#end').val(),
				}
			]
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
	<div class="card-body" style="height: 600px;">
		<div id="area">
			<input type="button" class="btn btn-outline-secondary" id="regBtn"
				style="width: 200px; height: 50px" value="일정등록"> <br>
			<br> <span class="more"><img
				src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
			<span class="accordion"> 내 캘린더 </span>
			<ul class="panel">
				<li>
					<div class="checkbox">
						<input type="checkbox" id="checkbox1" class="form-check-input"
							checked> <label for="checkbox1">내 일정(기본)</label>
					</div>
					<div class="checkbox">
						<input type="checkbox" id="checkbox1" class="form-check-input"
							checked> <label for="checkbox1">내 일정(중요)</label>
					</div>
					<div class="checkbox">
						<input type="checkbox" id="checkbox1" class="form-check-input"
							checked> <label for="checkbox1">연차</label>
					</div>
				</li>
			</ul>
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
			<span style="color: gray">내 캘린더 추가</span> <br>
			<br> <span class="more"><img
				src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
			<span class="accordion"> 관심 캘린더 </span>
			<ul class="panel">
				<li>
					<div class="checkbox">
						<input type="checkbox" id="checkbox2" class="form-check-input"
							checked> <label for="checkbox2">전체</label>
					</div>
					<div class="checkbox">
						<input type="checkbox" id="checkbox2" class="form-check-input"
							checked> <label for="checkbox2">내 일정(전병헌)</label>
					</div>
				</li>
			</ul>
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
			<span style="color: gray">관심 캘린더 추가</span>
			<hr>
			<ul>
				<li>
					<div class="checkbox">
						<input type="checkbox" id="checkbox1" class="form-check-input"
							checked> <label for="checkbox1">전사일정</label>
					</div>
					<div class="checkbox">
						<input type="checkbox" id="checkbox1" class="form-check-input"
							checked> <label for="checkbox1">임원일정</label>
					</div>
				</li>
			</ul>
			<img src="<c:url value='/resources/images/accordion/gear.svg'/>">
			<span>캘린더 환경설정</span>
		</div>
	</div>


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
				$('.panel').slideToggle('slow');
				
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