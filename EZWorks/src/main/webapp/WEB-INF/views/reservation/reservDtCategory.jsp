<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/fullcalendar-5.8.0/lib/main.css'/>" />
<script type="text/javascript"
	src="<c:url value='/resources/fullcalendar-5.8.0/lib/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
	$(function(){
		
		var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    timeZone: 'ios',
		    locale : "ko",
		    initialView: 'timeGridWeek',
		    nowIndicator : true,
		    weekends:false,
		    headerToolbar: {
		      left: 'prev,next',
		      center: 'title',
		      right: 'today'
		    },dateClick: function() {
		        $('#reservModal').modal('show');
		    }, events: [
		        {
		            title  : 'event1',
		            start  : '2021-08-01'
		          },
		          {
		            title  : 'event2',
		            start  : '2021-08-05',
		            end    : '2021-08-07'
		          },
		          {
		            title  : 'event3',
		            start  : '2021-08-09T12:30:00',
		            allDay : false // will make the time show
		          }
		        ]
		  });
		  calendar.render();
	});
</script>
<style>
.txt {
    font-size: 22px;
    font-weight: normal;
    letter-spacing: -1px; 
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}
</style>
<%@ include file="../include/top.jsp"%>

<%@ include file="reservModal.jsp" %>
<%@include file="sidebarReserv.jsp"%>
<%@ include file="../include/middle.jsp"%>
<input type="hidden" value="${param.rvdNo}" name="rvdNo" id="rvdNo">
<input type="hidden" value="${param.rvdNo}" name="cateNo" id="cateNo">
<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">${vo.rvdName }</span>
		</h1>
	</header>
</div>
<div class="card-body" style="height: 100%;">
		<div id="radialGradient">
			<div id='calendar'></div>
		</div>
</div>
