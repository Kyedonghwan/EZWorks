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
    		  icon: 'warning',
    		  showCancelButton: true,
    		  confirmButtonColor: '#4374D9',
    		  cancelButtonColor: '#EAEAEA',
    		  confirmButtonText: '삭제'
    		}).then((result) => {
    		  if (result.isConfirmed) {
	    		      $.ajax({
	    				type:"get",
	    				url:"<c:url value='/calendar/deleteCal'/>",
	    		
	    				success:function(){
	    					location.href="<c:url value='/calendar/calendarMain'/>";
	    				}
	    			});
    		  }
    		});
    });
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
			<p style="font-size: 1.2em">/</p>
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schStartTime}</p>
			&nbsp;
			<label for="to" style="font-size: 1.2em">~</label> 
			&nbsp;
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schEnd}</p>
			<p style="font-size: 1.2em">/</p>
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schEndTime}</p>
				&nbsp;&nbsp;
                    <div class="custom-control custom-checkbox" style="display: inline-block;">
                        <input type="checkbox" class="form-check-input form-check-primary form-check-glow" 
                        	name="customCheck" style="margin-right: 0px" id="customColorCheck6">
                        <label style="font-size: 1em">종일</label>
                    </div>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">전사일정</label> 
			 <div class="custom-control custom-checkbox" style="display: inline-block;">
                        <input type="checkbox" class="form-check-input form-check-primary form-check-glow" 
                        	name="customCheck" style="margin-right: 0px" id="customColorCheck6">
                        <label style="font-size: 1em">전사일정</label>
              </div>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내 캘린더</label> 
			<select class="form-select" name="schCate"
				id="basicSelect">
			<c:forEach var="vo" items="${list }">
				<option value="${vo.schCateNo }">${vo.schCateName }</option>
			</c:forEach>
			</select>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">참석자</label> 
			<img src="<c:url value='/resources/images/accordion/plus.svg'/>"> 
			<span>참석자선택</span>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">외부참석자</label> 
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schExtAttend}</p>
			<input type="button" class="btn btn-outline-primary" style="width:50px;height:30px; padding:3px 6px" value="추가">
		</div>
		<div class="registerDiv">
			<label class="writeLabel">장소</label> 
			<p class="form-control-static" id="staticInput" style="font-size: 1.2em">${vo.schPlace}</p>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="10" name="schContent" value="${vo.schContent }">
			</textarea>
		</div>
		<div class="registerDiv">
			<label class="writeLabel">예약하기</label>
			<div>
				<span>본사 1층 회의실</span>
			</div>
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