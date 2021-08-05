<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
a{
color:black;
font-size:0.85em;
}
span.separator{
	color:#949599;
	font-size:0.85em;
	background-color:white;
}	

section.menus img{
	opacity: 0;
transition: opacity 0.3s
}
section.menus:hover img{
	opacity: 1;
}

</style>
<script>
	$(function(){
		$('.chevron-right').click(function(){
			if($(this).children('span').children('img').attr("class")=="fold"){
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-down.svg'/>");
				$(this).children('span').children('img').attr("class","unfold");
			}else{
				$(this).children('span').children('img').attr("src","<c:url value='/resources/images/accordion/chevron-right.svg'/>");
				$(this).children('span').children('img').attr("class","fold");
			}
		});
	})
</script>
<div id="wanttocal" style="margin:0px;padding:0px;height:100%;">
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a href="<c:url value='/report/reportMain'/>">보고</a>
	</h5>
</section>
<section class="menus">
	<div style="padding-right:10px;padding-left:10px">
		<ul style="list-style:none;padding:0px;margin:0px;">
			<li class="sidebar-item active has-sub">
				<p style="padding:0px 20px 0px 20px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 0px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right" style="font-weight:bold"><span>부서별 보고서</span></a>
				</p>
				<ul class="submenu active" style="list-style: none; padding:0px;">
					<li class="sidebar-item active has-sub">
					
					<p style="padding:0px 20px 0px 32px;position:relative;margin-bottom:0px" class="sidebar-link chevron-right">
					<span class="sidebar-link chevron-right" style="position:absolute;top: 0px;left: 12px;">
           			<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold"></span>
           			<a href="#" class="sidebar-link chevron-right"><span>영업본부 (파라미터로 자기 부서 들고 오기) <!-- require parameter(from emp) --></span></a>
					</p>
						<ul class="submenu active" style="list-style:none;padding:0px;margin:0px;padding-left:0px">
							<!-- forEach -->
							<li class="submenu-item"style="padding-left:44px">
								<a href="#">금일 보고드립니다</a>
							</li>
						</ul>
					</li>
					<li class="submenu-item" style="padding-left: 32px">
						<a href="#">하위 부서 보고서 조회</a>
					</li>
					<li class="submenu-item" style="padding-left: 32px">
						<a href="#">중지된 보고서</a>
					</li>
					<br>
					<li class="submenu-item" style="padding-left: 32px">
						<a href="#">+ 보고서 추가</a>
					</li>
						</ul>
					</li>
		</ul>
	</div>
</section>
</div>