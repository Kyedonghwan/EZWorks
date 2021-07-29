<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/fontawesome/all.min.css'/>">

<link rel="stylesheet"
	href="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/app.css'/>">
<link rel="shortcut icon"
	href="<c:url value='/resources/images/favicon.svg" type="image/x-icon'/>">

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
	$(function(){
		$.ajax({
			url:"<c:url value='/listCategory'/>",
			type:"get",
			dataType:"json",
			success:function(res){
				var list="";
					$.each(res, function(idx,item){
						list += "<li>"+"<input type='checkbox' class='form-check-input'checked id='cateChk'>"+"<label id='cateName'>"+
						item.schCateName+"</label>"
						+ "<input type='color' id='color' value='"+item.schColor+"'>"+"</li>";
					});
				
				console.log(list);
				$('.panel').append(list);
			},error:function(xhr, status, error){
				alert("에러");	
			}
		});
		
		
		$('#regBtn').click(function(){
			location.href="${pageContext.request.contextPath}/calendar/calRegister"
		});
		
		$('#addMyCal').click(function(){
			$('#insertMyCal').modal('show');
		});

		
	});
</script>
<style>
#cateChk {
	margin-top: 7px;
}

ul, li {
	list-style-type: none;
}

#cateName {
	width: 70%;
	text-align: left;
	padding: 5px 10px 0 10px;
	clear: left;
}

#color {
	width: 15%;
	height: 20px;
	border: 0px;
	border-radius: 10px;
}

#insertCateName{
	width:90%;
}


</style>
<div class="card-body" style="height: 600px;">
	<div id="area">
		<input type="button" class="btn btn-outline-secondary" id="regBtn"
			style="width: 200px; height: 50px" value="일정등록"><br> <BR>
		<span id="more"><span class="fa-fw select-all fas"></span></span> <span
			class="accordion"> 내 캘린더 </span>

		<ul class="panel" style="display: inline-block; width: 100%;">

		</ul>
		<ul>
			<li><span class="fa-fw select-all fas"></span> <span
				style="color: gray" id="addMyCal">내 캘린더 추가</span>
			<li>
		</ul>
		<hr>
		<span class="fa-fw select-all fas"></span> <span>캘린더 환경설정</span>
	</div>
	<div class="modal fade text-left" id="insertMyCal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true"
	data-bs-backdrop="false">
	<form name="insertMyCal" method="post"
		action="<c:url value='/calendar/sidebar2'/>">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content"
				style="width: 400px; height: 250px; box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, .2);">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel4">내 캘린더 추가</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" name="empNo" id="showEmpNo" value="1"> 
					<input
						type="text" id="insertCateName" class="form-control round"
						name="schCateName">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">취소</span>
					</button>
					<button type="submit" class="btn btn-primary ml-1"
						data-bs-dismiss="modal" id="cateInsertOk">
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block">확인</span>
					</button>
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<script
	src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>

<script src="<c:url value='/resources/js/main.js'/>"></script>