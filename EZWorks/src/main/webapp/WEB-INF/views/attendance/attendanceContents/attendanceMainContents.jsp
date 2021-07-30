<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	#calendar_tool_bar {
		position: relative;
	    min-height: 38px;
	    padding: 0 0 8px 0;
		margin: 16px 0 0 0;
		display: block;
	}
	.current_date{
		height: 40px;
		text-align: center;
		margin: 0 160px;
	}
	#baseDate {
		font-size: 24px;
		vertical-align: top;
    	display: inline-block;
    	margin-top: 0px;
    	margin: 0px 8px 0;
	}
	.btn_border{
		vertical-align: bottom;
		display: inline-block;
	    padding: 8px 12px;
	    cursor: pointer;
	    text-align: center;
	}
	.wrap_statistics{
		padding: 0;
		margin: 0 24px;
		min-width: 940px;
	}
	.tool_bar {
		position: relative;
	    min-height: 38px;
	    padding: 0 0 8px 0;
	    margin: 0;
	}
	.critical {
		margin: 5px 0 0;
		float: left;
		padding: 0;
	}
	.info_group {
		font-size: 14px;
	}
	.optional {
		margin: 5px 0 0;
		float: right;
    	position: inherit;
    	padding: 0;
	}
	.wrap_ehr_data {
	    padding: 0 20px;
	    background: #fff;
	    border: 1px solid #dcdcdc;
	    margin-bottom: 40px;
	}
	.ehr_stat_data {
	    display: inline-block;
	    padding: 20px 0;
	    width: 15%;
	    max-width: 220px;
	    vertical-align: top;
	}
	.wrap_ehr_data .ehr_stat_data p.stat_tit {
	    text-align: center;
	}
	p, input {
	    margin: 0;
	    padding: 0;
	}
	dl, font, p, ol {
	    line-height: 150%;
	}
	p.stat_tit {
	    display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	}
	.wrap_ehr_data .ehr_stat_data p.stat_txt {
	    margin-top: 8px;
	    font-size: 25px;
	    text-align: center;
	    color: #263a6f;
	    letter-spacing: -1px;
	}
	.divide_bar {
	    display: inline-block;
	    margin: 24px 8px;
	    width: 1px;
	    height: 110px;
	    background: #eaeaea;
	    vertical-align: middle;
	}
	.wrap_tb_box {
	    margin: 25px 0 0;
	    min-width: 940px;
	}
	section.wrap_tb_tit {
	    padding-bottom: 6px;
	    padding-left: 24px;
	    min-height: 32px;
	    border-bottom: 1px solid #e1e1e1;
	}
	article, aside, figure, footer, header, hgroup, nav, section {
	    display: block;
	}
	h2.table_tit {
	    height: 35px;
	    font-size: 16px;
	    line-height: 35px;
	    font-weight: bold;
	    font-weight: 500;
	    float: left;
	    margin: 0;
    	padding: 0;
	}
	h2.table_tit .btn_wrap {
	    margin-right: 8px;
	    vertical-align: top;
	}
	span.btn_wrap, a.btn_wrap {
	    cursor: pointer;
	    display: inline-block;
	}
	.tb_optional {
	    float: right;
	    vertical-align: top;
	    line-height: 34px;
	    min-width: 330px;
	    padding-right: 24px;
	    text-align: right;
	}
	.wrap_tb_shadow {
	    margin-top: -1px;
	    border: 1px solid #dcdcdc;
	    border-left: none;
	    border-right: none;
	    display: block;
	}
	.tb_attend_header {
	    height: 50px;
	    display: table;
	    width: 100%;
	    background: #fff;
	    color: #333;
	}
	.tb_attend_header .tb_content.date {
	    width: 140px;
	    text-align: center;
	}
	.tb_attend_header .tb_content {
	    padding: 0 15px;
	    height: 32px;
	    border-bottom: 1px solid #eee;
	    font-weight: 500;
	}
	.tb_attend_header .tb_content, .tb_attend_body .tb_content {
	    display: table-cell;
	    vertical-align: middle;
	    font-size: 13px;
	    box-sizing: border-box;
	    letter-spacing: -1px;
	}
	.tb_attend_header .tb_content.attend, .tb_attend_body .tb_content.attend {
	    width: 140px;
	}
	.tb_attend_body {
	    height: 45px;
	    display: table;
	    width: 100%;
	    background: #fff;
	    color: #333;
	}
	.tb_attend_body .tb_attend_list {
	    display: table;
	    width: 100%;
	    position: relative;
	}
	.tb_attend_body .tb_attend_list div:first-child {
	    border-left: 1px solid #fff;
	}
	.tb_attend_body .tb_content.date_l {
	    padding-right: 5px;
	    width: 60px;
	    text-align: right;
	    font-weight: 500;
	}
	.tb_attend_body .tb_attend_list div {
	    border-top: 1px solid #fff;
	    border-right: 0;
    }
    .tb_attend_body .tb_content {
	    min-height: 50px;
	    vertical-align: top;
	}
	.tb_attend_header .tb_content, .tb_attend_body .tb_content {
	    display: table-cell;
	    padding: 14px 15px;
	    font-size: 13px;
	    box-sizing: border-box;
	    letter-spacing: -1px;
	}
	.tb_attend_body .tb_content.date_l span.txt {
	    padding-top: 1px;
	    width: 20px;
	    height: 20px;
	    border-radius: 20px;
	    text-align: center;
	    box-sizing: border-box;
	}
	.tb_attend_body .tb_content.date_r {
	    padding-left: 5px;
	    width: 80px;
	    text-align: left;
	}
	.tb_attend_header .tb_content.attend, .tb_attend_body .tb_content.attend {
	    width: 140px;
	}
	span.txt {
	    display: inline-block;
	}
	.tb_attend_header .tb_content.leave, .tb_attend_body .tb_content.leave {
	    width: 150px;
	}
	.tb_attend_body .tb_content.total_time {
	    font-weight: 500;
	}
	.tb_attend_header .tb_content.total_time, .tb_attend_body .tb_content.total_time {
	    width: 150px;
	}
	.tb_attend_body .tb_content.status, .tb_attend_header .tb_content.status {
	    width: 320px;
	}
	.tb_attend_header .tb_content.status, .tb_attend_body .tb_content.status, .tb_attend_header .tb_content.approval_list, .tb_attend_body .tb_content.approval_list {
	    text-align: left;
	}
	.tb_attend_body .tb_attend_list div:last-child {
	    border-right: 1px solid #fff;
	}
	.wrap_tb_box .day_sat .date_l .txt, .wrap_tb_box .day_sat .date_r .txt, .wrap_tb_box th.days.day_sat .title_sort {
	    color: #888;
	}
	.wrap_tb_box .late, .wrap_tb_box .day_sun .date_l .txt, .wrap_tb_box .day_sun .date_r .txt, .wrap_tb_box .day_holiday .date_l .txt, .wrap_tb_box .day_holiday .date_r .txt, .wrap_tb_box th.days.day_sun .title_sort, .wrap_tb_box th.days.day_holiday .title_sort {
	    color: #f07f7f;
	}
	.tb_optional .txt {
	    font-size: 14px;
	    font-weight: 500;
	}
	.tb_optional .desc {
	    font-size: 13px;
	    vertical-align: middle;
	    line-height: 1.5;
    	margin: 0;
    	color: #999;
	}
	.tb_attend_body .tb_attend_list.today .date_l span.txt {
	    background: #00a1b9;
	    border-radius: 20px;
	    color: #fff;
	}
</style>

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
            <span class="date" id="baseDate">2021.07</span>
            <span class="btn_ic_next2 btn_border" title="이후" id="nextMonth"><span class="fa-fw select-all fas"></span></span>
            <input id="calendarDatepicker" type="text" style="border:0px;width:0px;height:0px;" class="hasDatepicker">
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
				<div>
					<div class="wrap_tb_box" id="week">
						
					    <section class="wrap_tb_tit">
					        <h2 class="table_tit"><span class="btn_wrap"><span class="fa-fw select-all fas"></span></span>1 주차</h2>
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
					        			<span class="txt">28</span>
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
	
				<div>
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
				</div></div><div><div class="wrap_tb_box" id="week">
		
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
		        <div class="tb_attend_list">    <div class="tb_content date_l">
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
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
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
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
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
		    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
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
		    </div></div><div class="tb_attend_list day_sat today tb_attend_select">    <!-- today라는 class 추가시 저렇게 됨 -->
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
		    </div></div><div class="tb_attend_detail2"><div id="time_zone" class="tb_div tb_head">
		
		<div class="tb_cell"> <span class="time">00</span> </div><div class="tb_cell"> <span class="time">01</span> </div><div class="tb_cell"> <span class="time">02</span> </div><div class="tb_cell"> <span class="time">03</span> </div><div class="tb_cell"> <span class="time">04</span> </div><div class="tb_cell"> <span class="time">05</span> </div><div class="tb_cell"> <span class="time">06</span> </div><div class="tb_cell"> <span class="time">07</span> </div><div class="tb_cell workinghours"> <span class="time">08</span> </div><div class="tb_cell workinghours"> <span class="time">09</span> </div><div class="tb_cell workinghours"> <span class="time">10</span> </div><div class="tb_cell workinghours"> <span class="time">11</span> </div><div class="tb_cell workinghours"> <span class="time">12</span> </div><div class="tb_cell workinghours"> <span class="time">13</span> </div><div class="tb_cell workinghours"> <span class="time">14</span> </div><div class="tb_cell workinghours"> <span class="time">15</span> </div><div class="tb_cell workinghours"> <span class="time">16</span> </div><div class="tb_cell workinghours"> <span class="time">17</span> </div><div class="tb_cell"> <span class="time">18</span> </div><div class="tb_cell"> <span class="time">19</span> </div><div class="tb_cell"> <span class="time">20</span> </div><div class="tb_cell"> <span class="time">21</span> </div><div class="tb_cell"> <span class="time">22</span> </div><div class="tb_cell"> <span class="time">23</span> </div></div>
		
		<div class="wrap_timeline tb_body">
		    <!--
		        클래스명 설명
		        .part_default : 일반 근무 시간
		        .part_approval : 승인 근무 시간
		        .part_overtime : 초과 근무 시간
		        .part_approval.wait : 연장근무 승인대기
		        .part_overtime.wait : 초과근무 승인대기
		        .start : 시작
		        .close : 종료
		        .initial : 최초 출근 시(출근 30분 후 클래스 제거), 출/퇴근이 60분 이내에 이루어졌을 경우 적용
		    -->
		    <div id="data_zone" class="tb_div time_data">
		        <div id="clockinout_progress" class="tb_row total_time"></div>
		        <div id="approval_progress" class="tb_row total_time"></div>
		    </div>
		
		
		        <!-- 상태 추가 시 row가 한줄씩 추가됨 (상태가 여러개일 경우 레이블이 서로 겹치는 현상을 방지하기 위함)-->
		    <div id="time_wrapper" class="tb_div tb_bg" style="height:72px"> <div class="tb_cell">
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
		</div><div class="tb_cell workinghours">
		<div class="tb_div">
		
		<div class="min coretime_s" title="의무 근로 시작 시간">
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
		
		<!--
		<div class="time_tb" id="timeline_list">
		</div>
		-->
		</div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
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
		</div></div></div></div>
	</section>
	
				<%-- <div class="tab-content" id="myTabContent" style="border-right:1px solid #dfe3e7;border-collapse:collapse;margin-right:250px;height:100%;">
					<div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="favorites-tab">
						<ul style="list-style:none;padding:0px">
						<c:if test="${!empty favBoardPostingList }">
							<c:forEach var="posts" items="${favBoardPostingList }">
								<li class="postvos" onclick="location.href='<c:url value="/board/postingDetail?postingNo=${posts.postingNo }"/>'">
									<div style="margin:0px;">
											<c:if test="${posts.deptNo==0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">EZ그룹 </span>
											</c:if>
											<c:if test="${posts.deptNo!=0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">부서|${posts.deptName }</span>
											</c:if>
											<span style="font-size: 0.7em;color:#aaaaaa">></span>
											<a style="font-size: 0.7em;color:#aaaaaa">${posts.boardName }</a>
											&nbsp&nbsp&nbsp
											<span style="font-size: 0.7em;color:#aaaaaa">
												<span class="fa-fw select-all fas"></span>
												<span>댓글 수</span>
											</span>
											<div style="padding-top:5px">
												<h6>${posts.postingTitle }</h6>
											</div>
											<div class="htmlArea">
												<span id="content">${posts.postingContent }</span>
											</div>
											<div style="margin-top:5px">
												<span class="avatar avatar-sm"><a><img alt="" src="<c:url value='/resources/empImages/${posts.empImg }'/>"></a></span>
												<a style="font-size: 0.7em">${posts.empName } ${posts.posName }</a>
												<span style="font-size: 0.7em">
												<fmt:formatDate value="${posts.postingRegdate }" pattern="yyyy-MM-dd"/>
												</span>
												<span></span>
												<span></span>
											</div>
									</div>
								</li>
							</c:forEach>
							</c:if>
						</ul>
					</div>
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<ul style="list-style:none;padding:0px">
							<c:forEach var="posts" items="${allPostingList }">
								<li class="postvos" onclick="location.href='<c:url value="/board/postingDetail?postingNo=${posts.postingNo }"/>'">
									<div style="margin:0px;">
											<c:if test="${posts.deptNo==0 }">
											<span style="font-size: 0.7em;color:#aaaaaa">EZ그룹 </span>
											</c:if>
											<c:if test="${posts.deptNo!=0 }">
											<span  style="font-size: 0.7em;color:#aaaaaa">부서|${posts.deptName }</span>
											</c:if>
											<span style="font-size: 0.7em;color:#aaaaaa">></span>
											<a style="font-size: 0.7em;color:#aaaaaa">${posts.boardName }</a>
											&nbsp&nbsp&nbsp
											<span style="font-size: 0.7em;color:#aaaaaa">
												<span class="fa-fw select-all fas"></span>
												<span>댓글 수</span>
											</span>
											<div style="padding-top:5px">
												<h6>${posts.postingTitle }</h6>
											</div>
											<div class="htmlArea">
												<span id="content">${posts.postingContent }</span>
											</div>
											<div style="margin-top:5px">
												<span class="avatar avatar-sm"><a><img alt="" src="<c:url value='/resources/empImages/${posts.empImg }'/>"></a></span>
												<a style="font-size: 0.7em">${posts.empName } ${posts.posName }</a>
												<span style="font-size: 0.7em">
												<fmt:formatDate value="${posts.postingRegdate }" pattern="yyyy-MM-dd"/>
												</span>
											</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div> --%>
				
				
				
	</div>
</body>
</html>