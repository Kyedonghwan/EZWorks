<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

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
<link rel="stylesheet" href="<c:url value='/resources/css/attendance/attendanceMenu.css'/>">
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/moment.min.js'/>"></script>

<script>
$(function(){
	const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
	function changeDate() {
		const moment_ = moment(); //시간받기위해서 new date
		document.getElementById("timer").innerHTML = moment_.format('HH:mm:ss');
		const date = moment_.format('YYYY-MM-DD');
		const weekDayName = daysOfWeek[moment_.day()]
		document.getElementById("date").innerHTML = date + "(" + weekDayName + ")";
	}
	function time() {
		setInterval(changeDate, 1000); //1초 지난후 time()실행
	}
		time();
	
});
function workIn(){
	const workIn_moment = moment();
	const workInHour = workIn_moment.format("HH:mm:ss");
	const button = document.getElementById('workIn');
	const attendanceStatus = '출근';
	const attendanceRecordedTime = workIn_moment.format('YYYY-MM-DD HH:mm:ss');
	console.info(workIn_moment);
	if(button.classList.contains('off')){
		return false;
	}else{
		alert('여기로 넘어옴');
		$('#workInTime').html(workInHour);
		document.getElementById('workIn').classList.add("off");
		/* ajax 추가 */
		$.ajax({
			url:'<c:url value="/attendance/insert_workIn"/>'
			,type:"post"
			,data:{
				"attendanceStatus": attendanceStatus,
				"record": attendanceRecordedTime
			}
			,dataType:"json"
			,success:function(attendanceVo){ 
				alert('됨');
				console.info(attendanceVo);
			},
			error:function(xhr, status, error){
				alert("error 발생! " + error);
			}	
		});
	}
}
function workOut(){
	const workOut_moment = moment();
	const workOutHour = workOut_moment.format("HH:mm:ss");
	const button = document.getElementById('workOut');
	const attendanceStatus = '퇴근';
	const attendanceRecordedTime = workOut_moment.format('YYYY-MM-DD HH:mm:ss');
	if(button.classList.contains('off')){
		return false;
	}else{
		$('#workOutTime').html(workOutHour);
		document.getElementById('workOut').classList.add("off");
		/* ajax 추가 */
		$.ajax({
			url:'<c:url value="/attendance/insert_workOut"/>'
			,type:"post"
			,data:{
				"attendanceStatus": attendanceStatus,
				"record": attendanceRecordedTime
			}
			,dataType:"json"
			,success:function(attendanceVo){ 
			},
			error:function(xhr, status, error){
			}	
		});
	}
}
</script>
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

						<li class="sidebar-item  "><a href="table.html"
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
		<div id="main" class="layout-navbar" style="height:100vh;bottom:0;background-color:#eef1f6;">
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
										<p class="mb-0 text-sm text-gray-600">Administrator</p>
									</div>
									<div class="user-img d-flex align-items-center">
										<div class="avatar avatar-md">
											<img src="<c:url value='/resources/empImages/${empVo.empImg }'/>">
										</div>
									</div>
								</div>
							</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuButton">
								<li><a class="dropdown-item" href="#"><i
										class="icon-mid bi bi-box-arrow-left me-2"></i> Logout</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</header>
			<%@ include file="include/organization.jsp" %>
			<!-- 헤더 끝 -->
			<div class="page-content" style="bottom:0;align-content:stretch;min-height:auto;background:white;border-top:1px solid #dfe3e7;border-collapse: collapse;">
				<section style="bottom:0;padding:0px;margin:0px;min-height:auto;">
					<div style="bottom:0;width: 100%; min-height: auto;background-color:#eef1f6;min-height:calc(100vh - 90px);padding:0px 30px 0px 30px">
						
						<span>내용물 넣어보셈</span>
						<div class="row">
                        <div class="col-xl-4 col-md-6 col-sm-12">
                            <div class="card">
                                <div class="card-content">
										<div class="card-body">
											<p class="date" id="date"></p>
											<p class="time" id="timer"></p>
											<div class="log_view_wrap">
												<ul class="log_view">
													<li>
														<dl>
															<dt>출근시간</dt>
															<dd id="workInTime">
																<c:if test="${!empty attendedTime}">
																	<fmt:formatDate
																		value="${attendedTime.attendanceRecordedTime }"
																		pattern="HH:mm:ss" />
																</c:if>
																<c:if test="${empty attendedTime }">미등록</c:if>
															</dd>

														</dl>
													</li>
													<li>
														<dl>
															<dt>퇴근시간</dt>
															<dd id="workOutTime">
																<c:if test="${!empty endedTime}">
																	<fmt:formatDate
																		value="${endedTime.attendanceRecordedTime }"
																		pattern="HH:mm:ss" />
																</c:if>
																<c:if test="${empty endedTime }">미등록</c:if>
															</dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>주간 누적 근무시간</dt>
															<dd id="weeklyTotalTime">27h 0m 0s</dd>
														</dl>
													</li>
												</ul>
											</div>

											<div class="vertical_bar"></div>

											<div class="function_btn_wrap">
												<a
													class="btn btn-outline-primary <c:if test="${!empty attendedTime}">off</c:if>"
													id="workIn"><span class="txt">출근하기</span></a>
												<!--btn이 두개일 경우 멀티 클래스 적용 btn_function_s-->
												<a
													class="btn btn-outline-primary <c:if test="${!empty endedTime }">off</c:if>"
													id="workOut"><span class="txt">퇴근하기</span></a>
											</div>
											<div class="dropdown works_state">
												<a class="btn btn-outline-primary" id="changeStatus"
													data-bs-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false"> <!--클릭 시, 클래스명 on 추가--> <span
													class="txt">업무&nbsp;&nbsp;<span
														class="fa-fw select-all fas"></span></span>
												</a>

												<div class="dropdown-menu">
													<ul class="submenu-list" id="statusList"
														style="max-height: 200px; overflow-y: auto;">
														<li class="timelineStatus"><span class="txt "
															data-code="3">업무</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="4">업무종료</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="5">외근</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="6">출장</span></li>
														<li class="timelineStatus"><span class="txt "
															data-code="30">반차</span></li>
													</ul>
												</div>
											</div>
											<div class="vertical_bar"></div>
										</div>
										
                                </div>
                            </div>
                            <div class="card collapse-icon accordion-icon-rotate">
                                <div class="card-header">
                                    <h1 class="card-title pl-1">Accordion</h1>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="accordion" id="cardAccordion">
                                            <div class="card">
                                                <div class="card-header" id="headingOne" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseOne" aria-expanded="false"
                                                    aria-controls="collapseOne" role="button">
                                                    <span class="collapsed collapse-title">Accordion Item 1</span>
                                                </div>
                                                <div id="collapseOne" class="collapse pt-1" aria-labelledby="headingOne"
                                                    data-parent="#cardAccordion">
                                                    <div class="card-body">
                                                        Cheesecake muffin cupcake dragée lemon drops tiramisu cake
                                                        gummies chocolate
                                                        cake. Marshmallow tart
                                                        croissant. Tart dessert tiramisu marzipan lollipop lemon drops.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card collapse-header">
                                                <div class="card-header" id="headingTwo" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseTwo" aria-expanded="false"
                                                    aria-controls="collapseTwo" role="button">
                                                    <span class="collapsed collapse-title">Accordion Item 2</span>
                                                </div>
                                                <div id="collapseTwo" class="collapse pt-1" aria-labelledby="headingTwo"
                                                    data-parent="#cardAccordion">
                                                    <div class="card-body">
                                                        Pastry pudding cookie toffee bonbon jujubes jujubes powder
                                                        topping. Jelly
                                                        beans
                                                        gummi bears sweet
                                                        roll bonbon muffin liquorice. Wafer lollipop sesame snaps.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card open">
                                                <div class="card-header" id="headingThree" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseThree" aria-expanded="true"
                                                    aria-controls="collapseThree" role="button">
                                                    <span class="collapsed collapse-title">Accordion Item 3</span>
                                                </div>
                                                <div id="collapseThree" class="collapse show pt-1"
                                                    aria-labelledby="headingThree" data-parent="#cardAccordion">
                                                    <div class="card-body">
                                                        Sweet pie candy jelly. Sesame snaps biscuit sugar plum. Sweet
                                                        roll topping
                                                        fruitcake. Caramels
                                                        liquorice biscuit ice cream fruitcake cotton candy tart.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card">
                                                <div class="card-header" id="headingFour" data-bs-toggle="collapse"
                                                    data-bs-target="#collapseFour" aria-expanded="false"
                                                    aria-controls="collapseFour" role="button">
                                                    <span class="collapsed  collapse-title">Accordion Item 4</span>
                                                </div>
                                                <div id="collapseFour" class="collapse pt-1"
                                                    aria-labelledby="headingFour" data-parent="#cardAccordion">
                                                    <div class="card-body">
                                                        Sweet pie candy jelly. Sesame snaps biscuit sugar plum. Sweet
                                                        roll topping
                                                        fruitcake. Caramels
                                                        liquorice biscuit ice cream fruitcake cotton candy tart.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <img src="assets/images/samples/motorcycle.jpg" class="card-img-top img-fluid"
                                        alt="singleminded">
                                    <div class="card-body">
                                        <h5 class="card-title">Be Single Minded</h5>
                                        <p class="card-text">
                                            Chocolate sesame snaps apple pie danish cupcake sweet roll jujubes
                                            tiramisu.Gummies
                                            bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet roll.
                                        </p>
                                    </div>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Cras justo odio</li>
                                    <li class="list-group-item">Dapibus ac facilisis in</li>
                                    <li class="list-group-item">Vestibulum at eros</li>
                                </ul>
                            </div>
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title mb-0">Video Card</h4>
                                    </div>
                                    <div class="embed-responsive embed-responsive-item embed-responsive-16by9 w-100">
                                        <iframe src="https://www.youtube.com/embed/Pw9QB7Zp3iU" style="width:100%"
                                            height="300" allowfullscreen></iframe>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            Candy cupcake sugar plum oat cake wafer marzipan jujubes.
                                            Jelly-o sesame snaps cheesecake topping. Cupcake fruitcake macaroon donut
                                            pastry gummies
                                            tiramisu
                                            chocolate bar muffin.
                                        </p>
                                        <a href="#" class="card-link">Card link</a>
                                        <a href="#" class="card-link">Another link</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title">Carousel</h4>
                                        <h6 class="card-subtitle">Support card subtitle</h6>
                                    </div>
                                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="assets/images/samples/architecture1.jpg" class="d-block w-100"
                                                    alt="Image Architecture">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/images/samples/bg-mountain.jpg" class="d-block w-100"
                                                    alt="Image Mountain">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/images/samples/jump.jpg" class="d-block w-100"
                                                    alt="Image Jump">
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                            data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                            data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt assumenda
                                            mollitia
                                            officia dolorum eius quasi.Chocolate sesame snaps apple pie danish cupcake
                                            sweet roll
                                            jujubes tiramisu.
                                        </p>
                                        <p class="card-text">
                                            Gummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet
                                            roll. Toffee
                                            sugar
                                            plum sugar
                                            plum jelly-o jujubes bonbon dessert carrot cake.
                                            Sweet pie candy jelly. Sesame snaps biscuit sugar plum. Sweet roll topping
                                            fruitcake.
                                            Caramels liquorice
                                            biscuit ice cream fruitcake cotton candy tart.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title">Feedback Form</h4>
                                        <p class="card-text">
                                            Gummies bonbon apple pie fruitcake icing biscuit apple pie jelly-o sweet
                                            roll. Toffee
                                            sugar
                                            plum sugar
                                            plum jelly-o jujubes bonbon dessert carrot cake.
                                        </p>
                                        <form class="form" method="post">
                                            <div class="form-body">
                                                <div class="form-group">
                                                    <label for="feedback1" class="sr-only">Name</label>
                                                    <input type="text" id="feedback1" class="form-control"
                                                        placeholder="Name" name="name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="feedback4" class="sr-only">Last Game</label>
                                                    <input type="text" id="feedback4" class="form-control"
                                                        placeholder="Last Name" name="LastName">
                                                </div>
                                                <div class="form-group">
                                                    <label for="feedback2" class="sr-only">Email</label>
                                                    <input type="email" id="feedback2" class="form-control"
                                                        placeholder="Email" name="email">
                                                </div>
                                                <div class="form-group">
                                                    <select name="reason" class="form-control">
                                                        <option value="Inquiry">Inquiry</option>
                                                        <option value="Complain">complaints</option>
                                                        <option value="Quotation">Quotation</option>
                                                    </select>
                                                </div>
                                                <div class="form-group form-label-group">
                                                    <textarea class="form-control" id="label-textarea" rows="3"
                                                        placeholder="Suggestion"></textarea>
                                                    <label for="label-textarea"></label>
                                                </div>
                                            </div>
                                            <div class="form-actions d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary me-1">Submit</button>
                                                <button type="reset" class="btn btn-light-primary">Cancel</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <img class="card-img-top img-fluid" src="assets/images/samples/origami.jpg"
                                        alt="Card image cap" style="height: 20rem" />
                                    <div class="card-body">
                                        <h4 class="card-title">Top Image Cap</h4>
                                        <p class="card-text">
                                            Jelly-o sesame snaps cheesecake topping. Cupcake fruitcake macaroon donut
                                            pastry gummies tiramisu chocolate bar muffin. Dessert bonbon caramels
                                            brownie chocolate
                                            bar
                                            chocolate tart dragée.
                                        </p>
                                        <p class="card-text">
                                            Cupcake fruitcake macaroon donut pastry gummies tiramisu chocolate bar
                                            muffin.
                                        </p>
                                        <button class="btn btn-primary block">Update now</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title">Bottom Image Cap</h4>
                                        <p class="card-text">
                                            Jelly-o sesame snaps cheesecake topping. Cupcake fruitcake macaroon donut
                                            pastry gummies tiramisu chocolate bar muffin. Dessert bonbon caramels
                                            brownie chocolate
                                            bar
                                            chocolate tart dragée.
                                        </p>
                                        <p class="card-text">
                                            Cupcake fruitcake macaroon donut pastry gummies tiramisu chocolate bar
                                            muffin.
                                        </p>
                                        <small class="text-muted">Last updated 3 mins ago</small>
                                    </div>
                                    <img class="card-img-bottom img-fluid" src="assets/images/samples/water.jpg"
                                        alt="Card image cap" style="height: 20rem; object-fit: cover;">
                                </div>
                            </div>
                        </div>
                    </div>
						
					</div>
				</section>
			</div>
		</div>
	</div>
	<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/apexcharts/apexcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/pages/dashboard.js'/>"></script>
	<script src="<c:url value='/resources/js/main.js'/>"></script>
	
</body>

</html>