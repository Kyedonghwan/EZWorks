<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/top.jsp"%>
<%@include file="sidebarReserv.jsp"%>

<link rel="stylesheet" href="<c:url value='/resources/vendors/summernote/summernote-lite.min.css'/>">
<script>
	$(function(){
		$('.modi').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservModify?rvdNo="+$(this).siblings().val();
		});
		
		$('#close').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservCategory?rvNo="+$('#rvNo').val();
		});
	});
</script>
<style>
.wrap_desc_btm {
    display: block;
    padding: 8px 0;
}
.go_renew .desc {
    line-height: 1.5;
    margin: 0;
}
span.desc {
    display: inline-block;
    font-size: 13px;
    color: #999;
    line-height: 1.6;
}
.desc {
    color: #888;
}
.page_action_wrap {
    text-align: center;
    margin-top: 20px;
    padding-bottom: 20px;
}
.type_normal {
    width: 100%;
    table-layout: auto;
}
table {
    padding: 0;
}
table {
    padding: 0;
}
table {
    border-collapse: collapse;
    width: 100%;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.type_normal thead th {
    height: 32px;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    text-align: left;
    padding: 0 16px;
    white-space: nowrap;
    font-weight: normal;
    font-size: 13px;
    ext-align: left;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.type_normal thead tr th:first-child, .type_normal tbody tr td:first-child {
    padding-right: 0;
    padding-left: 24px;
}

.go_skin_advanced .type_normal td {
    border-bottom: 0;
}
.go_skin_advanced .type_normal td {
    border-bottom: 0;
}
.type_normal th, .type_normal td {
    text-align: left;
}
.type_normal td {
    padding: 8px 16px;
    line-height: 1.6;
    vertical-align: top;
}
</style>

<%@ include file="reservModal.jsp" %>
	

<%@ include file="../include/middle.jsp"%>
<div class="go_content" id="content"
	style="padding-bottom: 0px; height: 939px;">
	
	<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">${vo.rvName }</span>
		</h1>
	</header>
	</div>
	<div class="tab_menu_wrap">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
           <li class="nav-item" role="presentation">
               <a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home"
                    role="tab" aria-controls="home" aria-selected="true">이용안내</a>
           </li>
           <li class="nav-item" role="presentation">
               <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="#profile"
                    role="tab" aria-controls="profile" aria-selected="false">자산관리</a>
           </li>
		</ul>
	</div>
	<Br>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
	<form id="setReserv" method="post" action="<c:url value='/reservation/reservSetting'/>">
		<span class="wrap_desc_btm">
			<span class="desc">※  첫 페이지에 나오는 안내문을 작성할 수 있습니다.</span>
			<input type="hidden" name="rvNo" id="rvNo" value="${param.rvNo }">
		</span>	
			<div class="summernote">
				<textarea id="summernote" name="rvDesc"><p>${vo.rvDesc }</p></textarea>
				<br>
			</div>
			<div>
	            <label for="upfile">첨부파일</label>
	          	 <input type="file" name="fileName" class="multiple-files-filepond" multiple>
	            <span>(최대 2M)</span>
       		</div>
			<div class="page_action_wrap">
				<input type="submit" class="btn btn-primary ml-1" id="reg_ok" value="수정">
				<input type="button" class="btn btn-light-primary" id="close" value="닫기">
			</div>
	</form>
		</div>
		<div class="tab-pane fade" id="profile" role="tabpanel"
			aria-labelledby="profile-tab">
			<table class="type_normal" id="tableBorderList" style="margin-bottom:10px">
				<thead>
					<tr>
						<th><span>코드<ins class="ic"></ins></span></th>
						<th><span>이름<ins class="ic"></ins></span></th>
						<th width="60px"><span>설정<ins class="ic"></ins></span></th>
					</tr>
				</thead>
				<tbody id="assetList">
					<c:forEach var="rdVo" items="${list }">
						
						<tr>
							<td><span class="name">${rdVo.rvdCode }</span></td>
							<td><span class="date">${rdVo.rvdName }</span></td>
							<td >
				              <img src="<c:url value='/resources/vendors/bootstrap-icons/gear.svg'/>" style="float:right;margin-top: 3px" class="modi">
				              <input type="hidden" name="rvdNo" id="modiParam" value="${rdVo.rvdNo }" style="width: 0px;height: 0px;">
							</td>
						</tr>	
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
 <script src="<c:url value='/resources/vendors/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/resources/vendors/summernote/summernote-lite.min.js'/>"></script>
    <script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 400,
        });
    </script>
<%@ include file="../include/bottom.jsp"%>