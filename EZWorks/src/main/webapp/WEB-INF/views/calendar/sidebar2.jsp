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
						list += "<li>"+"<label id='cateName'>"+
						item.schCateName+"</label>"
						+ "<input disabled type='color' class='color' value='"+item.schColor+"'>"+"</li>";
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
		
		$('#calSet').click(function(){
			location.href="${pageContext.request.contextPath}/calendar/calSetting"
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

.color {
	width: 3rem;
    height: 2rem;
    padding: .5rem;
    background-color: transparent;
    border: 0;
    border-radius: 100%;
}

</style>
<div class="card-body" style="height: 600px;">
	<div id="area">
<%@ include file="cateModal.jsp" %>
		<p id="colorResult"></p>
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
		<span class="fa-fw select-all fas"></span> <span id="calSet">캘린더 환경설정</span>
	</div>
</div>
<script
	src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>

<script src="<c:url value='/resources/js/main.js'/>"></script>