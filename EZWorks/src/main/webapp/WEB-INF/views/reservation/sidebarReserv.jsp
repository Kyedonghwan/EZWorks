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
		$('.spanReserv').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservCategory?rvNo="+$(this).children('input').val();
		});
		
		$('.spanReservDt').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservDtCategory?rvdNo="+$(this).children('input').val();
		});
	});
</script>
<style>
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
	padding-left:10px;
}
.title1{
	font-weight: bold;
}
</style>
<div class="card-body" style="height: 600px;">
	<div id="area">
		<section id="assetSide" class="lnb">
			<h1 class="company " data-id="10">
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
							</span></a>
						</p>
						<ul class="board-tree-nodes">
							<li class="classic" data-id="1" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="1" title="도 회의실(20명)"
										data-parent="2" data-bypass=""><ins class="ic"></ins>
										<span class="spanReservDt">
										<input type="hidden" class="inputReserv" value="1" style="width: 0px; height: 0px;">
										도 회의실(20명)
										</span></a>
								</p>
							</li>
							<li class="classic" data-id="2" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="2" title="레 회의실(8명)"
										data-parent="11" data-bypass=""><ins class="ic"></ins>
										<span class="spanReservDt">
										<input type="hidden" class="inputReserv" value="2" style="width: 0px; height: 0px;">
										레 회의실(8명)</span></a>
								</p>
							</li>
							<li class="classic" data-id="1" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="3" title="미 회의실(12명)"
										data-parent="11" data-bypass=""><ins class="ic"></ins>
										<span class="spanReservDt">
										<input type="hidden" class="inputReserv" value="3" style="width: 0px; height: 0px;">
										미 회의실(12명)</span></a>
								</p>
							</li>
							<li class="classic" data-id="1" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="4" title="데모1" data-parent="11"
										data-bypass=""><ins class="ic"></ins>
										<span class="spanReservDt">
										<input type="hidden" class="inputReserv" value="4" style="width: 0px; height: 0px;">
										데모1</span></a>
								</p>
							</li>
							<li class="classic" data-id="1" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="5" title="데모2" data-parent="11"
										data-bypass=""><ins class="ic"></ins>
										<span class="spanReservDt">
										<input type="hidden" class="inputReserv" value="5" style="width: 0px; height: 0px;">
										데모2</span></a>
								</p>
							</li>
						</ul>
					</li>
					<li class="classic" data-id="12" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="12" title="본사 6층 회의실" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="2" style="width: 0px; height: 0px;">
								본사 6층 회의실</span></a>
						</p>
						<ul class="board-tree-nodes">
							<li class="classic" data-id="17" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="17" title="01. LA Dodgers"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">01. LA Dodgers</span></a>
								</p>
							</li>
							<li class="classic" data-id="18" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="18" title="02. Cincinnati Reds"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">02. Cincinnati Reds</span></a>
								</p>
							</li>
							<li class="classic" data-id="19" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="19" title="03. NY Yankees"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">03. NY Yankees</span></a>
								</p>
							</li>
							<li class="classic" data-id="20" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="20" title="04. Boston RedSox"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">04. Boston RedSox</span></a>
								</p>
							</li>
							<li class="classic" data-id="21" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="21" title="05. SF Giants"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">05. SF Giants</span></a>
								</p>
							</li>
							<li class="classic" data-id="22" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="22" title="06. Chicago Cubs"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">06. Chicago Cubs</span></a>
								</p>
							</li>
							<li class="classic" data-id="23" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="23" title="07. Texas Rangers"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">07. Texas Rangers</span></a>
								</p>
							</li>
							<li class="classic" data-id="24" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="24" title="08. San Diego Padres"
										data-parent="12" data-bypass=""><ins class="ic"></ins><span
										class=" ">08. San Diego Padres</span></a>
								</p>
							</li>
							</ul>
					</li>
					<li class="classic" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="50" title="빔프로젝터" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="3" style="width: 0px; height: 0px;">
								빔프로젝터</span></a>
						</p>
						<ul class="board-tree-nodes">
							<li class="classic" data-id="130" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="130" title="1번 프로젝터"
										data-parent="50" data-bypass=""><ins class="ic"></ins><span
										class=" ">1번 프로젝터</span></a>
								</p>
							</li>
							<li class="classic" data-id="131" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="131" title="2번 프로젝터"
										data-parent="50" data-bypass=""><ins class="ic"></ins><span
										class=" ">2번 프로젝터</span></a>
								</p>
							</li>
						</ul>
					</li>
					<li class="classic" data-id="51" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="50" title="차량예약" data-parent=""
								data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="4" style="width: 0px; height: 0px;">
								차량예약</span></a>
						</p>
					</li>
					<li class="classic" data-id="52" data-type="false">
						<p class="title1">
							<span class="fa-fw select-all fas"></span>  <a
								class="go_boards" data-id="52" title="재화스퀘어 3층 회의실"
								data-parent="" data-bypass=""><ins class="ic"></ins>
								<span class="spanReserv">
								<input type="hidden" class="inputReserv" value="5" style="width: 0px; height: 0px;">
								재화스퀘어 3층 회의실</span></a>
						</p>
						<ul class="board-tree-nodes">
							<li class="classic" data-id="137" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="137" title="02. MINT"
										data-parent="52" data-bypass=""><ins class="ic"></ins><span
										class=" ">02. MINT</span></a>
								</p>
							</li>
							<li class="classic" data-id="138" data-type="false">
								<p class="title">
									<a class="go_boards" data-id="138" title="03. BLUE"
										data-parent="52" data-bypass=""><ins class="ic"></ins><span
										class=" ">03. BLUE</span></a>
								</p>
							</li>
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