<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<link href="<c:url value='/resources/fullcalendar-scheduler-5.9.0/lib/main.css'/>" rel='stylesheet' />
<script src="<c:url value='/resources/fullcalendar-scheduler-5.9.0/lib/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    headerToolbar: {
		      left: 'prev,next',
		      center: 'title',
		      right: 'today'
		    },
		    nowIndicator: true
		    ,locale : "ko"
		    ,initialView: 'resourceTimelineDay'
		    ,resourcesInitiallyExpanded:false
		    , resourceGroupField: 'rvdName'
		    , resources: [
		        { id: '1', rvdName: '본사 1층 회의실', title: '도 회의실(20명)' },
		        { id: '2', rvdName: '본사 1층 회의실', title: '레 회의실(8명)' },
		        { id: '3', rvdName: '본사 1층 회의실', title: '미 회의실(12명)' },
		        { id: '4', rvdName: '본사 1층 회의실', title: '데모1' },
		        { id: '5', rvdName: '본사 1층 회의실', title: '데모2' },
		        { id: '6', rvdName: '본사 6층 회의실', title: '01. LA Dodgers' },
		        { id: '7', rvdName: '본사 6층 회의실', title: '02. Cincinnati Reds' },
		        { id: '8', rvdName: '본사 6층 회의실', title: '03. NY Yankees' },
		        { id: '9', rvdName: '본사 6층 회의실', title: '04. Boston RedSox' },
		        { id: '10', rvdName: '본사 6층 회의실', title: '05. SF Giants' },
		        { id: '11', rvdName: '본사 6층 회의실', title: '06. Chicago Cubs' },
		        { id: '12', rvdName: '본사 6층 회의실', title: '07. Texas Rangers' },
		        { id: '13', rvdName: '본사 6층 회의실', title: '08. San Diego Padres' },
		        { id: '138', rvdName: '빔프로젝터', title: '1번 프로젝터' },
		        { id: '139', rvdName: '빔프로젝터', title: '2번 프로젝터' },
		        { id: '140', rvdName: '재화스퀘어 3층 회의실', title: '02. MINT' },
		        { id: '141', rvdName: '재화스퀘어 3층 회의실', title: '03. BLUE' },
		      ]
		   ,dateClick: function(info) {
		    	  $('#reservModal').modal('show');
		    }
		  });

		  calendar.render();
		});


</script>
<style type="text/css">
body, input, textarea, select {
    font-size: 14px;
    font-family: 'Noto Sans KR',맑은 고딕,돋움, malgun gothic, dotum,AppleGothic,Helvetica,sans-serif;
    color: #333;
}
.txt {
    font-size: 22px;
    font-weight: normal;
    letter-spacing: -1px;
}
.content_top {
    padding: 15px;
}
.content_page h1.s_title {
    font-weight: normal;
    font-size: 18px;
    letter-spacing: -1px;
    padding: 32px 32px 24px;
}
table.list_reser004 {
    min-width: 700px;
}
.type_normal {
    width: 100%;
    table-layout: auto;
}
table {
    padding: 0;
}
table {
    padding: 0;
}
table {
    border-collapse: collapse;
    width: 100%;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.type_normal thead th {
    height: 32px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    text-align: left;
    padding: 0 16px;
    white-space: nowrap;
    font-weight: normal;
    font-size: 13px;
    ext-align: left;
}
.type_normal td {
    padding: 8px 16px;
    line-height: 1.6;
    border-bottom: 1px solid #eee;
    vertical-align: top;
}
p.data_null {
    text-align: center;
    color: #999;
    padding: 32px;
    font-size: 15px;
}
#calendar{
	height: 250px;
}
</style>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="reservModal.jsp" %>
	<%@include file="sidebarReserv.jsp"%>
	<%@ include file="../include/middle.jsp"%>
	<div class="card-header">
		<header class="content_top">
			<h1>
				<span class="txt">자산 예약 현황</span>
			</h1>
		</header>
	</div>
	<div class="card-body" style="height: 100%;">
		<div id="radialGradient"></div>
		<div class="content_page go_renew">

			<!-- 예약대시보드 -->
			<div id='calendar'></div>
			
			
			<div class="dashboard_asset">
				<h1 class="s_title">내 예약/대여 현황</h1>
				<div class="dataTables_wrapper">
					<!-- 테이블 -->
					<table class="type_normal list_reser004 tb_myReserv">
						<thead>
							<tr>
								<th class="sorting_disable equip"><span class="title_sort">자산</span></th>
								<th class="sorting_disable name"><span class="title_sort">이름</span></th>
								<th class="sorting_disable date"><span class="title_sort">예약
										시간 (대여 시작 시간)</span></th>

								<th class="sorting_disable action"><span class="title_sort">취소/반납</span></th>
							</tr>
						</thead>
						<tbody id="myCondition">
							<tr class="last">
								<td colspan="5" class="last">
									<p class="data_null">
										<span>예약/대여 중인 항목이 없습니다.</span>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- //테이블 -->
				</div>
			</div>
			<!-- //예약대시보드 -->
		</div>
	</div>
<%@ include file="../include/bottom.jsp"%>
