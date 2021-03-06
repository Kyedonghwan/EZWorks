<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/top.jsp" %>																
<%@ include file="addrmenu/addrMenu.jsp" %>									
<%@ include file="../include/middle.jsp" %>
<style type="text/css">
span#title {
	font-size: 22px;
	margin: 0 3px 0 0;
	padding: 8px 8px 8px 24px;
}
tr {
	line-height: 42px;
}
th {
	padding: 8px 8px 8px 24px;
}
img#thumbnail_image {
	width: 100px;
	height: 100px;
	border-radius: 5px;
}
span.requirement {
	color: red;
}
a#returnList {
	color: #333;
	border: solid 1px #999;
	margin: 0 4px;
	padding: 0px 16px;
}
#submitBtn{
	float:left;
	margin: 0 150px;
}
input {
	height: 30px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<div id="content">
	<header>
		<h1>   
			<span id="title">연락처 정보</span>	
		</h1>	
	</header>
		
	<div class="content_page">
		<form id="contactCreateId" name="formContactCreate">
			<fieldset>
				<table class="form_type">
					<colgroup>
						<col width="130px">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<th><span class="title">사진</span></th>
						<td>
							<span class="img_profile" style="overflow:hidden">
								<img class="imgst"
									src="<c:url value='/addr_upload/${vo.photoName}'/>"
									alt="" id="thumbnail_image" data-filename="" data-filepath="">			
							</span>
						</td>
					</tr>
					<tr>
						<th><span>이름</span>
							<span class="requirement">*</span>
						</th>
						<td>
							<span>${vo.name}</span>
						</td>
					</tr>
					<tr>
						<th><span>회사</span>
						</th>
						<td><span>${vo.companyName}</span></td>
					</tr>
					<tr>
						<th><span>부서</span>
						</th>
						<td><span>${vo.deptName}</span></td>
					</tr>
					<tr>
						<th><span>직위</span>
						</th>
						<td><span>${vo.posName}</span></td>
					</tr>
					<tr>
						<th><span>이메일</span>
							<span class="requirement">*</span>
						</th>
						<td><span>${vo.email}</span></td>
					</tr>
					<tr>
						<th>
	                        <span>휴대폰</span>
	                        <span class="requirement">*</span>
	                    </th>
						<td><span>${vo.hp}</span></td>
					</tr>
					<tr>
						<th>
	                        <span>회사전화</span>
	                    </th>
						<td><span>${vo.corpPhone}</span></td>
					</tr>
					<tr>
						<th><span>주소</span></th>
						<td>
							<span id="addressDetail">
							<span class="zipcode" id="zipcode">${vo.zipcode}</span>&nbsp;
							<span class="address" id="address">${vo.address}</span>&nbsp;
							<span class="addressDetail" id="addressDetail">${vo.addressDetail}</span>&nbsp;
							</span>
						</td>
					</tr>
					
					<tr class="line"><td colspan="2"><hr></td></tr>						
					</tbody>
				</table>
			</fieldset>
			<div id="submitBtn">
			<a href="<c:url value='/addrbook/addrEdit?bookNo=${param.bookNo}'/>" class="btn btn-outline-secondary">수정</a>
			<a href="<c:url value='/addrbook/addrbook'/>" class="btn btn-outline-secondary" >목록으로</a>	
			<a href="<c:url value='/addrbook/addrDelete?bookNo=${param.bookNo}'/>" class="btn btn-outline-secondary">
        		삭제</a> 
			
			</div>
		</form>
		<div class="page_action_wrap">
			<c:set var="goBackURL" value='${fn:replace(goBackURL, "   ", "&")}' />

		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp" %>