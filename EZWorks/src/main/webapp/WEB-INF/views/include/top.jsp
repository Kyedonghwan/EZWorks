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
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='resources/css/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='resources/vendors/iconly/bold.css'/>">
<link rel="stylesheet" href="<c:url value='resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet" href="<c:url value='resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='resources/css/app.css'/>">
<link rel="shortcut icon" href="<c:url value='resources/images/favicon.svg'/>" type="image/x-icon">
</head>

<body>
	<div id="app">
		<div class="header">
			<header>
				<div id="sidebar" class="active">
			<div class="sidebar-wrapper active">
				<div class="sidebar-header">
					<div class="d-flex justify-content-between">
						<div class="logo">
							<a href="index.html"><img
								src="resources/images/logo/logo.png" alt="Logo" srcset=""></a>
						</div>
						<div class="toggler">
							<a href="#" class="sidebar-hide d-xl-none d-block"><i
								class="bi bi-x bi-middle"></i></a>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-body py-4 px-5">
						<div class="d-flex align-items-center">
							<div class="avatar avatar-xl">
								<img src="<c:url value='resources/images/faces/1.jpg'/>"
									alt="Face 1">
							</div>
							<div class="ms-3 name">
								<h5 class="font-bold">John Duck</h5>
								<h6 class="text-muted mb-0">@johnducky</h6>
							</div>
						</div>
						<hr>
						<div class="d-flex align-items-center">
							<div class="ms-2 name">
								<ul>
									<li>
										<label>오늘 온 메일</label><span style="display:inline-block;float:right">1</span>
									</li>
									<li>
										<label>오늘의 일정</label><span style="align:right">1</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="sidebar-menu">
					<ul class="menu">

						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>홈</span>
						</a></li>

						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>전자결재</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>근태관리</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>캘린더</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>메일</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>게시판</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>커뮤니티</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>문서관리</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>자원예약</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>주소록</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>보고</span>
						</a></li>
						
						<li class="sidebar-item  "><a href="table.html"
							class='sidebar-link'> <i class="bi bi-grid-1x2-fill"></i> <span>설문</span>
						</a></li>
						<hr>
			
							<li class="sidebar-item ">
								<div class="btn-group dropup mb-1">
                                            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                조직도
                                            </button>
                                            <div class="dropdown-menu" style="margin: 0px;">
                                                <form class="px-2 py-2">
                                                    <div class="form-group">
                                                        <label for="exampleDropdownFormEmail1">Email address</label>
                                                        <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleDropdownFormPassword1">Password</label>
                                                        <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="checkbox">
                                                            <input type="checkbox" class="checkbox-input" id="dropdownCheck1">
                                                            <label for="dropdownCheck1">Remember me</label>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Sign in</button>
                                                </form>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">include로 조직도 넣을 공간</a>
                                                <a class="dropdown-item" href="#">Forgot password?</a>
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
			</header>
			<section>
				<button value= "button1"></button>
			</section>
		</div>
		
<!--    sidebar 부분 끝    -->
