<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>

<!--sweetalert2-->
<link rel="stylesheet" href="sweetalert2.min.css">


<script type="text/javascript">
$(document).ready(function () {
	
    $('#reg_ok').click(function(){
    	location.href="<c:url value='/calendar/calendarMain'/>";
    });
    
    $('#editBtn').click(function(){
    	location.href="${pageContext.request.contextPath}/calendar/calEdit?schNo="+$('#schNo').val();
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
	    				url:"<c:url value='/calendar/deleteCal'/>",
	    				data: "schNo="+$('#schNo').val(),
	    				success:function(){
	    					location.href="<c:url value='/calendar/calendarMain'/>";
	    				}
	    			});
    		  }
    		});
    });
    
    if($('#cfSchAll').val()=="Y"){
    	$('.hide').hide();
    }
});
</script>
<style>

p{
	font-size: 0.5em;
	display: inline-block;
}

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

#startDate, #endDate, #startTime, #endTime {
	width: 12%;
	height: 30px;
	margin: 5px 0 10px 0;
	display: inline-block;
	border: 1px solid #CFCFCF;
}

#title {
	width: 70%;
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
#disabledInput{
	width: 30%;
	background-color: white;
	border: none;
}
</style>

<%@ include file="sidebar2.jsp" %>
<%@ include file="../include/middle.jsp"%>
<div class="card-header" style="border-left: 1px solid #BDBDBD">
	<h4>일정상세</h4>
</div>
<div class="card-body" style="height: 100%;border-left: 1px solid #BDBDBD">
	<form name="regFrm">
		<input type="hidden" value="${param.schNo}" name="schNo" id="schNo">
		<div class="registerDiv">
          <p class="form-control-static" id="staticInput" style="font-size: 1.7em">${vo.schTitle }</p>
		</div>
		<div class="registerDiv">
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schStart}</p>
			<p style="font-size: 1.2em" class="hide">/</p>
			<p class="form-control-static hide" id="staticInput" style="font-size: 1.2em">${vo.schStartTime}</p>
			&nbsp;
			<label for="to" style="font-size: 1.2em">~</label> 
			&nbsp;
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schEnd}</p>
			<p style="font-size: 1.2em" class="hide">/</p>
			<p class="form-control-static hide" id="staticInput" style="font-size: 1.2em">${vo.schEndTime}</p>
				&nbsp;&nbsp;
                    <div class="custom-control custom-checkbox" style="display: inline-block;">
                       <input type="hidden" name="schAll" id="cfSchAll" value="${vo.schAll }">
                    </div>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">분류</label> 
			<input type="text" class="form-control round" 
				value="${vo2.schCateName }" disabled id="disabledInput">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">참석자</label> 
			<input type="text" class="form-control round" value="${vo.schAttend }" disabled id="disabledInput">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">외부참석자</label> 
			<input type="text" class="form-control round" value="${vo.schExtAttend }" disabled id="disabledInput">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">장소</label> 
			<input type="text" class="form-control round" value="${vo.schPlace }" disabled id="disabledInput">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내용</label>
			<textarea disabled class="form-control" id="exampleFormControlTextarea1"
				rows="10" name="schContent" style="background-color: white" >${vo.schContent }
			</textarea>
		</div>
		<div style="text-align: center" class="registerDiv">
			<input type="button" class="btn btn-primary ml-1" id="reg_ok" value="캘린더로 돌아가기">
			<input type="button" class="btn btn-light-primary" id="editBtn" value="일정수정하기">
			<input type="button" class="btn btn-light-primary" id="delBtn" value="일정삭제하기">
		</div>
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<%@ include file="../include/bottom.jsp"%>