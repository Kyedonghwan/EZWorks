<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!--sweetalert2-->
<link rel="stylesheet" href="sweetalert2.min.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
                 minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
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
            
            $('#delBtn').click(function(){
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
			    				data: "no="+$('#paramNo').val(),
			    				success:function(){
			    					location.href="<c:url value='/reservation/reservMain'/>";
			    				}
			    			});
		    		  }
		    		});
		    });
            
            $('#re').click(function(){
            	location.href="${pageContext.request.contextPath}/reservation/reservDtCategory?rvdNo="+$('#cateNo').val();
            });
    });
</script>
<style>
#startDate, #endDate, #startTime, #endTime {
	width: 18%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}

#startTime, #endTime{
	width: 12%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}
#basicSelect {
	width: 13%;
	height: 34px;
	font-size: 0.9em;
	display: inline-block;
	
}
.tree{
	background-color: #D9E5FF;
	border-radius: 10px;
	border: 1px solid #D9E5FF;
	width: 14%;
	padding: 3px 3px 3px 3px;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.go_skin_advanced .content_top {
    padding: 25px 24px;
}
.go_renew table.form_type>tbody td {
    padding: 4px 24px 4px 0;
}
.txt {
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}
.form_type {
    margin: 8px 0;
    width: 100%;
}
.page_action_wrap {
    text-align: center;
    margin-top: 20px;
    padding-bottom: 20px;
}
table.form_type>tbody>tr>th {
    padding-left: 24px;
    height: 65px;
    width: 140px;
}

table.form_type tbody th {
    text-align: left;
    vertical-align: middle;
    font-weight: normal;
}
table.form_type>tbody th, table.form_type>tbody td {
    padding: 8px;
}
.go_renew input.txt {
    min-width: 40px;
}
.go_renew input.txt {
    padding: 0 8px;
    height: 26px;
}
.go_renew input.txt, .go_renew textarea {
    border: 1px solid #ddd;
    border-radius: 2px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.w_max {
    width: 100%;
    height: 10%;
}
</style>


<%@include file="sidebarReserv.jsp"%>
<%@ include file="../include/middle.jsp"%>
<div class="go_content" id="content">
	<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">${vo2.rvdName}</span>
		</h1>
	</header>
	</div>
		<!--목록:-->
		<div class="card-body" style="height: 100%;">
		<form name="editReservFrm" action="<c:url value='/reservation/reservEdit'/>" method="post">
		<div class="content_page" >
			<input type="hidden" name="no" id="paramNo" value="${param.no }">
			<input type="hidden" name="cateNo" id="cateNo" value="${vo.cateNo }">
			<table class="form_type form_add02">
				<tbody>
					<tr>
						<th class="col1"><span class="title">예약일</span></th>
						<td>
								<input type="text" id="startDate" name="startDate"
									class="form-control round" value="${vo.startDate }"> 
								<select class="form-select" id="basicSelect" id="startTime" name="startTime" value="${vo.startTime }">
                                	<option value="00:00">00:00</option>
									<option value="00:30">00:30</option>
									<option value="01:00">01:00</option>
									<option value="01:30">01:30</option>
									<option value="02:00">02:00</option>
									<option value="02:30">02:30</option>
									<option value="03:00">03:00</option>
									<option value="03:30">03:30</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
                        	</select>
								<label for="to">~</label> 
								<input type="text" id="endDate" name="endDate" 
									class="form-control round" value="${vo.endDate }">
								<select class="form-select" id="basicSelect" id="endTime" name="endTime" value="${endTime }">
                                	<option value="00:00">00:00</option>
									<option value="00:30">00:30</option>
									<option value="01:00">01:00</option>
									<option value="01:30">01:30</option>
									<option value="02:00">02:00</option>
									<option value="02:30">02:30</option>
									<option value="03:00">03:00</option>
									<option value="03:30">03:30</option>
									<option value="04:00">04:00</option>
									<option value="04:30">04:30</option>
									<option value="05:00">05:00</option>
									<option value="05:30">05:30</option>
									<option value="06:00">06:00</option>
									<option value="06:30">06:30</option>
									<option value="07:00">07:00</option>
									<option value="07:30">07:30</option>
									<option value="08:00">08:00</option>
									<option value="08:30">08:30</option>
									<option value="09:00">09:00</option>
									<option value="09:30">09:30</option>
									<option value="10:00">10:00</option>
									<option value="10:30">10:30</option>
									<option value="11:00">11:00</option>
									<option value="11:30">11:30</option>
									<option value="12:00">12:00</option>
									<option value="12:30">12:30</option>
									<option value="13:00">13:00</option>
									<option value="13:30">13:30</option>
									<option value="14:00">14:00</option>
									<option value="14:30">14:30</option>
									<option value="15:00">15:00</option>
									<option value="15:30">15:30</option>
									<option value="16:00">16:00</option>
									<option value="16:30">16:30</option>
									<option value="17:00">17:00</option>
									<option value="17:30">17:30</option>
									<option value="18:00">18:00</option>
									<option value="18:30">18:30</option>
									<option value="19:00">19:00</option>
									<option value="19:30">19:30</option>
									<option value="20:00">20:00</option>
									<option value="20:30">20:30</option>
									<option value="21:00">21:00</option>
									<option value="21:30">21:30</option>
									<option value="22:00">22:00</option>
									<option value="22:30">22:30</option>
									<option value="23:00">23:00</option>
									<option value="23:30">23:30</option>
                        	</select>
							</td>
					</tr>

					<tr>
						<th><span class="title">예약자</span></th>
						<td>
							<div class="wrap_name_tag">
									<span id="addAttend">
									<input type='text' class='tree' name='subscriber' value="${vo.subscriber }">
									</span>
									&nbsp;
									<span class="fa-fw select-all fas"></span>
									<span id="selectAttend">변경</span>
							</div>
						</td>
					</tr>

					<tr data-type="attribute" data-id="20">
						<th><span class="title">목적</span></th>
						<td>
							<div class="wrap_txt">
								<input class="txt1 w_max form-control round" type="text" name="purpose" value="${vo.purpose }">
							</div>
						</td>
					</tr>
					<tr class="line">
						<td colspan="2"><hr></td>
					</tr>
				</tbody>
			</table>
			<div class="page_action_wrap">
				<input type="button" class="btn btn-primary ml-1" id="re" value="목록으로 돌아가기">
			<input type="submit" class="btn btn-light-primary" id="editBtn" value="예약 수정하기">
			<input type="button" class="btn btn-light-primary" id="delBtn" value="예약 삭제하기">
			</div>
		</div>
		</form>
		</div>
	</div>
<%@include file="testModal.jsp" %>
<script>
	$(document).ready(function(){
		$('#selectAttend').click(function(){
			$('#testModal').modal('show');
			
			$('#tree2 a').click(function(){
				console.log($('#tree2 a').text());
				$('#addAttend').html("<input type='text' class='tree' name='subscriber' value='"+$(this).text()+"'>");
				$('.tree').click(function(){
					$(this).remove();
				});
				event.stopImmediatepropagation();
			});
		});
	});

</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
