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
<script>
	$(function(){
		var bool=true;
		
		$('.classic').click(function(){
			$(this).children('ul').slideToggle('fast');
		});
		
		$('.spanReserv').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservCategory?rvNo="+$(this).children('input').val();
		});
		
		$('.setting').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservSetting?rvNo="+$(this).siblings().children('input').val();
		});
		
		
		$.ajax({
			url:"<c:url value='/sidebarList'/>",
			type:"get",
			dataType:"json",
			success:function(res){
				var list="";
				$.each(res, function(idx,item){
					list= "<li class='classic'>"+"<p class='title'>"+"<a class='go_boards'>"
						+"<span class='spanReservDt'>"
						+"<input type='hidden' class='inputReserv' value='"+item.rvdNo+"' style='width: 0px; height: 0px;'>"
						+item.rvdName+"</span></a></p></li>";
				
				if(item.rvdCate==1){
					$('.span1').append(list);
				}else if(item.rvdCate==2){
					$('.span2').append(list);
				}else if(item.rvdCate==3){
					$('.span3').append(list);
				}else if(item.rvdCate==5){
					$('.span5').append(list);
				}
				});
				$('.spanReservDt').click(function(){
					location.href="${pageContext.request.contextPath}/reservation/reservDtCategory?rvdNo="+$(this).children('input').val();
				});
			},error:function(){
				alert("error");
			}
		});
		
	});
</script>
<style>
ul.side_depth li p.on > a > span.txt, ul.side_depth li p.on > a > span.contactTag, section.lnb ul.side_depth li p.on:hover > a > span.txt {
    display: inline-block;
    color: #00a1b9;
    font-weight: bold;
    font-weight: 500;
}
body, input, textarea, select {
    font-size: 14px;
    font-family: 'Noto Sans KR',맑은 고딕,돋움, malgun gothic, dotum,AppleGothic,Helvetica,sans-serif;
    color: #333;
}
.go_body .go_side {
    width: 249px;
    padding-bottom: 55px;
    float: left;
}
.go_side section.gnb_title+section.lnb {
    border-top: none;
}
.go_side > section {
    padding: 4px 0px;
}
.lnb h1 {
    position: relative;
    padding: 4px 24px 4px 10px;
    min-height: 19px;
    font-size: 19px;
    color: #333333;
    vertical-align: middle;
}
a{
   color: #333333;
}
ul li{
	list-style: none;
	padding: 0
}
.side_depth{
	padding-left:1px;
}
.title1{
	font-weight: bold;
}
.txt {
    font-size: 22px;
    font-weight: normal;
    letter-spacing: -1px;
}
</style>
	<div id="area">
	
	<div class="card-header">
		<header class="content_top">
		<h1>
			<span class="txt"><a href="<c:url value='/reservation/reservMain'/>">예약</a></span>
		</h1>
		</header>
	</div>
	<div class="card-body" style="height: 600px;width: 104%">
		<section id="assetSide" class="lnb">
			<h1 class="company" data-id="10">
				<span class="fa-fw select-all fas"></span> <a
					data-role="button" data-bypass="">전사자산</a>
			</h1>
			<ul class="side_depth">
				<ul class="board-tree-nodes">
					<li class="classic" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span> 
							<a class="go_boards" data-id="2" title="본사 1층 회의실" data-parent="" data-bypass="">
							<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="1" style="width: 0px; height: 0px;">
										본사 1층 회의실
							</span>
							<img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>" style="float:right;margin-top: 3px" class="setting">
							</a>
						</p>
						<ul class="board-tree-nodes">
							<span class="span1"></span>
						</ul>
					</li>
					<li class="classic" data-id="12" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="12" title="본사 6층 회의실" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="2" style="width: 0px; height: 0px;">
								본사 6층 회의실</span>
								<img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>"style="float:right;margin-top: 3px" class="setting">
								</a>
						</p>
						<ul class="board-tree-nodes">
							<span class="span2"></span>
						</ul>
					</li>
					<li class="classic" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="50" title="빔프로젝터" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="3" style="width: 0px; height: 0px;">
								빔프로젝터</span>
								<img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>"style="float:right;margin-top: 3px" class="setting">
								</a>
						</p>
						<ul class="board-tree-nodes">
							<span class="span3"></span>
						</ul>
					</li>
					<li class="classic" data-id="51" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="50" title="차량예약" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="4" style="width: 0px; height: 0px;">
								차량예약</span>
								<img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>"style="float:right;margin-top: 3px" class="setting">
								</a>
						</p>
					</li>
					<li class="classic" data-id="52" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="52" title="재화스퀘어 3층 회의실"
								data-parent="" data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="5" style="width: 0px; height: 0px;">
								재화스퀘어 3층 회의실</span>
								<img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>"style="float:right;margin-top: 3px" class="setting">
								</a>
						</p>
						<ul class="board-tree-nodes">
							<span class="span5"></span>
						</ul>
					</li>
				</ul>
			</ul>
		</section>
	</div>
</div>
<script
	src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>

<script src="<c:url value='/resources/js/main.js'/>"></script>