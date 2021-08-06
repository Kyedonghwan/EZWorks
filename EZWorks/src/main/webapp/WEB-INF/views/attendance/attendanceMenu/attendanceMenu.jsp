<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceMenu.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>
<style type="text/css">
#statusList{
	font-size: 14px;
	white-space: normal;
    word-break: break-all;
    letter-spacing: -0.5px;
	margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    margin: 0;
    list-style: none;
	max-height: 200px;
    overflow-y: auto;
    padding-left:0px;
}
li.timelineStatus{
	border-radius: 4px 0 0 0;
	padding: 8px 10px;
	margin: 0;
	display: list-item;
}
div.dropdown-menu{
	width: 100px;
    padding: 0 10px;
    box-sizing: border-box;
    border:1px solid black;
}
.function_btn_wrap {
    width: 100%;
    overflow: hidden;
    text-align: center;
    display: block;
    margin: 0 auto;
    padding: 0;
}

</style>

<script>
	
	$(function(){
		const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
		function changeDate() {
			const moment_ = moment(); //시간받기위해서 new date
			document.getElementById("timer").innerHTML = moment_.format('HH:mm:ss');
			const date = moment_.format('YYYY-MM-DD');
			const weekDayName = daysOfWeek[moment_.day()]
			document.getElementById("date").innerHTML = date + "(" + weekDayName + ")";
		}
		function time() {
			setInterval(changeDate, 1000); //1초 지난후 time()실행
		}
 		time();
		$('.chevron-right').click(function(){
			if($(this).children('span').children('img').attr("class")=="fold"){
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-down.svg'/>");
				$(this).children('span').children('img').attr("class","unfold");
			}else{
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-right.svg'/>");
				$(this).children('span').children('img').attr("class","fold");
			}
		});
	});
	
	

		
</script>
<div id="wanttocal" style="margin:0px;padding:0px;height:100%;">
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a href="<c:url value='/attendance/attendanceMain'/>">근태관리</a>
	</h5>
</section>
<section style="padding:0px 24px 16px;">
	<p class="date" id="date"></p>
	<p class="time" id="timer"></p>
	<div class="log_view_wrap">
		<ul class="log_view">
			<li>
				<dl>
					<dt>출근시간</dt>
					<dd id="workInTime">12:30:38</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>퇴근시간</dt>
					<dd id="workOutTime">12:32:23</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>주간 누적 근무시간</dt>
					<dd id="weeklyTotalTime">27h 0m 0s</dd>
				</dl>
			</li>
		</ul>
    </div>
    
    <div class="vertical_bar"></div>
    
	<div class="function_btn_wrap">
		<a class="btn btn-outline-primary <c:if test="${isAttended>0 }">off</c:if>" id="workIn"><span class="txt">출근하기</span></a><!--btn이 두개일 경우 멀티 클래스 적용 btn_function_s-->
		<a class="btn btn-outline-primary <c:if test="${isEnded>0 }">off</c:if>" id="workOut"><span class="txt">퇴근하기</span></a>
	</div>
		<div class="dropdown works_state">
			<a class="btn btn-outline-primary" id="changeStatus"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<!--클릭 시, 클래스명 on 추가--> <span class="txt">업무&nbsp;&nbsp;<span
					class="fa-fw select-all fas"></span></span>
			</a>

			<div class="dropdown-menu">
				<ul class="submenu-list" id="statusList"
					style="max-height: 200px; overflow-y: auto;">
					<li class="timelineStatus"><span class="txt " data-code="3">업무</span></li>
					<li class="timelineStatus"><span class="txt " data-code="4">업무종료</span></li>
					<li class="timelineStatus"><span class="txt " data-code="5">외근</span></li>
					<li class="timelineStatus"><span class="txt " data-code="6">출장</span></li>
					<li class="timelineStatus"><span class="txt " data-code="30">반차</span></li>
				</ul>
			</div>
		</div>
	<div class="vertical_bar"></div>
	
	
	
	<%-- <div  style="align:center;width:auto;">
			<a href="<c:url value='/board/writePosting'/>" class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				글쓰기
			</a>
	</div> --%>
</section>









<section class="menus">
	<div style="padding-right:10px;padding-left:10px">
		<ul style="list-style:none;padding:0px;margin:0px;">
			<c:if test="${!empty favList }">
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>즐겨찾기</span></a>
				</p>
                <!-- c:if절, boardType => enterprise -->
                <ul class="submenu active" style="list-style:none">
                	<c:forEach var="vo" items="${favList }">
                			<li class="submenu-item" style="height:25px;">
                				<c:if test="${vo.boardIsLine==1 }">
                				<div style="display:inline-block;height:23.63px;width:100%;overflow:hidden;background-image:url('<c:url value='/resources/images/board/dotted-line.png'/>');background-size:contain;">
                				<span class="separator">${vo.boardName }&nbsp</span>
                				</div>
                				</c:if>
                				<c:if test="${vo.boardIsLine==0 }">
                				<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
                				</c:if>
                			</li>
                	</c:forEach>
               </ul>
           </li>
           <br>
			</c:if>
		
			<li class="sidebar-item active has-sub">
				
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>근태관리</span></a>
				</p>
				
                <!-- c:if절, boardType => enterprise -->
                <ul class="submenu active" style="list-style:none;padding-left:0px">
                	<li class="submenu-item" style="height:25px;">
                		<p class="approval title" style="padding-left:32px">
							<a href="#">
							<span class="txt"id="myTimelineStatus" title="내 근태 현황">내 근태 현황</span>
							</a>
						</p>
					</li>
					<li class="submenu-item" style="height:25px;">
                		<p class="approval title" style="padding-left:32px">
							<a href="#">
							<span class="txt"id="myTimelineStatus" title="내 근태 현황">내 연차 내역</span>
							</a>
						</p>
					</li>
					<li class="submenu-item" style="height:25px;">
                		<p class="approval title" style="padding-left:32px">
							<a href="#">
							<span class="txt"id="myTimelineStatus" title="내 근태 현황">내 인사정보</span>
							</a>
						</p>
					</li>
                	<c:forEach var="vo" items="${boardList }">
                		<c:if test="${vo.boardType == '전사게시판' }">
                			<li class="submenu-item" style="height:25px;">
                				<c:if test="${vo.boardIsLine==1 }">
                				<div style="display:inline-block;height:23.63px;width:100%;overflow:hidden;background-image:url('<c:url value='/resources/images/board/dotted-line.png'/>');background-size:contain;">
                				<span class="separator">${vo.boardName }&nbsp</span>
                				</div>
                				</c:if>
                				<c:if test="${vo.boardIsLine==0 }">
                				<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
                				</c:if>
                			</li>
                		</c:if>
                	</c:forEach>
               </ul>
           </li>
           <br>
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>부서 근태관리</span></a>
				</p>
				<ul class="submenu active" style="list-style: none; padding:0px;">
					<li class="sidebar-item active has-sub">
					
					<p style="padding:0px 20px 0px 32px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 12px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right"><span>영업팀<!-- require parameter(from emp) --></span></a>
					</p>
						<ul class="submenu active" style="list-style:none;padding:0px;margin:0px;padding-left:0px">
							<!-- forEach -->
							<li class="submenu-item"style="padding-left:44px">
								<a href="#">부서 근태현황</a>
							</li>
							<li class="submenu-item"style="padding-left:44px">
								<a href="#">부서 근태통계</a>
							</li>
							
							
							<c:forEach var="vo" items="${boardList }">
								<c:if test="${vo.boardType == '부서게시판' }">
									<c:if test="${vo.boardIsFolder==0 and vo.boardGroupNo==0 }">
									<li class="submenu-item"style="padding-left:44px">
										<a href="<c:url value='/board/selectedBoard?boardNo=${vo.boardNo }'/>">${vo.boardName }</a>
									</li>
									</c:if>
									<c:if test="${vo.boardIsFolder==1 }">
									<li class="sidebar-item active has-sub">
									<p style="padding:0px 20px 0px 44px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
									<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 24px;">
				           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
				           			<a href="#" class="sidebar-link chevron-right"><span>${vo.boardName }<!-- require parameter(from emp) --></span></a>
									</p>
										<ul class="submenu active" style="list-style:none;padding:0px">
										<c:forEach var="vo1" items="${boardList }">
											<c:if test="${vo1.boardGroupNo==vo.boardNo }">
												<li class="submenu-item" style="padding-left:56px">
													<a href="<c:url value='/board/selectedBoard?boardNo=${vo1.boardNo }'/>">${vo1.boardName }</a>
												</li>
											</c:if>
										</c:forEach>
										</ul>
									</li>
									</c:if>
								</c:if>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</section>
</div>