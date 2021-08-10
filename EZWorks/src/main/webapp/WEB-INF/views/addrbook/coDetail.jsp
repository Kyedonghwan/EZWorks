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
								<%-- <img class="imgst"
									src="<c:url value='/addr_upload/${vo.photoName}'/>"
									alt="" id="thumbnail_image" data-filename="" data-filepath=""> --%>			
							</span>
						</td>
					</tr>
					<tr>
						<th><span>이름</span>
							<span class="requirement">*</span>
						</th>
						<td>
							<span>${vo.empName}</span>
						</td>
					</tr>
					<tr>
						<th><span>회사</span>
						</th>
						<td><span>(주)ez그룹</span></td>
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
						<td><span>${vo.empEmail}</span></td>
					</tr>
					<tr>
						<th>
	                        <span>휴대폰</span>
	                        <span class="requirement">*</span>
	                    </th>
						<td><span>${vo.empTel}</span></td>
					</tr>
					<tr>
						<th><span>주소</span></th>
						<td>
							<span id="addressDetail">
							<span class="zipcode" id="zipcode">${vo.empZipcode}</span>&nbsp;
							<span class="address" id="address">${vo.empAddr}</span>&nbsp;
							<span class="addressDetail" id="addressDetail">${vo.empAddr2}</span>&nbsp;
							</span>
						</td>
					</tr>
					
					<tr class="line"><td colspan="2"><hr></td></tr>						
					</tbody>
				</table>
			</fieldset>
			<div id="submitBtn">
			<a href="<c:url value='/addrbook/coAddrbook'/>" class="btn btn-outline-secondary" >목록으로</a>	
			</div>
		</form>
		<div class="page_action_wrap">
			<c:set var="goBackURL" value='${fn:replace(goBackURL, "   ", "&")}' />

		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp" %>