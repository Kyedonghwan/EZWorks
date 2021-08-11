<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
$(function(){
	$('#close').click(function(){
		location.href="${pageContext.request.contextPath}/calendar/calSetting";
	});
});
</script>
<style>
#content {
    word-break: break-all;
}
body.go_skin_advanced .go_body .go_content {
    min-height: auto;
}
.go_skin_advanced .go_body .go_content {
    margin-left: 250px;
}
.go_body .go_content {
    margin-left: 251px;
}
.go_body .go_content {
    position: relative;
}
.go_body .go_content {
    position: relative;
}
.go_body .go_content {
    min-height: 600px;
    background: #fff;
    padding-bottom: 45px;
    margin-left: 250px;
}
.go_skin_advanced .content_top {
    padding: 18px 24px;
}
.content_top, .content_page {
    background: #fff;
}
.content_top {
    padding: 24px;
}
.form_type {
    margin: 8px 0;
    width:100%;
}
table.form_type>tbody>tr>th {
    padding-left: 24px;
    height: 26px;
    width: 140px;
}
table.form_type tbody th {
    text-align: left;
    vertical-align: top;
    font-weight: normal;
}
table.form_type>tbody th, table.form_type>tbody td {
    padding: 8px;
}
.go_renew table.form_type>tbody td {
    padding: 4px 24px 4px 0;
}
.go_renew input.txt1 {
    min-width: 40px;
}
.go_renew input.txt1 {
    padding: 0 8px;
    height: 26px;
}
.go_renew input.txt1, .go_renew textarea {
    border: 1px solid #ddd;
    border-radius: 2px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
}
.page_action_wrap {
    text-align: center;
    margin-top: 20px;
    padding-bottom: 20px;
}
.txt {
    font-size: 22px;
    font-weight: normal;
    letter-spacing: -1px; 
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}

.txt1 {
    font-size: 15px;
    font-weight: normal;
    letter-spacing: -1px; 
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
}
.txt2{
	width:10%;
}
</style>
<%@include file="sidebar2.jsp"%>
<%@ include file="../include/middle.jsp"%>
<div class="go_content" id="content">	
<header class="content_top">
	<h1><span class="txt">내 캘린더 수정</span></h1>
</header>	

<!--목록:-->		

<form name="modifyCate" method="post" action="<c:url value='/calendar/cateModify'/>">
<div class="content_page go_renew">			
	<table class="form_type form_add01">
		<tbody id="createPart">
			<tr>
				<th class="col1"><span class="title">이름</span></th>
				<td class="col2">					
					<div class="wrap_txt">
					<input class="txt1 w_max" type="text" value="${vo.schCateName }" name="schCateName" id="name">
					</div>					
				</td>
			</tr>
			<tr>
				<th><span class="title">색상</span></th>
				<td>
					<div class="wrap_txt"><input class="txt2 w_max" type="color" value="${vo.schColor }" name="schColor" id="color"></div>
				</td>
			</tr>
			<tr class="line"><td colspan="2"><hr></td></tr>
		
		</tbody>
	</table>
	<input type="hidden" value="${vo.schCateNo }" name="schCateNo" id="CateNo">
	<div class="page_action_wrap">
		<input type="submit" class="btn btn-primary ml-1" id="reg_ok" value="수정">
		<input type="button" class="btn btn-light-primary" id="close" value="닫기">
	</div>

</div>
</form>
</div>

<%@ include file="../include/bottom.jsp"%>