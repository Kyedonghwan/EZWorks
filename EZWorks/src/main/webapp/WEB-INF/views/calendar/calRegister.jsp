<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>

<link rel="stylesheet"
	href="<c:url value='/resources/vendors/choices.js/choices.min.css'/>" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/app.css'/>">
<link rel="shortcut icon"
	href="<c:url value='/resources/images/favicon.svg" type="image/x-icon'/>">


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 //maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
            
    });
</script>
<style>
.registerDiv {
	margin: 10px 0 15px 0;
}

.writeLabel {
	width: 20%;
	float: left;
	text-align: left;
	padding: 5px 10px 0 10px;
	clear: left;
}

.chkbox {
	margin-right: 5px;
}

#startDate, #endDate {
	width: 15%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}

#title {
	width: 50%;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}

#join {
	width: 30%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}

#place {
	width: 70%;
	height: 30px;
	display: inline-block;
	margin-right: 10px;
	border: 1px solid #CFCFCF;
	padding: .2rem .75rem;
}

#exampleFormControlTextarea1 {
	border: 1px solid #CFCFCF;
	width: 70%;
}

#basicSelect {
	width: 15%;
	height: 30px;
	font-size: 0.9em;
}
.form-group{
	width: 70%;
	display: inline-block;
}
</style>

<div class="card-body" style="height: 600px;">
	<div id="area">
		<input type="button" class="btn btn-outline-secondary" id="regBtn"
			style="width: 200px; height: 50px" value="일정등록"><br> <BR>
		<span class="more"><img
			src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
		<span class="accordion"> 내 캘린더 </span>
		<ul class="panel">
			<li>
				<div class="checkbox">
					<input type="checkbox" id="checkbox1" class="form-check-input"
						checked> <label for="checkbox1">내 일정(기본)</label>
				</div>
				<div class="checkbox">
					<input type="checkbox" id="checkbox1" class="form-check-input"
						checked> <label for="checkbox1">내 일정(중요)</label>
				</div>
				<div class="checkbox">
					<input type="checkbox" id="checkbox1" class="form-check-input"
						checked> <label for="checkbox1">연차</label>
				</div>
			</li>
		</ul>
		<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
		<span style="color: gray">내 캘린더 추가</span> <br> <br> <span
			class="more"><img
			src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
		<span class="accordion"> 관심 캘린더 </span>
		<ul class="panel">
			<li>
				<div class="checkbox">
					<input type="checkbox" id="checkbox2" class="form-check-input"
						checked> <label for="checkbox2">전체</label>
				</div>
				<div class="checkbox">
					<input type="checkbox" id="checkbox2" class="form-check-input"
						checked> <label for="checkbox2">내 일정(전병헌)</label>
				</div>
			</li>
		</ul>
		<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
		<span style="color: gray">관심 캘린더 추가</span>
		<hr>
		<ul>
			<li>
				<div class="checkbox">
					<input type="checkbox" id="checkbox1" class="form-check-input"
						checked> <label for="checkbox1">전사일정</label>
				</div>
				<div class="checkbox">
					<input type="checkbox" id="checkbox1" class="form-check-input"
						checked> <label for="checkbox1">임원일정</label>
				</div>
			</li>
		</ul>
		<img src="<c:url value='/resources/images/accordion/gear.svg'/>">
		<span>캘린더 환경설정</span>
	</div>
</div>


<%@ include file="../include/middle.jsp"%>
<div class="card-header">
	<h4>일정등록</h4>
</div>
<div class="card-body" style="height: 100%;">
	<form name="regFrm" action="<c:url value='/calendar/calRegister'/>" method="post">
		<div class="registerDiv">
			<input type="text" id="title" class="form-control round" 
				name="schTitle" value="${schTitle}">
			 <input type="checkbox" class="chkbox">비공개

		</div>
		<div class="registerDiv">
			<input type="text" id="startDate" name="schStart"
				class="form-control round" value="${schStart }"> 
			<label for="to">~</label> 
			<input type="text" id="endDate" name="schEnd" 
				class="form-control round" value=""${schEnd }>
				&nbsp;&nbsp;
			<input type="checkbox" value="종일" class="chkbox">종일
		</div>
		<div class="registerDiv">
			<label class="writeLabel">전사일정</label> 
			<input type="checkbox" class="chkbox" 
				>전사일정
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내 캘린더</label> <select class="form-select"
				id="basicSelect">
				<option>(기본)내 일정</option>
				<option>내 일정(중요)</option>
				<option>연차</option>
			</select>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">참석자</label> 
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>"> 
			<span>참석자선택</span>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">외부참석자</label> 
			<input type="text" id="join" name="schExtAttend" 
				class="form-control round" value="${schExtAttend }"> 
			<input type="button" value="추가">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">장소</label> 
			<input type="text" id="place" name="schPlace" 
				class="form-control round" value="${schPlace }">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="10" value="${schContent }" name="schContent">
			</textarea>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">예약하기</label>
			<div class="form-group">
				<select class="choices form-select">
					<optgroup label="Figures">
						<option value="romboid">Romboid</option>
						<option value="trapeze">Trapeze</option>
						<option value="triangle">Triangle</option>
						<option value="polygon">Polygon</option>
					</optgroup>
					<optgroup label="Colors">
						<option value="red">Red</option>
						<option value="green">Green</option>
						<option value="blue">Blue</option>
						<option value="purple">Purple</option>
					</optgroup>
				</select>
			</div>
		</div>
		<div>
			<input type="submit" value="확인">
			<input type="button" value="닫기">
		</div>
	</form>
</div>
<script
	src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<!-- Include Choices JavaScript -->
<script
	src="<c:url value='/resources/vendors/choices.js/choices.min.js'/>"></script>

<script src="<c:url value='/resources/js/main.js'/>"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<%@ include file="../include/bottom.jsp"%>