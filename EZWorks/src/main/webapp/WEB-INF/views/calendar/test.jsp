<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <link rel="stylesheet" type="text/css" 
	href="<c:url value='/resources/fullcalendar-5.8.0/lib/main.css'/>" />
	<script type="text/javascript" 
	src="<c:url value='/resources/fullcalendar-5.8.0/lib/main.js'/>"></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    googleCalendarApiKey: 'AIzaSyDsekzz0pUeRzgZuEEbH-fC_dvEbFZ4CfM',
	    eventSources: [
	    {
	          googleCalendarId: 'rnqnrnqn1@gmail.com',
	          className: '나예진',
	          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
	          //textColor: 'black' 
	        },
	      {
	          googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
	          className: '공휴일',
	            color: '#204051',
	            //textColor: 'black' 
	        }
	      
	    ]
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

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>