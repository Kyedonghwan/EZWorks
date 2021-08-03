<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/ccfc8e2515.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceMainContents.css'/>">
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="/resources/demos/style.css">
 --><link rel="stylesheet" href="<c:url value='/resources/css/attendance/datepicker.css'/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	var basedate = new Date();
	var baseyear = basedate.getFullYear();
	var basemonth = ('0' + (basedate.getMonth() + 1)).slice(-2);
	document.getElementById("baseDate").innerHTML = (baseyear)+"."+(basemonth);
	$('.btn_wrap').click(function(){
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
        	alert(year);
        	document.getElementById("baseDate").innerHTML = (year)+"."+(month);
        }
    });
    
    /* $('#baseDate').click(function(){
    	$("#calendarDatepicker").datepicker("show");
    }); */
});
function showDatepicker(){
	$('#calendarDatepicker').datepicker("show");
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
            <span class="date" id="baseDate" onclick="showDatepicker()">2021.07</span>
            <span class="btn_ic_next2 btn_border" title="이후" id="nextMonth"><span class="fa-fw select-all fas"></span></span>
            <input id="calendarDatepicker" type="hidden" style="border:0px;" autocomplete="off">
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
			<div>
			
				<c:forEach var="i" begin="1" end="${weeks }">
			
				<div>
					<div class="wrap_tb_box" id="week">
						
					    <section class="wrap_tb_tit">
					        <h2 class="table_tit"><span class="btn_wrap"><i class="fas fa-chevron-down" ></i></span>${i } 주차</h2>
					        <div class="tb_optional">
					            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
					            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
					        </div>
					    </section>
					    <div class="wrap_tb_shadow" id="day_area" style="display:none">
					        <div class="tb_attend_header">
					            <div class="tb_content date">
					                <span class="txt">일자
					                <c:forEach var="j" items="${datelist }">
					                	<span>${j.year+1900 }/${j.month+1 }/${j.date }(${j.day })</span>
					                </c:forEach>
					                
					                </span>
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
					        	<div class="tb_attend_list">    
					        		<div class="tb_content date_l">
					        			<span class="txt">28</span>
					    			</div>
								    <div class="tb_content date_r">
								        <span class="txt">월</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">29</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">화</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">30</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">수</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">01</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">목</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">02</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">금</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
								        <span class="txt">03</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">토</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
								        <span class="txt">04</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">일</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
						    </div>
					    </div>
						
					</div>
				</div>
			</c:forEach>
				<!-- <div>
					<div class="wrap_tb_box" id="week">
					
					    <section class="wrap_tb_tit">
					        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>2 주차</h2>
					        <div class="tb_optional">
					            <span class="txt">누적 근무시간 <strong class="">8h 0m 0s</strong></span>
					            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
					        </div>
					    </section>
					    <div class="wrap_tb_shadow" id="day_area">
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
						        <div class="tb_attend_list">    
							        <div class="tb_content date_l">
								        <span class="txt">05</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">월</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt   late ">17:37:02
								            <span class="ic_con ic_gps_2">
								                <span class="tool_tip top">
								                    <strong>IP :</strong> 218.146.7.142 <br>
								
								
					
					
								                     <i class="tail_top"></i>
								                </span>
								            </span>
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">17:37:41
								            <span class="ic_con ic_gps_2">
								                <span class="tool_tip top">
								                    <strong>IP :</strong> 218.146.7.142 <br>
					
					
					
								                <i class="tail_top"></i>
								                </span>
								            </span>
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt">8h 0m 0s</span>
								    </div>
								    <div class="tb_content status">
								        기본 8h 0m 0s / 연장 0h 0m 0s / 야간 0h 0m 0s
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">06</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">화</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">07</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">수</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">08</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">목</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">09</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">금</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
								        <span class="txt">10</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">토</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
								        <span class="txt">11</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">일</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
						    </div>
		   				 </div>
					</div>
				</div>
				<div>
					<div class="wrap_tb_box" id="week">
		
					    <section class="wrap_tb_tit">
					        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>3 주차</h2>
					        <div class="tb_optional">
					            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
					            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
					        </div>
					    </section>
					    <div class="wrap_tb_shadow" id="day_area">
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
					        	<div class="tb_attend_list">    
					        		<div class="tb_content date_l">
					        			<span class="txt">12</span>
					    			</div>
								    <div class="tb_content date_r">
								        <span class="txt">월</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
							    <div class="tb_attend_list">    
							    	<div class="tb_content date_l">
								        <span class="txt">13</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">화</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">09:51:56
								            <span class="ic_con ic_gps_2">
								                <span class="tool_tip top">
								                    <strong>IP :</strong> 112.170.49.66 <br>
								
								
								
								                <i class="tail_top"></i>
								                </span>
								            </span>
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
							    <div class="tb_attend_list">    
							    	<div class="tb_content date_l">
							        	<span class="txt">14</span>
							    	</div>
								    <div class="tb_content date_r">
								        <span class="txt">수</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
							    <div class="tb_attend_list">    
							    	<div class="tb_content date_l">
								        <span class="txt">15</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">목</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
								        <span class="txt">16</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">금</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
								        <span class="txt">17</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">토</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
								        <span class="txt">18</span>
								    </div>
								    <div class="tb_content date_r">
								        <span class="txt">일</span>
								    </div>
								    <div class="tb_content attend">
								        <span class="txt  ">
								        </span>
								    </div>
								    <div class="tb_content leave">
								        <span class="txt ">
								        </span>
								    </div>
								    <div class="tb_content total_time">
								        <span class="txt"></span>
								    </div>
								    <div class="tb_content status">
								        
								    </div>
								    <div class="tb_content approval_list">
								    </div>
							    </div>
						    </div>
					    </div>
					</div>
				</div>
				<div>
					<div class="wrap_tb_box" id="week">
		
				    <section class="wrap_tb_tit">
				        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>4 주차</h2>
				        <div class="tb_optional">
				            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
				            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
				        </div>
				    </section>
		    <div class="wrap_tb_shadow" id="day_area">
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
			        <div class="tb_attend_list">    
				        <div class="tb_content date_l">
					        <span class="txt">19</span>
					    </div>
					    <div class="tb_content date_r">
					        <span class="txt">월</span>
					    </div>
					    <div class="tb_content attend">
					        <span class="txt  ">
					        </span>
					    </div>
					    <div class="tb_content leave">
					        <span class="txt ">
					        </span>
					    </div>
					    <div class="tb_content total_time">
					        <span class="txt"></span>
					    </div>
					    <div class="tb_content status">
					        
					    </div>
					    <div class="tb_content approval_list">
					    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
					        <span class="txt">20</span>
					    </div>
					    <div class="tb_content date_r">
					        <span class="txt">화</span>
					    </div>
					    <div class="tb_content attend">
					        <span class="txt  ">
					        </span>
					    </div>
					    <div class="tb_content leave">
					        <span class="txt ">
					        </span>
					    </div>
					    <div class="tb_content total_time">
					        <span class="txt"></span>
					    </div>
					    <div class="tb_content status">
					        
					    </div>
					    <div class="tb_content approval_list">
					    </div>
				    </div>
				    <div class="tb_attend_list">    
				    	<div class="tb_content date_l">
					        <span class="txt">21</span>
					    </div>
					    <div class="tb_content date_r">
					        <span class="txt">수</span>
					    </div>
					    <div class="tb_content attend">
					        <span class="txt  ">
					        </span>
					    </div>
					    <div class="tb_content leave">
					        <span class="txt ">
					        </span>
					    </div>
					    <div class="tb_content total_time">
					        <span class="txt"></span>
					    </div>
					    <div class="tb_content status">
					        
					    </div>
					    <div class="tb_content approval_list">
					    </div>
				    </div>
				    <div class="tb_attend_list">    
				    	<div class="tb_content date_l">
				        	<span class="txt">22</span>
	    				</div>
					    <div class="tb_content date_r">
					        <span class="txt">목</span>
					    </div>
					    <div class="tb_content attend">
					        <span class="txt  ">
					        </span>
					    </div>
					    <div class="tb_content leave">
					        <span class="txt ">
					        </span>
					    </div>
					    <div class="tb_content total_time">
					        <span class="txt"></span>
					    </div>
					    <div class="tb_content status">
					        
					    </div>
					    <div class="tb_content approval_list">
					    </div>
					    </div>
					    <div class="tb_attend_list">    
					    <div class="tb_content date_l">
					        <span class="txt">23</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">금</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
		        <span class="txt">24</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">토</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
		        <span class="txt">25</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">일</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div></div>
		    </div>
		</div></div><div><div class="wrap_tb_box" id="week">
		
		    <section class="wrap_tb_tit">
		        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_close" id="weekToggle"></span></span>5 주차</h2>
		        <div class="tb_optional">
		            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
		            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
		        </div>
		    </section>
		    <div class="wrap_tb_shadow" id="day_area" style="">
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
		        <div class="tb_attend_list">    <div class="tb_content date_l">
		        <span class="txt">26</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">월</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
		        <span class="txt">27</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">화</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
		        <span class="txt">28</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">수</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
		        <span class="txt">29</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">목</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
		        <span class="txt">30</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">금</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div>
		    <div class="tb_attend_list day_sat today tb_attend_select">    today라는 class 추가시 저렇게 됨
		    <div class="tb_content date_l">
		        <span class="txt">31</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">토</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div>
		    
		    <div class="tb_attend_detail2">
		    	<div id="time_zone" class="tb_div tb_head">
		
					<div class="tb_cell"> <span class="time">00</span> </div>
					<div class="tb_cell"> <span class="time">01</span> </div>
					<div class="tb_cell"> <span class="time">02</span> </div>
					<div class="tb_cell"> <span class="time">03</span> </div>
					<div class="tb_cell"> <span class="time">04</span> </div>
					<div class="tb_cell"> <span class="time">05</span> </div>
					<div class="tb_cell"> <span class="time">06</span> </div>
					<div class="tb_cell"> <span class="time">07</span> </div>
					<div class="tb_cell workinghours"> <span class="time">08</span> </div>
					<div class="tb_cell workinghours"> <span class="time">09</span> </div>
					<div class="tb_cell workinghours"> <span class="time">10</span> </div>
					<div class="tb_cell workinghours"> <span class="time">11</span> </div>
					<div class="tb_cell workinghours"> <span class="time">12</span> </div>
					<div class="tb_cell workinghours"> <span class="time">13</span> </div>
					<div class="tb_cell workinghours"> <span class="time">14</span> </div>
					<div class="tb_cell workinghours"> <span class="time">15</span> </div>
					<div class="tb_cell workinghours"> <span class="time">16</span> </div>
					<div class="tb_cell workinghours"> <span class="time">17</span> </div>
					<div class="tb_cell"> <span class="time">18</span> </div>
					<div class="tb_cell"> <span class="time">19</span> </div>
					<div class="tb_cell"> <span class="time">20</span> </div>
					<div class="tb_cell"> <span class="time">21</span> </div>
					<div class="tb_cell"> <span class="time">22</span> </div>
					<div class="tb_cell"> <span class="time">23</span> </div>
				</div>
		
				<div class="wrap_timeline tb_body">
				    
				        클래스명 설명
				        .part_default : 일반 근무 시간
				        .part_approval : 승인 근무 시간
				        .part_overtime : 초과 근무 시간
				        .part_approval.wait : 연장근무 승인대기
				        .part_overtime.wait : 초과근무 승인대기
				        .start : 시작
				        .close : 종료
				        .initial : 최초 출근 시(출근 30분 후 클래스 제거), 출/퇴근이 60분 이내에 이루어졌을 경우 적용
				   
				    <div id="data_zone" class="tb_div time_data">
				        <div id="clockinout_progress" class="tb_row total_time"></div>
				        <div id="approval_progress" class="tb_row total_time"></div>
				    </div>
				
				
				        상태 추가 시 row가 한줄씩 추가됨 (상태가 여러개일 경우 레이블이 서로 겹치는 현상을 방지하기 위함)
				    <div id="time_wrapper" class="tb_div tb_bg" style="height:72px"> <div class="tb_cell">
						<div class="tb_div">
						
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
						
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
						
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
										
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
										
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
										
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
										
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell">
						<div class="tb_div">
											
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">
										
							<div class="min coretime_s" title="의무 근로 시작 시간">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
							<div class="min">
							</div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">
										
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
							<div class="min"></div>
						</div>
					</div>
					<div class="tb_cell workinghours">
						<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min break">
										</div><div class="min break">
										</div><div class="min break">
										</div><div class="min break">
										</div><div class="min break">
										</div><div class="min break">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell workinghours">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min coretime_s" title="의무 근로 종료 시간">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div><div class="tb_cell">
										<div class="tb_div">
										
										<div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div><div class="min">
										</div></div>
										</div></div>
										</div>
				
				
				<div class="time_tb" id="timeline_list">
				</div>
				
		</div>
		<div class="tb_attend_list day_sun">    
			<div class="tb_content date_l">
		        <span class="txt">01</span>
		    </div>
		    <div class="tb_content date_r">
		        <span class="txt">일</span>
		    </div>
		    <div class="tb_content attend">
		        <span class="txt  ">
		        </span>
		    </div>
		    <div class="tb_content leave">
		        <span class="txt ">
		        </span>
		    </div>
		    <div class="tb_content total_time">
		        <span class="txt"></span>
		    </div>
		    <div class="tb_content status">
		        
		    </div>
		    <div class="tb_content approval_list">
		    </div></div></div>
		    </div>
		</div>
		</div> -->
		</div>
		</div>
	</section>
	