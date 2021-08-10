<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예시 홈 화면입니다</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/iconly/bold.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/app.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/tree.css'/>">
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<!-- <script>
        $(document).ready(function(){
            var target = $("#sidebar");
            
            // 사이드바 외부를 클릭하면 사이드바 닫힘
            $(document).mouseup(function (e){
                if(target.has(e.target).length==0) {
                    target.hide();
                    target.removeClass('emphasized');
                } 
            });
        });
    </script> -->
</head>

<body style="min-width:1260px;background-color:white">
	<div id="app" style="height:100vh;bottom=0;">
	
		<div id="sidebar" class="active" style="background-color:white">
			<div class="sidebar-wrapper active" style="background-color:#dce7f1;">
				<div class="sidebar-header">
					<div class="d-flex justify-content-between">
						<div class="logo">
							<a href="<c:url value='/'/>"><img
								src="<c:url value='/resources/images/logo/MainLogo.png'/>"
								alt="Logo" srcset=""></a>
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu">

						<li class="sidebar-item  "><a href="<c:url value='/'/>"
							class='sidebar-link'> <i class="bi bi-house"></i> <span>홈</span>
						</a></li>

						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-clipboard-check"></i> <span>전자결재</span>
						</a></li>

						<li class="sidebar-item  "><a href="<c:url value='/attendance/attendanceMain'/>"
							class='sidebar-link'> <i class="bi bi-stopwatch"></i> <span>근태관리</span>
						</a></li>

						<li class="sidebar-item  "><a href="<c:url value='/calendar/calendarMain'/>"
							class='sidebar-link'> <i class="bi bi-calendar-event"></i> <span>캘린더</span>
						</a></li>

						<li class="sidebar-item  "><a href="<c:url value='/board/boardMain'/>"
							class='sidebar-link'> <i class="bi bi-pencil-square"></i> <span>게시판</span>
						</a></li>

						<li class="sidebar-item  ">
							<a href="<c:url value='/community/communityMain'/>" class='sidebar-link'> 
							<i class="bi bi-people-fill"></i> <span>커뮤니티</span>
						</a></li>

						<li class="sidebar-item  "><a href="<c:url value='/reservation/reservMain'/>"
							class='sidebar-link'> <i class="bi bi-journal-bookmark-fill"></i> <span>자원예약</span>
						</a></li>


						<li class="sidebar-item  "><a href="<c:url value='/addrbook/coAddrbook'/>"
							class='sidebar-link'> <i class="bi bi-person-lines-fill"></i> <span>주소록</span>
						</a></li>

						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-folder2-open"></i> <span>자료실</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="<c:url value='/message/messageList'/>"
							class='sidebar-link'> <i class="bi bi-chat-dots"></i> <span>쪽지/채팅</span>
						</a></li>
						
						<li class="sidebar-item">
							<div class="btn-group dropup mb-1" aria-orirentation="vertical">
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"><i class="bi bi-diagram-3"></i> 조직도</button>
								<div class="dropdown-menu" id="organizationDropdown" style="margin: 0px; border-radius:10px">
									<input type="email" class="form-control" style="width: 95%;margin-left: 5px;"
												id="searchOrgan" placeholder="이름/아이디/부서/전화번호">
									<div class="dropdown-divider" style="border-color: #abd8ff;"></div>
									<!-- <a class="dropdown-item" href="#">include로 조직도 넣을 공간</a> <a
										class="dropdown-item" href="#">Forgot password?</a>-->
									<div>
										<div id="tree" class="overflow-auto" style="height:330px;margin: 5px;border: 1px solid #eaf1f7;border-radius: 5px;">
    									</div>
									</div>
								</div>
							</div>
						</li>

					</ul>
				</div>


				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div>

		<!--    sidebar 부분 끝    -->

		<!--    main 시작    -->
		<div id="main" class="layout-navbar" style="height:100vh;bottom=0;">
			<header style="display:flex;flex-direction:column;">
				<nav class="navbar navbar-expand navbar-light " style="background-color:white;">
					<div class="container-fluid">
						<div>
							<a href="#" class="burger-btn d-block"> <i
								class="bi bi-justify fs-3"></i>
							</a>

							<button class="navbar-toggler" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">

						</div>
						
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li class="nav-item dropdown me-1"><a
								class="nav-link active dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="bi bi-envelope bi-sub fs-4 text-gray-600"></i>
							</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="dropdownMenuButton">
									<li>
										<h6 class="dropdown-header">Mail</h6>
									</li>
									<li><a class="dropdown-item" href="#">No new mail</a></li>
								</ul></li>
							<li class="nav-item dropdown me-3"><a
								class="nav-link active dropdown-toggle" href="#"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="bi bi-bell bi-sub fs-4 text-gray-600"></i>
							</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="dropdownMenuButton">
									<li>
										<h6 class="dropdown-header">Notifications</h6>
									</li>
									<li><a class="dropdown-item">No notification available</a></li>
								</ul></li>
						</ul>
						<div class="dropdown">
							<a href="#" data-bs-toggle="dropdown" aria-expanded="false">
								<div class="user-menu d-flex">
									<div class="user-name text-end me-3">
										<h6 class="mb-0 text-gray-600">${empVo.empName }</h6>
										<p class="mb-0 text-sm text-gray-600">${empVo.posName }</p>
									</div>
									<div class="user-img d-flex align-items-center">
										<div class="avatar avatar-md">
											<img src="<c:url value='/resources/images/faces/${empVo.empImg }'/>">
										</div>
									</div>
								</div>
							</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item" href="<c:url value='/logout'/>"><i
										class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</header>
			<%@ include file="organization.jsp" %>
			<!-- 헤더 끝 -->
			<div class="page-content" style="bottom:0;align-content:stretch;min-height:auto;background:white;border-top:1px solid #dfe3e7;border-collapse: collapse;">
				<section style="bottom:0;padding:0px;margin:0px;min-height:auto;">
					<div style="bottom:0;width: 100%; min-height: auto;">
						<div style="width: 249px; min-height: auto; float: left;bottom:0;">