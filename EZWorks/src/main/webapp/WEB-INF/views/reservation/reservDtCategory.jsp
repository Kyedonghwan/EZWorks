<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>"> 
 
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
		    selectOverlap:false,
		    allDaySlot:false,
		    weekends:false,
		    headerToolbar: {
		      left: 'prev,next',
		      center: 'title',
		      right: 'today'
		    },dateClick: function(info) {
				var d= new Date();
		        var today = new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().substring(0,19);
				today= new Date(today);
				var startDate=info.dateStr;
				startDate= new Date(startDate);
				
				if(startDate.getTime()-today.getTime()<0){
					Toastify({
		                 text: "지난 시간은 예약할 수 없습니다",
		                 duration: 2000,
		                 close:false,
		                 gravity:"top",
		                 position: "center",
		                 backgroundColor: "black",
		             }).showToast();
				}else{
		    		$('#reservModal').modal('show');
				}
		    }
		    ,eventClick:function(info){
				location.href="${pageContext.request.contextPath}/reservation/reservEdit?no="+info.event.id;
			} 
		    ,events: function(info, successCallback, failureCallback){
				$.ajax({
					type:"get",
					url:"<c:url value='/reservation/listReservation'/>",
					dataType:"json",
					data:"cateNo="+$('#cateNo').val(),
					success:function(res){
						var events=[];
						$.each(res, function(idx,item){
								events.push({
									id:item.no,
									title:item.subscriber,
									start:item.startDate+"T"+item.startTime,
									end:item.endDate+"T"+item.endTime
								});
						});
						successCallback(events);
					},error:function(){
						alert("error");
					}
				});
				}
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
<%@ include file="../include/bottom.jsp"%>
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>