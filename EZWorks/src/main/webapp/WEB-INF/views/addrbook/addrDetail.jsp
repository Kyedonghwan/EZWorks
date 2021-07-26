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
							</span>
						</td>
					</tr>
					<tr>
						<th><span>이름</span>
							<span class="requirement">*</span>
						</th>
						<td>
							<span>백상현${empvo.empName}</span>
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
						<td><span>${empvo.deptName}</span></td>
					</tr>
					<tr>
						<th><span>직위</span>
						</th>
						<td><span>${empvo.posName}</span></td>
					</tr>
					<tr>
						<th><span>이메일</span>
						</th>
						<td><span>${empvo.email}</span></td>
					</tr>
					<tr>
						<th>
	                        <span>휴대폰</span>
	                    </th>
						<td><span>01025322532${empvo.hp}</span></td>
					</tr>
					<tr>
						<th>
	                        <span>회사전화</span>
	                    </th>
						<td><span>${empvo.corp_phone}</span></td>
					</tr>
					<tr>
						<th><span>주소</span></th>
						<td>
							<span id="addressDetail"><span class="postcode" id="postcode">${empvo.postcode}</span>&nbsp;<span class="address" id="address">${empvo.address}</span>&nbsp;<span class="detail_address" id="detail_address">${empvo.addressDetail}</span>&nbsp;<span class="extra_address" id="extra_address">${empvo.extra_address}</span></span>
						</td>
					</tr>
					
					<tr class="line"><td colspan="2"><hr></td></tr>						
					</tbody>
				</table>
			</fieldset>
			<div id="submitBtn">
			<input type="submit" id="editBtn" data-bypass="" class="btn btn-outline-secondary" data-role="button" value="수정" />
			<input type="button" id="cancleBtn" data-bypass="" class="btn btn-outline-secondary" data-role="button" value="취소" />
			
			</div>
		</form>
		<div class="page_action_wrap">
			<c:set var="goBackURL" value='${fn:replace(goBackURL, "   ", "&")}' />

		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp" %>