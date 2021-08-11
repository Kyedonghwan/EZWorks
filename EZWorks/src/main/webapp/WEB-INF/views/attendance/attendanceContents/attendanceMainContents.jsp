<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://kit.fontawesome.com/ccfc8e2515.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceMainContents.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/datepicker.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">

</style>

<script type="text/javascript">
var daysNamesMin = ['일', '월', '화', '수', '목', '금', '토'];
const basicTimeFormat = 'HH:mm:ss';
$(function(){
	$('.tb_attend_detail2').each(function(idx, item){
		$(item).hide();
	});
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    });
	var basedate = new Date();
	var baseyear = basedate.getFullYear();
	var basemonth = ('0' + (basedate.getMonth() + 1)).slice(-2);
	document.getElementById("baseDate").innerHTML = (baseyear)+"."+(basemonth);
	$(document).on("click", '.btn_wrap', function(){
		var dayArea = $(this).closest('div').children('#day_area');
		var icon = $(this).children('i');
		
		if(dayArea.css("display")==="none"){
			dayArea.css({"display":"block"});
		}else{
			dayArea.css({"display":"none"});
		}
		icon.toggleClass('fa-chevron-down fa-chevron-up');
	});
	$( "#calendarDatepicker" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '>',
        prevText: '<', 
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dateFormat: "yy-mm-dd",
        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
        onSelect: function(dateText, inst){
        	var date = $(this).val();
        	const splitdate = date.split('-');
        	var year = splitdate[0];
        	var month = splitdate[1];
        	var date = splitdate[2];
        	document.getElementById("baseDate").innerHTML = (year)+"."+(month);
        	loadNewMonth(year, month);
        }
    });
    
    $(document).on("click", '#prevMonth', function(){
    	console.info($('#baseDate').html());
    	var thisDate = $('#baseDate').html().split('.');
    	var year = thisDate[0];
    	console.info(year);
    	var month = thisDate[1];
    	console.info(month);
    	if(month==1){
    		year -= 1;
    		month = 12;
    	}else{
    		month -= 1;
    	}
    	console.info('바뀐 후 year='+year+"month"+month);
    	document.getElementById("baseDate").innerHTML = (year)+"."+('0'+month).slice(-2);
    	console.info($('#baseDate').html());
    	loadNewMonth(year, month);
    });
    $(document).on("click", '#nextMonth', function(){
    	console.info($('#baseDate').html());
    	var thisDate = $('#baseDate').html().split('.');
    	var year = parseInt(thisDate[0]);
    	console.info(year);
    	var month = parseInt(thisDate[1]);
    	console.info(month);
    	if(month==12){
    		year += 1;
    		month = 1;
    	}else{
    		month += 1;
    	}
    	console.info('바뀐 후 year='+year+"month"+month);
    	document.getElementById("baseDate").innerHTML = (year)+"."+('0'+month).slice(-2);
    	console.info($('#baseDate').html());
    	loadNewMonth(year, month);
    });
    $(document).on("click", ".tb_attend_list", function(){ /////////////////////////////////////////////////
    	const moment_workDetail = moment();
    	const year = moment_workDetail.format('YYYY');
    	const month = moment_workDetail.format('MM');
    	const date = moment_workDetail.format('DD');
    	if($(this).next().is(':visible')){
    		$(this).next().hide();
    	}else{
    		$(this).siblings('.tb_attend_detail2').hide();
    		$(this).next().show();
    	}
    	
    	loadWeekDetail(year, month, date, this);
    });
    $(document).on("click", "#currentMonth", function(){
    	const moment_today = moment();
    	const date = moment_today.format('YYYY-MM-DD');
    	$('#calendarDatepicker').val(date);
    	let year = moment_today.format('YYYY');
    	let month = moment_today.format('MM');
    	document.getElementById("baseDate").innerHTML = (year)+"."+('0'+month).slice(-2);
    	loadNewMonth(year, month);
    });
    $(document).on("click", "#workIn", function(){
    	workIn();
    });
    $(document).on("click", "#workOut", function(){
    	workOut();
    });
    /* $(document).on("click", "#tooltip_location", function(){
    	$('#tooltip_info').css({"display":"inline"});
    });
    $(document).click(function(e){ //문서 body를 클릭했을때
 		if(e.target.className=="tooltip_info"){
 			return false
		}else{
			if($('#tooltip_info').css('display')=='inline'){
			alert("다른곳");
				$('#tooltip_info').css({"display":"none"});
			}
		}//내가 클릭한 요소(target)를 기준으로 상위요소에 .share-pop이 없으면 (갯수가 0이라면)
 		
	}); */
    dayWorkTime();
});
function showDatepicker(){
	$('#calendarDatepicker').datepicker("show");
}
function loadDayDetail(year, month, date){
	var str = ""
	$.ajax({
		url:'<c:url value="/attendance/date_detail"/>'
		,type:"get"
		,data:"year="+year+"&month="+month+"&date="+date
		,dataType:"json"
		,success:function(dayDetail){}
	});
}
function loadWeekDetail(year, month, date, e){
	$.ajax({
		url:'<c:url value="/attendance/week_detail"/>'
		,type:"get"
		,data:"year="+year+"&month="+month+"&date="+date
		,dataType:"json"
		,success:function(detailList){
			/* str = "<div class='tb_attend_detail2'>";//1
			
			str +=	"<div id='time_zone' class='tb_div tb_head'>";//2
			for(var i=0;i<24;i++){
				str += "<div class='tb_cell'>";
				str +=		"<span class='time'>" + ('0' + i).slice(-2) + "</span>";
				str += "</div>";
			}
			str += 	"</div>";//2

			str += 	"<div class='wrap_timeline tb_body'>";//3
			str += 		"<div id='data_zone' class='tb_div time_data'>";//4
			
			//만약 detailList에 출근 혹은 퇴근이 있다면
			if(detailList!=null ){
				for(var dl=0; dl<detailList.length; dl++){
					if(detailList[dl].attendanceStatus=='출근'){
						str += "<div id='clockinout_progress' class='tb_row total_time'>";//5
						str += 		"<div class='progress  start close part_default style='left: 54.1632%; width: 6.31269%;'>";
						str += 			"<span id='clockIn' class='txt label_l' style='cursor: pointer;'>출근</span>";
						for(var dl2=0;detailList.lenght;dl2++){
							str += 		"<span id='clockOut' class='txt label_r' style='cursor: pointer;'>외근</span>"
						}
						str += 		"</div>";
						str += "</div>";
					}
					if(detailList[dl].attendanceStatus!='출근'&&detailList[dl].attendanceStatus!='퇴근'){
						str += "<div class='tb_row workingstate'>";
						for(var h=0;h<24;h++){
							str += "<div class='tb_cell ";  
							if(h>=8&&h<=17){
								str += "workinghours";
							}
							str += "'>";
							str += 		"<div class='tb_div'>";
							for(var min=0;min<6;min++){
								str += 		"<div class='min'></div>";
							}
							str += 		"</div>";
							str += "</div>";
						}
						str += "</div>";
					}
				}
			}
			str += 			"</div>";
			str += 		"</div>";
			str += "</div>";
			
			//$() e.after(str); */
		}
	});
}
function getPercentage(e){
	var date = moment(e);
	var hour = date.hours();
	var minute = date.minutes();
	var seconds = date.seconds();
	
	
}
function showMenu(){
	var dayArea = $(this).closest('div').children('#day_area');
	var icon = $(this).children('i');
	
	if(dayArea.css("display")==="none"){
		dayArea.css({"display":"block"});
		icon.classList.toggle("fa-chevron-up");
	}else{
		dayArea.css({"display":"none"});
		icon.classList.toggle("fa-chevron-down");
	}
	icon.toggleClass('fa-chevron-down fa-chevron-up');
}
function loadNewMonth(year, month){
	$.ajax({
		url:'<c:url value="/attendance/attendanceByMonth"/>'
		,type:"get"
		,data:"year="+year+"&month="+month
		,dataType:"json"
		,success:function(daysListWithDetail){ 
			$('#daysListCarrier').html("");
			var str = "";
			let weekTotalWorkHour = null;
			for(var i=0;i<daysListWithDetail.length;i++){
				str += "<div>";
				str += "<div class='wrap_tb_box' id='week'>";
				str += "<section class='wrap_tb_tit'>";
				str += "<h2 class='table_tit'><span class='btn_wrap'><i class='fas fa-chevron-down' ></i></span>"+(i+1)+" 주차</h2>";
				str += "<div class='tb_optional'>";
				str += "<span class='txt'>누적 근무시간 <strong class=''>0h 0m 0s</strong></span>";
				str += "<span class='desc'> (초과 근무시간 <strong>0h 0m 0s</strong>)</span>";
				str += "</div>";
				str += "</section>";
				str += "<div class='wrap_tb_shadow' id='day_area' style='display:none'>";
				str += "<div class='tb_attend_header'>";
				str += "<div class='tb_content date'>";
				str += "<span class='txt'>일자</span>";
				str += "</div>";
			    str += "<div class='tb_content attend'>";
			    str += "<span class='txt'>업무시작</span>";
			    str += "</div>";
			    str += "<div class='tb_content leave'>";
			    str += "<span class='txt'>업무종료</span>";
			    str += "</div>";
			    str += "<div class='tb_content total_time'>";
			    str += "<span class='txt'>총 근무시간</span>";
			    str += "</div>";
			    str += "<div class='tb_content status'>";
			    str += "<span class='txt'>근무시간 상세</span>";
			    str += "</div>";
			    str += "<div class='tb_content approval_list'>";
			    str += "<span class='txt'>승인요청내역</span>";
			    str += "</div>";
			    str += "</div>";
				str += "<div class='tb_attend_body' id='day_list'>";
				var days = daysListWithDetail[i];
				for(var j=0; j<days.length;j++){
					var attendanceDetailByDay = days[j].attendanceVosInADay;
					var week = new Date(days[j].forCalendar);
					var date = week.getDate();
					var day = week.getDay();
					str += "<div class='tb_attend_list ";
					if(day==6){
						str+="day_sat";
					}else if(day==0){
						str+="day_sun";
					}
					str += "'>";
					str += "<input type='hidden' value='" + week + "' name='dateSpec'>";
					str += "<div class='tb_content date_l'>";
					str += "<span class='txt'>"+date+"</span>";
					str += "</div>";
					str += "<div class='tb_content date_r'>";
					str += "<span class='txt'>";
					str += daysNamesMin[day];
					str += "</span>";
					str += "</div>";
					str += "<div class='tb_content attend'>";
					str += "<span class='txt'>";
					let DayAttendTimeStart = null;
					if(attendanceDetailByDay!=null){
						for(var k = 0; k<attendanceDetailByDay.length; k++){
							if(attendanceDetailByDay[k].attendanceStatus=='출근'){
								DayAttendTimeStart = moment(new Date(attendanceDetailByDay[k].attendanceRecordedTime));
								var printHourStart = DayAttendTimeStart.format(basicTimeFormat);
								str += "<span id='attend_start' data-bs-toggle='tooltip' data-bs-placement='top' title='IP : " + attendanceDetailByDay[k].ipAddress +"'>";
								str += printHourStart;
								str += "</span>";
								str += "&nbsp&nbsp<span id='tooltip_location'><i class='fas fa-map-marker-alt'></i><span class='tool_tip top' id='tooltip_info' style='display: none;'><strong>IP :</strong>"
								str += attendanceDetailByDay[k].ipAddress;
								str += "<br> <i class='tail_top'></i></span></span>";
							}
						}
					}
					str += "</span>";
					str += "</div>";
					str += "<div class='tb_content leave'>";
					str += "<span class='txt'>";
					let DayEndedTimeEnd = null;
					if(attendanceDetailByDay!=null){
						for(var l = 0; l<attendanceDetailByDay.length; l++){
							if(attendanceDetailByDay[l].attendanceStatus=='퇴근'){
								DayEndedTimeEnd = moment(new Date(attendanceDetailByDay[l].attendanceRecordedTime));
								var printHourEnd = DayEndedTimeEnd.format(basicTimeFormat);
								str += "<span id='attend_end' data-bs-toggle='tooltip' data-bs-placement='top' title='IP : " + attendanceDetailByDay[l].ipAddress +"'>";
								str += printHourEnd;
								str += "</span>";
								str += "&nbsp&nbsp<span id='tooltip_location'><i class='fas fa-map-marker-alt'></i><span class='tool_tip top' id='tooltip_info' style='display: none;'><strong>IP :</strong>"
								str += attendanceDetailByDay[l].ipAddress;
								str += "<br> <i class='tail_top'></i></span></span>";
							}
						}
					}
					str += "</span>";
					str += "</div>";
					str += "<div class='tb_content total_time'>";
					str += "<span class='txt'>";
					str += realdayWorkTime(DayAttendTimeStart, DayEndedTimeEnd);
					str += "</span>";
					str += "</div>";
					str += "<div class='tb_content status'>";
					str += "</div>";
					str += "<div class='tb_content approval_list'>";
					str += "</div>";
					str += "</div>";
					
					/////////////attend_detail2///////////////
str += "	<div class='tb_attend_detail2'>                                                                 ";
str += "		<div id='time_zone' class='tb_div tb_head'>                                                 ";
					for(var m=0; m<24; m++){
str += "				<div                                                                                ";
str += "					class='tb_cell ";
					if(m>7 && m<18){
						str+="workinghours";
					}
					str += "'>"
str += "					<span class='time'>"+ ('0'+m).slice(-2) +"</span>                         ";
str += "				</div>                                                                              ";
					}
str += "		</div>                                                                                      ";
str += "		<div class='wrap_timeline tb_body'>                                                         ";
str += "			<div id='data_zone' class='tb_div time_data'>                                           ";
str += "				<div id='clockinout_progress' class='tb_row total_time'>                            ";
str += "					<div class='progress  start close part_default'                                 ";
str += "						style='left: 54.1632%; width: 6.31269%;''>                                   ";
str += "						<span id='clockIn' class='txt label_l' style='cursor: pointer;'>출근</span> ";
str += "						<span id='clockOut' class='txt label_r' style='cursor: pointer;'>외근       ";
str += "						</span>                                                                     ";
str += "					</div>                                                                          ";
str += "					<div class='progress  start initial part_default'                               ";
str += "						style='left: 64.2797%; width: 2.77778%;'>                                   ";
str += "						<span id='clockIn' class='txt label_l' style='cursor: pointer;'>업무</span> ";
str += "					</div>                                                                          ";
str += "				</div>                                                                              ";
str += "				<div id='approval_progress' class='tb_row total_time'>                              ";
str += "					<div id='95' class='progress part_approval start close'                         ";
str += "						style='left: 75%; width: 8.33333%;'>                                        ";
str += "						<span class='txt'>연장 <span> (완료)</span>                                 ";
str += "						</span>                                                                     ";
str += "					</div>                                                                          ";
str += "				</div>                                                                              ";
str += "				<div class='tb_row workingstate'>                                                   ";
					for(var o=0; o<24; o++){
str += "						<div class='tb_cell'>                                                       ";
str += "							<div class='tb_div'>                                                    ";
						for(var p=0;p<6;p++){
str += "									<div class='min'></div>                                         ";
						}
str += "							</div>                                                                  ";
str += "						</div>                                                                      ";
					}
str += "				</div>                                                                              ";
str += "			</div>                                                                                  ";
str += "			<div id='time_wrapper' class='tb_div tb_bg' style='height: 136px;'>                     ";
					for(var q=0; q<24; q++){
str += "					<div class='tb_cell'>                                                           ";
str += "						<div class='tb_div'>                                                        ";
						for(var r=0; r<6; r++){
str += "								<div class='min'></div>                                             ";
						}
str += "						</div>                                                                      ";
str += "					</div>                                                                          ";
					}
str += "			</div>                                                                                  ";
str += "		</div>                                                                                      ";
str += "	</div>                                                                                          ";
				
				}
				str += "</div>";
				str += "</div>";
				str += "</div>";
				str += "</div>";
				
			}//바깥 for
			$('#daysListCarrier').html(str);
			$('.tb_attend_detail2').each(function(idx, item){
				$(item).hide();
			});
			var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		        return new bootstrap.Tooltip(tooltipTriggerEl)
		    });
			//dayWorkTime();
		}
	});
}
function workIn(){
	const workIn_moment = moment();
	const workInHour = workIn_moment.format("HH:mm:ss");
	const button = document.getElementById('workIn');
	const attendanceStatus = '출근';
	const attendanceRecordedTime = workIn_moment.format('YYYY-MM-DD HH:mm:ss');
	console.info(workIn_moment);
	if(button.classList.contains('off')){
		return false;
	}else{
		$('#workInTime').html(workInHour);
		document.getElementById('workIn').classList.add("off");
		/* ajax 추가 */
		$.ajax({
			url:'<c:url value="/attendance/insert_workIn"/>'
			,type:"post"
			,data:{
				"attendanceStatus": attendanceStatus,
				"record": attendanceRecordedTime
			}
			,dataType:"json"
			,success:function(attendanceVo){ 
				console.info(attendanceVo);
			},
			error:function(xhr, status, error){
				alert("error 발생! " + error);
			}	
		});
	}
}
function workOut(){
	const workOut_moment = moment();
	const workOutHour = workOut_moment.format("HH:mm:ss");
	const button = document.getElementById('workOut');
	const attendanceStatus = '퇴근';
	const attendanceRecordedTime = workOut_moment.format('YYYY-MM-DD HH:mm:ss');
	if(button.classList.contains('off')){
		return false;
	}else{
		$('#workOutTime').html(workOutHour);
		document.getElementById('workOut').classList.add("off");
		/* ajax 추가 */
		$.ajax({
			url:'<c:url value="/attendance/insert_workOut"/>'
			,type:"post"
			,data:{
				"attendanceStatus": attendanceStatus,
				"record": attendanceRecordedTime
			}
			,dataType:"json"
			,success:function(attendanceVo){ 
			},
			error:function(xhr, status, error){
			}	
		});
	}
}
function dayWorkTime(){
	$('.tb_attend_list').each(function(index, item){
		var start = $(item).find('.attend').find('#attend_start').text();
		var end = $(item).find('.leave').find('#attend_end').text();
		console.info(start);
		console.info(end);
		start = '2021/7/31 ' + start;
		end = '2021/7/31 ' + end;
		var moment_start = moment.duration(start);
		var moment_end = moment.duration(end);
		
		var moment_startHour = moment(start, 'HH:mm:ss');
		var moment_endHour = moment(end, 'HH:mm:ss');
		if(start!='2021/07/31'&&end!='2021/07/31'){
			var moment_workTime = moment.duration(moment(end,'YYYY/MM/DD HH:mm:ss').diff(start, 'YYYY/MM/DD HH:mm:ss'));
			var hours = parseInt(moment_workTime.asHours());
			var minutes = parseInt(moment_workTime.asMinutes())%60;
			var seconds = parseInt(moment_workTime.asSeconds())%60;
			console.info("총시간"+hours+"분"+minutes+"초"+seconds);
			('0'+month).slice(-2)
			$(item).find('.total_time').find('.txt').text(('0'+hours).slice(-2)+':'+('0'+minutes).slice(-2)+':'+('0'+seconds).slice(-2));
		}
	});
}
function realdayWorkTime(start, end){
	var moment_start = moment.duration(start);
	var moment_end = moment.duration(end);
	if(!isEmpty(start)&&!isEmpty(end)){
		var moment_workTime = moment.duration(moment(end,'YYYY/MM/DD HH:mm:ss').diff(start, 'YYYY/MM/DD HH:mm:ss'));
		var hours = parseInt(moment_workTime.asHours());
		var minutes = parseInt(moment_workTime.asMinutes())%60;
		var seconds = parseInt(moment_workTime.asSeconds())%60;
		console.info("총시간"+hours+"분"+minutes+"초"+seconds);
		return ('0'+hours).slice(-2)+':'+('0'+minutes).slice(-2)+':'+('0'+seconds).slice(-2);
	}else{
		return '';
	}
}
function realdayWorkTimePart(start, end){
	var moment_start = moment.duration(start);
	var moment_end = moment.duration(end);
	if(!isEmpty(start)&&!isEmpty(end)){
		var moment_workTime = moment.duration(moment(end,'YYYY/MM/DD HH:mm:ss').diff(start, 'YYYY/MM/DD HH:mm:ss'));
		return moment_workTime;
	}else{
		return '';
	}
}
function printWorkTime(e){
	if(!isEmpty(e)){
		var hours = parseInt(e.asHours());
		var minutes = parseInt(e.asMinutes())%60;
		var seconds = parseInt(e.asSeconds())%60;
		return ('0'+hours).slice(-2)+':'+('0'+minutes).slice(-2)+':'+('0'+seconds).slice(-2);
	}else{
		return '';
	}
}
function isEmpty(value){
    return (typeof value === "undefined" || value === null);
}
function getWeekTotalWorkHour(){
	
}
</script>
	<section style="padding:0px">
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>근태현황<!-- parameter: 어느 게시판?  --></a>
			</h5>
		</div>
		
	</section>
	
	<section style="padding:0px;">
		<div class="tool_bar calendar_tool_bar" id="calendar_tool_bar">
        <div class="current_date">
            <span class="btn_ic_prev2 btn_border" title="이전" id="prevMonth"><span class="fa-fw select-all fas"></span></span>
            <span class="date" id="baseDate" onclick="showDatepicker()"></span>
            <span class="btn_ic_next2 btn_border" title="이후" id="nextMonth"><span class="fa-fw select-all fas"></span></span>
            <input id="calendarDatepicker" type="text" style="border:0px;width:0px" autocomplete="off">
            <span class="btn_tool"><span class="txt" id="currentMonth">오늘</span></span>
            
        </div>
    	</div>
	</section>
	
	<section style="padding:0px;">
		<div id="summary">
			<div class="wrap_statistics">
				<div class="tool_bar">
					<div class="critical">
	
						<span class="info_group"> <span class="tit">(기본근태) A형</span>
							<span class="txt">08:00:00 ~ 17:00:00</span>
						</span> 
						<!-- <span class="btn_wrap"> 
						<span class="ic ic_info btn-toggle-desc" title="근태 설명보기" id="timeline_info"> 
						<span class="layer_tail tooltip-desc"el-backdrop="" style="display: none" id="timeline_info_desc">
							<i class="ic ic_tail"></i>
							<div>
								[그룹 변경 내역] <br> <br> 2021-07-01 : (기본근태)
								A형(08:00:00~17:00:00) <br>
							</div>
							<div>
								*
								연장/야간&nbsp;근로&nbsp;시,&nbsp;근로시간&nbsp;인정을&nbsp;위해서&nbsp;전자결재를&nbsp;이용할&nbsp;수도&nbsp;있습니다.&nbsp;자세한&nbsp;내용은&nbsp;도움말을&nbsp;참조하세요.<br>
								* 휴게시간은 총 근무시간에 포함되지 않습니다.<br> * 관리자 설정으로 지정된 시간이며, 설정에 따라
								총 근무시간은 상이해질 수 있습니다.<br>
							</div>
						</span>
						</span>
						</span> -->
					</div>
					<div class="optional">
						<a class="btn_tool" id="overtime" data-bypass=""> <span class="fa-fw select-all fas"></span> <span class="txt">연장근무신청</span>
						</a> <a class="btn_tool" id="download" data-bypass=""> <span class="fa-fw select-all fas"></span> <span class="txt">목록
								다운로드</span>
						</a>
					</div>
				</div>
				<div class="wrap_ehr_data">
					<div class="ehr_stat_data">
						<p class="stat_tit">이번주 누적</p>
						<p class="stat_txt ">0h 0m 0s</p>
					</div>
					<span class="divide_bar"></span>
					<div class="ehr_stat_data">
						<p class="stat_tit">이번주 초과</p>
						<p class="stat_txt">0h 0m 0s</p>
					</div>
					<div class="ehr_stat_data">
						<p class="stat_tit">이번주 잔여</p>
						<p class="stat_txt">40h 0m 0s</p>
					</div>
					<span class="divide_bar"></span>
					<div class="ehr_stat_data month_data">
						<p class="stat_tit">이번달 누적</p>
						<p class="stat_txt">8h 0m 0s</p>
					</div>
					<div class="ehr_stat_data month_data">
						<p class="stat_tit">이번달 연장</p>
						<p class="stat_txt">0h 0m 0s</p>
					</div>
	
				</div>
			</div>
		</div>
	</section>
	
	<section style="padding:0px;">
		<div id="month" class="wrap_tb_list">
			<div id="daysListCarrier">
			
				<c:forEach var="week" items="${daysListWithDetail }" varStatus="status">
			
				<div>
					<div class="wrap_tb_box" id="week">
						
					    <section class="wrap_tb_tit">
					        <h2 class="table_tit"><span class="btn_wrap"><i class="fas fa-chevron-down" ></i></span>${status.index+1} 주차</h2>
					        <div class="tb_optional">
					            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
					            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
					        </div>
					    </section>
					    <div class="wrap_tb_shadow" id="day_area" style="display:none">
					        <div class="tb_attend_header">
					            <div class="tb_content date">
					                <span class="txt">일자</span>
					            </div>
					            <div class="tb_content attend">
					                <span class="txt">업무시작</span>
					            </div>
					            <div class="tb_content leave">
					                <span class="txt">업무종료</span>
					            </div>
					            <div class="tb_content total_time">
					                <span class="txt">총 근무시간</span>
					            </div>
					            <div class="tb_content status">
					                <span class="txt">근무시간 상세</span>
					            </div>
					            <div class="tb_content approval_list">
					                <span class="txt">승인요청내역</span>
					            </div>
					        </div>
					        <div class="tb_attend_body" id="day_list">
					        	
					        	<c:forEach var="day" items="${week }">
					        	<div class="tb_attend_list tb_attend_select <c:if test="${day.forCalendar.day==6 }">day_sat</c:if><c:if test="${day.forCalendar.day==0 }">day_sun</c:if> ">    
					        		<div class="tb_content date_l">
					        			<span class="txt">${day.forCalendar.date }</span>
					    			</div>
								    <div class="tb_content date_r">
								        <span class="txt">
											<c:choose>
												<c:when test="${day.forCalendar.day==0 }">일</c:when>
												<c:when test="${day.forCalendar.day==1 }">월</c:when>
												<c:when test="${day.forCalendar.day==2 }">화</c:when>
												<c:when test="${day.forCalendar.day==3 }">수</c:when>
												<c:when test="${day.forCalendar.day==4 }">목</c:when>
												<c:when test="${day.forCalendar.day==5 }">금</c:when>
												<c:when test="${day.forCalendar.day==6 }">토</c:when>
											</c:choose>
										</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt">
								        <c:if test="${!empty day.attendanceVosInADay }">
								        	<c:forEach var='vo' items='${day.attendanceVosInADay }'>
								        		<c:if test="${vo.attendanceStatus=='출근'}">
								        			<span id="attend_start"  data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="IP : ${vo.ipAddress}"><fmt:formatDate value="${vo.attendanceRecordedTime }" pattern='HH:mm:ss'/></span>
								        			<span id="tooltip_location"><i class="fas fa-map-marker-alt"></i>
								        				<span class="tool_tip top" id="tooltip_info" style="display: none;">
															<strong>IP :</strong> ${vo.ipAddress} <br> <i class="tail_top"></i>
														</span> 
													</span>
								        		</c:if>
								        	</c:forEach>
								        </c:if>
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        <c:if test="${!empty day.attendanceVosInADay }">
								        	<c:forEach var='vo' items='${day.attendanceVosInADay }'>
								        		<c:if test="${vo.attendanceStatus=='퇴근'}">
								        			<span id="attend_end" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="IP : ${vo.ipAddress}"><fmt:formatDate value="${vo.attendanceRecordedTime }" pattern='HH:mm:ss'/></span>
								        			<span id="tooltip_location"><i class="fas fa-map-marker-alt"></i>
								        				<span class="tool_tip top" id="tooltip_info" style="display: none;">
															<strong>IP :</strong> ${vo.ipAddress} <br> <i class="tail_top"></i>
														</span> 
													</span>
								        		</c:if>
								        	</c:forEach>
								        </c:if>
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt">
								        	
								        </span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
								<div class="tb_attend_detail2" >
									<div id="time_zone" class="tb_div tb_head">
										<c:forEach var="i" begin="0" end="23">
											<div
												class="tb_cell <c:if test="${i>7 && i<18 }">workinghours</c:if>">
												<span class="time"><fmt:formatNumber value="${i }"
														minIntegerDigits="2"></fmt:formatNumber></span>
											</div>
										</c:forEach>
									</div>
									<div class="wrap_timeline tb_body">
										<div id="data_zone" class="tb_div time_data">
											<div id="clockinout_progress" class="tb_row total_time">
												<div class="progress  start close part_default"
													style="left: 54.1632%; width: 6.31269%;">
													<span id="clockIn" class="txt label_l"
														style="cursor: pointer;">출근</span> <span id="clockOut"
														class="txt label_r" style="cursor: pointer;">외근 </span>
												</div>
												<div class="progress  start initial part_default"
													style="left: 64.2797%; width: 2.77778%;">
													<span id="clockIn" class="txt label_l"
														style="cursor: pointer;">업무</span>
												</div>
											</div>
											<div id="approval_progress" class="tb_row total_time">
												<div id="95" class="progress part_approval start close"
													style="left: 75%; width: 8.33333%;">
													<span class="txt">연장 <span> (완료)</span>
													</span>
												</div>
											</div>
											<div class="tb_row workingstate">
												<c:forEach var="j" begin="0" end="23">
													<div class="tb_cell">
														<div class="tb_div">
															<c:forEach var="k" begin="0" end="5">
																<div class="min"></div>
															</c:forEach>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div id="time_wrapper" class="tb_div tb_bg"
											style="height: 136px;">
											<c:forEach var="l" begin="0" end="23">
												<div class="tb_cell">
													<div class="tb_div">
														<c:forEach var="m" begin="0" end="5">
															<div class="min"></div>
														</c:forEach>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								</c:forEach>
						    </div>
					    </div>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
	</section>
	<section>
	<div class="tool_bar tool_absolute wrap_tb_box">
        <div class="critical">
            <section class="marker2">
                <ul>
                    <li class="normal"><span></span>정상</li>
                    <li class="late"><span></span>지각</li>
                    <li class="modify"><span></span>수정</li>
                </ul>
            </section>
        </div>
    </div>
	</section>
	