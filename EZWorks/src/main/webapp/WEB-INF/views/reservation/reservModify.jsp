<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#close').click(function(){
			location.href="${pageContext.request.contextPath}/reservation/reservCategory?rvNo="+$('#rvdCate').val();
		});
	});
</script>
<style>
#content {
    word-break: break-all;
}
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
</style>


<%@include file="sidebarReserv.jsp"%>
<%@ include file="../include/middle.jsp"%>
<div class="go_content" id="content"><!-- 자산추가 -->	
<header class="content_top">
	<h1><span class="txt">자산수정</span></h1>
</header>	

<!--목록:-->		

<form name="updateFrm" method="post" action="<c:url value='/reservation/reservModify'/>">
<div class="content_page go_renew">			
	<table class="form_type form_add01">
		<tbody id="createPart">
			<tr>
				<th class="col1"><span class="title">코드</span></th>
				<td class="col2">					
					<div class="wrap_txt">
					<input class="txt1 w_max" type="text" value="${vo.rvdCode }" name="rvdCode" id="code">
					</div>					
				</td>
			</tr>
			<tr>
				<th><span class="title">이름</span></th>
				<td>
					<div class="wrap_txt"><input class="txt1 w_max" type="text" value="${vo.rvdName }" name="rvdName" id="name"></div>
				</td>
			</tr>
			<tr class="line"><td colspan="2"><hr></td></tr>
		
		</tbody>
	</table>
	<input type="hidden" value="${vo.rvdNo }" name="rvdNo" id="rvdNo">
	<input type="hidden" value="${vo.rvdCate }" name="rvdCate" id="rvdCate">
	<div class="page_action_wrap">
		<input type="submit" class="btn btn-primary ml-1" id="reg_ok" value="수정">
		<input type="button" class="btn btn-light-primary" id="close" value="닫기">
	</div>

</div>
</form>
<!-- //자산추가 --></div>
<%@ include file="../include/bottom.jsp"%>