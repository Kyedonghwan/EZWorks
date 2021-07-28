<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
</style>
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a>전자결재</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="#" class="btn btn-outline-secondary" id="newApproval" style="width:100%;font-size:0.85em;">
				새 결제 진행
			</a>
	</div>
</section>
<section>
	<div>
		<ul style="list-style:none">
			<li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">자주쓰는양식</span>
                </a>
                <ul class="submenu active" style="list-style:none" id="usedFormSideBar">
                </ul>
             </li>
             <br>
			<li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">기안</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="component-alert.html">기안문작성</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-badge.html">결제요청함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-button.html">임시저장함</a>
                    </li>
                </ul>
             </li>
             <br>
             <li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">결재</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="component-alert.html">결제대기함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-badge.html">결제진행함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-button.html">완료문서함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-button.html">반려문서함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-button.html">참조/열람문서함</a>
                    </li>
                </ul>
             </li>
             <br>
             <li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <span style="font-weight:bold">발신/수신</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="component-alert.html">부서수신함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-badge.html">공문수신함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="component-button.html">공문발신함</a>
                    </li>
                </ul>
             </li>
             <br>
         </ul>
	</div>
</section>

<script>
	$.showUsedForm=function(){
		$.ajax({
			url:'<c:url value="/form/showUsedForm"/>',
			type:'get',
			dataType:'json',
			success:function(res){
				var temp="";
				$.each(res,function(){
					temp+='<li class="submenu-item ">';
					temp+='<a href="<c:url value='/form'/>/'+this.FORM_NO+'">'+this.FORM_NAME+'</a>';
                    temp+='</li>';   
				})
				$('#usedFormSideBar').html(temp);
			},
			error:function(e){
				alert("자주쓰는양식 불러오기 ajax 에러");
			}
		})
	}
	
	$(function(){
		$.showUsedForm();
	});
</script>

<!-- 
<li class="submenu-item ">
                        <a href="component-breadcrumb.html" style="color:grey" disable="disabled">사내 소식</a>
                    </li>
 -->