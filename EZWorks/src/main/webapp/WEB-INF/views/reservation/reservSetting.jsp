<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function(){
		
	});
</script>


<style>
.go_skin_advanced .content_top {
	padding: 18px 24px;
}

.content_top, .content_page {
	background: #fff;
}


header.content_top h1>span.txt {
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}
div.tab_menu_wrap {
    margin: 15px 0 15px;
    padding: 0;
    display: block;
    border-bottom: 1px solid #dfdfdf;
}
header.content_top + .tab_menu_wrap > ul.tab_menu {
    padding: 0 24px;
}
ul.tab_menu {
    overflow: hidden;
    margin-bottom: -1px;
}
ul, ul li {
    padding: 0;
    list-type: none;
}
ul, ol {
    list-style: none;
}
ul.tab_menu li:first-child {
    margin-left: 0;
}

ul.tab_menu li {
    float: left;
    padding: 12px 0;
    margin: 0 16px;
    z-index: 1;
    cursor: pointer;
}
ul.tab_menu li.active, ul.tab_menu li.ui-state-active {
    border-bottom: 2px solid #000;
}
</style>


</style>
<%@ include file="../include/top.jsp"%>
<%@ include file="reservModal.jsp" %>
	
<%@include file="sidebarReserv.jsp"%>
<%@ include file="../include/middle.jsp"%>
<div class="go_content" id="content"
	style="padding-bottom: 0px; height: 939px;">
	
	<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">본사 1층 회의실</span>
		</h1>
	</header>
	</div>
	<div class="tab_menu_wrap">
		<ul class="tab_menu">
			<li class="active" id="assetGuidance"><span>이용안내</span></li>
			<li class="" id="assetManage"><span>자산관리</span></li>
		</ul>
	</div>
	<div class="content_page go_renew" id="assetAdminPart">
		
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>