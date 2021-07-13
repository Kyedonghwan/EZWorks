<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
	<div class="card-header">
		<h4>메뉴 이름</h4>
			<span style="font-size:0.8em;">대충 이렇게 줘보면...</span>
	</div>
	<div class="card-body" style="height:600px;">
		<div id="area">
			<span style="font-size:0.8em;">여기가 몸통이 들어가는건가...</span>
		</div>
	</div>									
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
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
                                       <svg class="bi text-primary" width="32" height="32" fill="blue"
                                           style="width:10px">
                                           <use
                                               xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
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
                                       <svg class="bi text-success" width="32" height="32" fill="blue"
                                           style="width:10px">
                                           <use
                                               xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
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
                                       <svg class="bi text-danger" width="32" height="32" fill="blue"
                                           style="width:10px">
                                           <use
                                               xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
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
                                                       <img src="assets/images/faces/5.jpg">
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
                                                       <img src="assets/images/faces/2.jpg">
                                                   </div>
                                                   <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                               </div>
                                           </td>
                                           <td class="col-auto">
                                               <p class=" mb-0">Wow amazing design! Can you make another
                                                   tutorial for
                                                   this design?</p>
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
    	
    </div>
</section>											
<%@ include file="../include/bottom.jsp" %>