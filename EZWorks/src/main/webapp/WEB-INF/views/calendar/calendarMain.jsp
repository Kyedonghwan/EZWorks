<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8' />
<!-- full calendar -->

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fullcalendar-5.8.0/lib/main.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/fullcalendar-5.8.0/lib/main.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type='text/javascript'>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				right : 'today',
				center : 'prev,title,next',
				left : 'timeGridDay,timeGridWeek,dayGridMonth,listWeek'
			},
			locale : "ko",
			//initialDate: '2021-07-13', 기준일 미입력시 당일
			navLinks : true, //날짜 클릭시 해당일 상세일정으로 view변경
			nowIndicator : true,

			editable : true, //일정 수정 여부
			selectable : true,//날짜셀 클릭여부
			dayMaxEvents : false, // 일정이 많을 경우 'more'표시
			select : function(arg) { // 날짜셀 클릭시(아래는 일정 추가) 
				/* var title = prompt("일정등록");
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				calendar.unselect(); */
				$('#writeModal').modal('show');
				
			},
			eventClick : function(arg) { //일정 클릭시
					$('#writeModal').modal('show');
			},
			unselect : function(arg) {
			},
			droppable : true // 별도의 일정란에서 캘린더로 일정 추가 가능 여부(아래 drop 과 쌍)
			,
			drop : function(arg) { // 신규 일정 Drop 시, arg 는 drop 하는 일정
			},
			eventAdd : function(arg) { // 날짜 클릭하여 일정 추가시, arg 는 클릭한 일정
				AppCalendar.saveEvent("in", arg);
			},
			eventChange : function(arg) { // 일정 변경시(중요!!! eventAdd, eventRemove 이후에도 기능), arg 는 클릭한 일정
				AppCalendar.saveEvent("up", arg);
			},
			eventRemove : function(arg) { // 일정 삭제시, arg 는 클릭한 일정
				AppCalendar.delEvent(arg);
			},

			events : [ {
				title : 'All Day Event',
				start : '2021-07-13'
			}, {
				title : 'Long Event',
				start : '2021-07-10',
				end : '2021-07-20'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2021-07-15T16:00:00'
			} ]
		/* eventSources: [ {		// 여러개의 aJax 로 기 등록된 일정을 불러옴, aJax 리턴 구조는 json Array 형태 [{},{},{}]
			url: "aJax URL 1"
			, method: "POST"
			, extraParams: {aJax로 보낼 parameter}
		}, {
			url: "aJax URL 2"
			, method: "POST"
			, extraParams: {aJax로 보낼 parameter}
		} ]



		/* , events: {		// 단일 aJax 로 기 등록된 일정을 불러옴(위의 eventSources 나 이거 둘중 하나만 사용하면 됨)
			url: "aJax URL"
			, failure: function() {
				alert("호출 오류");
			}
		} 

		}); */
		});

		calendar.render();
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

ul, li{
	list-style-type:none;
}
</style>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div class="card-header">
		<h4>캘린더</h4>
		<input type="button" value="일정등록">
	</div>
	<div class="card-body" style="height: 600px;">
		<div id="area">
				<span class="more"><img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
				<span class="accordion">
					내 캘린더
				</span>
			<ul class="panel">
				<li>
				<div class="checkbox">
	                		<input type="checkbox" id="checkbox1" class="form-check-input" checked>
	                   		<label for="checkbox1">내 일정(기본)</label>
	            </div>
	            <div class="checkbox">
	                		<input type="checkbox" id="checkbox1" class="form-check-input" checked>
	                   		<label for="checkbox1">내 일정(중요)</label>
	            </div>
	            <div class="checkbox">
	                		<input type="checkbox" id="checkbox1" class="form-check-input" checked>
	                   		<label for="checkbox1">연차</label>
	            </div>
	           </li>
			</ul>
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
			<span style="color: gray">내 캘린더 추가</span>
			<br><br>
			
				<span class="more"><img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
				<span class="accordion">
					관심 캘린더
				</span>
			<ul class="panel">
				<li>
				<div class="checkbox">
	                		<input type="checkbox" id="checkbox2" class="form-check-input" checked>
	                   		<label for="checkbox2">전체</label>
	            </div>
	            <div class="checkbox">
	                		<input type="checkbox" id="checkbox2" class="form-check-input" checked>
	                   		<label for="checkbox2">내 일정(전병헌)</label>
	            </div>
	           </li>
			</ul>
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
			<span style="color: gray">관심 캘린더 추가</span>
		<hr>
		<ul>
		<li>
		<div class="checkbox">
	                		<input type="checkbox" id="checkbox1" class="form-check-input" checked>
	                   		<label for="checkbox1">전사일정</label>
	    </div>
	    <div class="checkbox">
	                		<input type="checkbox" id="checkbox1" class="form-check-input" checked>
	                   		<label for="checkbox1">임원일정</label>
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
		<!-- <span style="font-size: 0.8em;">제목 들어가는 곳이구만..?</span> -->
	</div>
	<div class="card-body" style="height: 100%;">
		<div id="radialGradient">
			<div id='calendar'></div>
		</div>
	</div>
	<%@ include file="writeModal.jsp" %>
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
			
			AppCalendar.init();

			$("#event_add").unbind("click").click(function() {
				var title = $("#event_title").val();
				AppCalendar.addEvent(title);
				$("#event_title").val("");
			});
			
		});
	</script>
</body>
</html>