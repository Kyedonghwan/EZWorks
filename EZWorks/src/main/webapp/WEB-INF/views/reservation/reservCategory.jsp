<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value='/resources/fullcalendar-scheduler-5.9.0/lib/main.css'/>" rel='stylesheet' />
<script src="<c:url value='/resources/fullcalendar-scheduler-5.9.0/lib/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
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
			    ,schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
			    ,resourcesInitiallyExpanded:false
			    ,resources:function(info, successCallback, failureCallback){
			    		$.ajax({
				    		type:"get",
				    		url:"<c:url value='/reservation//resourcesList'/>",
				    		dataType:"json",
				    		data:"rvdCate="+$('#rvNo').val(),
				    		success:function(res){
				    			var resources=[];
				    			
				    			$.each(res, function(idx,item){
				    				resources.push({
				    					id:item.rvdNo,
				    					title:item.rvdName
				    				});
				    			});
				    			console.log(resources);
				    			successCallback(resources);
				    		},error:function(){
				    			alert("error");
				    		}
			    		});
			    }
			   , events: function(info, successCallback, failureCallback){
					$.ajax({
						type:"get",
						url:"<c:url value='/reservation/listReservation'/>",
						dataType:"json",
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
							console.log(events);
							successCallback(events);
						},error:function(){
							alert("error");
						}
					});
					}
			   ,dateClick: function(info) {
				   var p=info.resource.id;
				   $('#includeParam').val(p);
			    	$('#reservModal').modal('show');
			    }
			 });

			  calendar.render();
			});
</script>
<style>
.go_skin_advanced .content_top {
    padding: 18px 24px;
}
.txt {
    font-size: 22px;
    font-weight: normal;
    letter-spacing: -1px; 
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}
div.content_info_wrap {
    position: relative;
    min-width: 500px;
    margin: 10px 24px;
    padding: 10px 10px 14px;
    background-color: #f9f9f9;
    border: 1px solid #dcdcdc;
    border-radius: 4px;
    font-size: 13px;
}
.s_title {
    margin-top: 0;
    padding: 6px 12px 20px 2px;
    font-size: 18px;
    float: left;
    margin: 6px 0 0 24px;
    font-weight: normal;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
tr {
    display: table-row;
    vertical-align: inherit;
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
.sorting_1 {
    padding: 8px 16px;
    line-height: 1.6;
    vertical-align: top;
    font-size: 15px;
}
.btn_fn7 {
    display: inline-block;
    height: 19px;
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
#calendar{
	height: 250px;
	width: 95%;
	margin: 0 auto;
}
</style>
<%@ include file="../include/top.jsp"%>

<%@include file="sidebarReserv.jsp"%>
<%@ include file="../include/middle.jsp"%>
<input type="hidden" value="${param.rvNo}" name="rvNo" id="rvNo">
<input type="text" value="" name="cateNo" id="includeParam">
<jsp:include page="reservModal.jsp" flush="true">
	<jsp:param name="cateNo" value=""/>
</jsp:include>
<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">${vo.rvName }</span>
		</h1>
	</header>
</div>
<div class="content_page go_renew asset">
	<div class="content_info_wrap">
		<span class="btn_wrap"> <span class="ic_classic ic_close"
			title="닫기"></span>
		</span>
		<ul class="simple_info">
			<li>
				<div class="editor_overriding">
					<p id="guideDescription" class="editor_view">
						<p>${vo.rvDesc }</p>
					</p>
				</div>
			</li>				
		</ul>
		<ul class="detail_info">
			<!-- li class="conference"-->	
			<li class="conference">
				<span class="txt">
				</span>												
				<ul class="file_wrap" id="fileWrap">
					
				</ul>
			</li>
		</ul>	
	</div>
	<br>
    <div id='calendar'></div>
	<br>
	<div class="dataTables_wrapper">
		<!-- 테이블 -->		
		<div id="assetItemDataTable_wrapper" class="dataTables_wrapper"
			role="grid">
			<div class="tool_bar">
				<div class="critical custom_header">
					<h1 class="s_title">자산별 상세 정보</h1>
				</div>
			</div>
			<div id="assetItemDataTable_processing" class="dataTables_processing"
				style="visibility: hidden;">Loading...</div>
			<table class="type_normal list_reser001 dataTable"
				id="assetItemDataTable" style="width: 100%; margin-bottom: 0px;">	
			<thead>
				<tr role="row">
						<th class="sorting name sorting_disabled" role="columnheader"
							rowspan="1" colspan="1" aria-label="항목" style="width: 539px;"><span
							class="title_sort">항목<ins class="ic"></ins></span></th>
						<th class="sorting_disable action sorting_disabled"
							role="columnheader" rowspan="1" colspan="1" aria-label="예약"
							style="width: 284px;"><span class="title_sort">예약</span></th>
						<th class="sorting_disable action sorting_disabled"
							role="columnheader" rowspan="1" colspan="1" aria-label="설정"
							style="width: 283px;"><span class="title_sort">설정</span></th>
					</tr>
			</thead>
			
			<tbody role="alert" aria-live="polite" aria-relevant="all">
					<c:forEach var="dtVo" items="${list }">
						<tr class="odd">
							<td class="name sorting_1"><a data-bypass="" class=""
								data-btntype="reservation" data-id="12">${dtVo.rvdName }</a></td>
							<td class="action1"><a class="btn_fn7" data-bypass=""
								data-btntype="reservation" data-id="12">
								<span class="txt_b">
								<input type="hidden" class="inputReserv" value="${dtVo.rvdNo }" style="width: 0px; height: 0px;">
								예약</span></a></td>
							<td class="action2"><a class="btn_fn7" data-bypass=""
								data-btntype="settingItem" data-id="12">
								<span class="txt_c">
								<input type="hidden" class="inputReserv" value="${dtVo.rvdNo }" style="width: 0px; height: 0px;">
								설정</span></a></td>
						</tr>
					</c:forEach>
			</tbody>
			</table>
			
		</div>
		<!-- //테이블 -->	
	</div>		
	
</div>
<script>
$(function(){
	$('.txt_b').click(function(){
		location.href="${pageContext.request.contextPath}/reservation/reservDtCategory?rvdNo="+$(this).children('input').val();
	});
	
	$('.txt_c').click(function(){
		location.href="${pageContext.request.contextPath}/reservation/reservModify?rvdNo="+$(this).children('input').val();
	});
});
</script>
<%@ include file="../include/bottom.jsp"%>