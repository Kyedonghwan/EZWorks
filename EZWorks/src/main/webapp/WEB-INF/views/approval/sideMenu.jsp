<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	 .state{
	 	padding:4px;border-radius:2px;width:auto;font-size:12px;
	 }
	 
	 span.state{
	 	display: inline-block;
	 	text-align:center;
	 }
	 .ongoing{
	 	background-color:#a6c76c;border:1px solid #a6c76c;color:#fff
	 }
	 
	 .emergency{
	 	background: none; border:1px solid #ff9f9d;color: #fb4c49
	 }
	 
	 .complete{
	 	background-color:#A3A3A3;border:1px solid #A3A3A3;color:#fff
	 }
	 .disagree{
	 	background-color:#ff616b;border:1px solid #ff616b;color:#fff
	 }
	 .temp{
	 	background-color:#F6B3B3;border:1px solid #F6B3B3;color:#fff
	 }
</style>
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a href="<c:url value='/approval/main'/>">전자결재</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="#" class="btn btn-outline-secondary" id="newApproval" style="width:100%;font-size:0.85em;">
				새 결재 진행
			</a>
	</div>
</section>
<section>
	<div>
		<ul style="list-style:none">
			<li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">자주 쓰는 양식</span>
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
                        <a href="<c:url value='/approval/draft'/>">결재 요청함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="<c:url value='/approval/temp'/>">임시 저장함</a>
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
                        <a href="<c:url value='/approval/wait'/>">결재 대기함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="<c:url value='/approval/complete'/>">결재 완료함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="<c:url value='/approval/reference'/>">참조/열람 문서함</a>
                    </li>
                </ul>
             </li>
             <br>
             <li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <span style="font-weight:bold">부서 문서함</span>
                    
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="submenu-item ">
                        <a href="<c:url value='/approval/draftByDept'/>">기안 완료함</a>
                    </li>
                    <li class="submenu-item ">
                        <a href="<c:url value='/approval/referenceByDept'/>">부서 참조함</a>
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