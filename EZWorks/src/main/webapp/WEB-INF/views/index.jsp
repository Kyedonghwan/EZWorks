<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예시 홈 화면입니다</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='resources/css/bootstrap.css'/>">

<link rel="stylesheet"
	href="<c:url value='resources/vendors/iconly/bold.css'/>">

<link rel="stylesheet"
	href="<c:url value='resources/vendors/perfect-scrollbar/perfect-scrollbar.css'/>">
<link rel="stylesheet"
	href="<c:url value='resources/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet" href="<c:url value='resources/css/app.css'/>">
<link rel="shortcut icon"
	href="<c:url value='resources/images/favicon.svg'/>"
	type="image/x-icon">
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
		<%-- <div id="sidebar" class="active">
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
					</ul>
				</div>
				
				
				<button class="sidebar-toggler btn x">
					<i data-feather="x"></i>
				</button>
			</div>
		</div> --%>
		<div id="main">
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
				<div>
					<section style="float:right;">
						<div class="검색검색">
							<select>
								<option>option1</option>
								<option>option2</option>
							</select>
							<input type="text" placeholder="검색하기">
						</div>
					</section>
				</div>
			</header>
		
		
			<div class="page-heading">
				<h3>메뉴에 따른 이름 설정해주기</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="col-12 col-lg-9">
						<div class="row">
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon purple">
													<i class="iconly-boldShow"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Profile Views</h6>
												<h6 class="font-extrabold mb-0">112.000</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon blue">
													<i class="iconly-boldProfile"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Followers</h6>
												<h6 class="font-extrabold mb-0">183.000</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon green">
													<i class="iconly-boldAdd-User"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Following</h6>
												<h6 class="font-extrabold mb-0">80.000</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6 col-lg-3 col-md-6">
								<div class="card">
									<div class="card-body px-3 py-4-5">
										<div class="row">
											<div class="col-md-4">
												<div class="stats-icon red">
													<i class="iconly-boldBookmark"></i>
												</div>
											</div>
											<div class="col-md-8">
												<h6 class="text-muted font-semibold">Saved Post</h6>
												<h6 class="font-extrabold mb-0">112</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>Profile Visit</h4>
									</div>
									<div class="card-body">
										<div id="chart-profile-visit"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 col-xl-4">
								<div class="card">
									<div class="card-header">
										<h4>Profile Visit</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-6">
												<div class="d-flex align-items-center">
													<svg class="bi text-primary" width="32" height="32"
														fill="blue" style="width: 10px">
                                                        <use
															xlink:href="<c:url value='resources/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill'/>" />
                                                    </svg>
													<h5 class="mb-0 ms-3">Europe</h5>
												</div>
											</div>
											<div class="col-6">
												<h5 class="mb-0">862</h5>
											</div>
											<div class="col-12">
												<div id="chart-europe"></div>
											</div>
										</div>
										<div class="row">
											<div class="col-6">
												<div class="d-flex align-items-center">
													<svg class="bi text-success" width="32" height="32"
														fill="blue" style="width: 10px">
                                                        <use
															xlink:href="<c:url value='resources/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill'/>" />
                                                    </svg>
													<h5 class="mb-0 ms-3">America</h5>
												</div>
											</div>
											<div class="col-6">
												<h5 class="mb-0">375</h5>
											</div>
											<div class="col-12">
												<div id="chart-america"></div>
											</div>
										</div>
										<div class="row">
											<div class="col-6">
												<div class="d-flex align-items-center">
													<svg class="bi text-danger" width="32" height="32"
														fill="blue" style="width: 10px">
                                                        <use
															xlink:href="<c:url value='resources/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill'/>" />
                                                    </svg>
													<h5 class="mb-0 ms-3">Indonesia</h5>
												</div>
											</div>
											<div class="col-6">
												<h5 class="mb-0">1025</h5>
											</div>
											<div class="col-12">
												<div id="chart-indonesia"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12 col-xl-8">
								<div class="card">
									<div class="card-header">
										<h4>Latest Comments</h4>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-hover table-lg">
												<thead>
													<tr>
														<th>Name</th>
														<th>Comment</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="col-3">
															<div class="d-flex align-items-center">
																<div class="avatar avatar-md">
																	<img
																		src="<c:url value='resources/images/faces/5.jpg'/>">
																</div>
																<p class="font-bold ms-3 mb-0">Si Cantik</p>
															</div>
														</td>
														<td class="col-auto">
															<p class=" mb-0">Congratulations on your graduation!</p>
														</td>
													</tr>
													<tr>
														<td class="col-3">
															<div class="d-flex align-items-center">
																<div class="avatar avatar-md">
																	<img
																		src="<c:url value='resources/images/faces/2.jpg'/>">
																</div>
																<p class="font-bold ms-3 mb-0">Si Ganteng</p>
															</div>
														</td>
														<td class="col-auto">
															<p class=" mb-0">Wow amazing design! Can you make
																another tutorial for this design?</p>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-3">
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
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<h4>Recent Messages</h4>
							</div>
							<div class="card-content pb-4">
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="<c:url value='resources/images/faces/4.jpg'/>">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">Hank Schrader</h5>
										<h6 class="text-muted mb-0">@johnducky</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="<c:url value='resources/images/faces/5.jpg'/>">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">Dean Winchester</h5>
										<h6 class="text-muted mb-0">@imdean</h6>
									</div>
								</div>
								<div class="recent-message d-flex px-4 py-3">
									<div class="avatar avatar-lg">
										<img src="<c:url value='resources/images/faces/1.jpg'/>">
									</div>
									<div class="name ms-4">
										<h5 class="mb-1">John Dodol</h5>
										<h6 class="text-muted mb-0">@dodoljohn</h6>
									</div>
								</div>
								<div class="px-4">
									<button
										class='btn btn-block btn-xl btn-light-primary font-bold mt-3'>Start
										Conversation</button>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<h4>Visitors Profile</h4>
							</div>
							<div class="card-body">
								<div id="chart-visitors-profile"></div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2021 &copy; Mazer</p>
					</div>
					<div class="float-end">
						<p>
							Crafted with <span class="text-danger"><i
								class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">A.
								Saugi</a>
						</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="<c:url value='resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script src="<c:url value='resources/js/bootstrap.bundle.min.js'/>"></script>

	<script
		src="<c:url value='resources/vendors/apexcharts/apexcharts.js'/>"></script>
	<script src="<c:url value='resources/js/pages/dashboard.js'/>"></script>

	<script src="<c:url value='resources/js/main.js'/>"></script>
</body>

</html>