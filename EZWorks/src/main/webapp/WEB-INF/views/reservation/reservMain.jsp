<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!--sweetalert2-->
<link rel="stylesheet" href="sweetalert2.min.css">

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
		    ,resources:function(info, successCallback, failureCallback){
		    	$('#assets').on('change',function(){
		    		$.ajax({
			    		type:"get",
			    		url:"<c:url value='/reservation//resourcesList'/>",
			    		dataType:"json",
			    		data:"rvdCate="+$(this).val(),
			    		success:function(res){
			    			var resources=[];
			    			
			    			$.each(res, function(idx,item){
			    				resources.push({
			    					id:item.rvdNo,
			    					title:item.rvdName
			    				});
			    			});
			    			successCallback(resources);
			    		},error:function(){
			    			alert("error");
			    		}
		    		});
		  	  });
		    }
		   , events: function(info, successCallback, failureCallback){
				$.ajax({
					type:"get",
					url:"<c:url value='/reservation/listReservation'/>",
					dataType:"json",
					data:"cateNo="+$('#assets').val(),
					success:function(res){
						var events=[];
						
						$.each(res, function(idx,item){
								events.push({
									id:item.no,
									resourceId:item.cateNo,
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
    padding: 10px 16px;
    line-height: 1.6;
    border-bottom: 1px solid #eee;
    vertical-align: middle;
}
.last:hover{
	background-color: #EAEAEA;
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
.btn_fn7 {
    display: inline-block;
    height: 25px;
    line-height: 18px;
    padding: 0 4px;
    border: 1px solid #ddd;
    border-radius: 2px;
    background: #fff;
    cursor: pointer;
    font-size: 12px;
    white-space: nowrap;
    margin-left: 14px;
}
.optional{
	float:right;
}
</style>
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
			<!-- <div id='calendar'></div> -->
			
			
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
							<c:if test="${empty aList }">
								<tr class="last">
									<td colspan="5" class="last">
										<p class="data_null">
											<span>예약/대여 중인 항목이 없습니다.</span>
										</p>
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty aList }">
								<c:forEach var="vo" items="${aList }">
									<tr class="last">
										<td class="equip">
											<span class="tdSpan">${vo.rvName }</span>
										</td>
										<td class="name">
											<span class="tdSpan">${vo.rvdName }</span>
										</td>
										<td class="date">
											<span class="tdSpan">
											${vo.startDate } ${vo.startTime } ~ ${vo.endDate } ${vo.endTime }
											</span>
										</td>
										<td class="action">
											<button class="btn_fn7 delRBtn" value="${vo.no }">취소</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<!-- //테이블 -->
				</div>
			</div>
			<!-- //예약대시보드 -->
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
	$(document).ready(function(){
		 $('.delRBtn').click(function(){
		    	Swal.fire({
		    		  title: '일정을 삭제하시겠습니까?',
		    		  icon: 'error',
		    		  showCancelButton: true,
		    		  confirmButtonColor: '#4374D9',
		    		  cancelButtonColor: '#BDBDBD',
		    		  confirmButtonText: '삭제'
		    		}).then((result) => {
		    		  if (result.isConfirmed) {
			    		      $.ajax({
			    				type:"get",
			    				url:"<c:url value='/reservation/deleteReserv'/>",
			    				data: "no="+$(this).val(),
			    				success:function(){
			    					location.href="<c:url value='/reservation/reservMain'/>";
			    				}
			    			});
		    		  }
		    		});
		    });
	});
	</script>
<%@ include file="reservModal.jsp" %>
	

<%@ include file="../include/bottom.jsp"%>
