<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						list += "<li>"+
						item.schCateName+"</li>"
						+ "<input type='color' id='color' value='"+item.schColor+"'>";
					});
				
				console.log(list);
				$('.panel').append(list);
			},error:function(xhr, status, error){
				alert("에러");	
			}
		});
	});
</script>
<style>
	#myLi{
		width: 20%
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
				<!-- <li>
					<div class="custom-control custom-checkbox" style="display: inline-block;">
                        <input type="checkbox" class="form-check-input form-check-primary form-check-glow" 
                        	name="customCheck" style="margin-right: 0px" id="customColorCheck6">
                        <label style="font-size: 1em" id="cateLabel"></label>
              		</div>	
				</li> -->
		</ul>
		<img src="<c:url value='/resources/images/accordion/plus.svg'/>">
		<span style="color: gray" id="addMyCal">내 캘린더 추가</span> <br> <br> 
		<span class="more">
		<img
			src="<c:url value='/resources/images/accordion/chevron-down.svg'/>"></span>
		
		
		<span class="accordion"> 관심 캘린더 </span>
		<ul class="panel1">
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