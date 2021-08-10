<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.home{
	width:300px;
	height:300px;
	
}


thead {
	height: 32px;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	text-align: left;
	padding: 8 16px;
	white-space: nowrap;
	font-weight: normal;
	font-size: 13px;
	ext-align: left;
}

td {
	padding: 8px 1px;
	line-height: 1.6;
	border-bottom: 1px solid #eee;
	vertical-align: top;
}

.photo.small img {
	display: inline-block;
	width: 32px;
	height: 32px;
	border-radius: 32px;
}
</style>
<body>
<div class="home">
<table id="contacts" class="type_normal tb_addr_list dataTable"
								style="width: 100%; margin-bottom: 0px;">
								<thead>
									<tr role="row">
										<th class="name align_l sorting_asc"
											style="min-width: 100px; width: 101px;" role="columnheader"
											tabindex="0" aria-controls="contacts" rowspan="1" colspan="1"
											aria-label="이름(표시명): activate to sort column ascending"><span
											class="title_sort">이름(표시명)<ins class="ic"></ins><span
												class="selected"></span></span></th>
										<th class="hp sorting_disabled align_l"
											style="min-width: 80px; width: 80px;" role="columnheader"
											rowspan="1" colspan="1" aria-label="휴대폰"><span
											class="title_sort">휴대폰<ins class="ic"></ins></span></th>
										<th class="department sorting_disabled align_l"
											style="min-width: 50px; width: 51px;" role="columnheader"
											rowspan="1" colspan="1" aria-label="부서"><span
											class="title_sort">부서<ins class="ic"></ins></span></th>
										
									</tr>
								</thead>
								<tbody role="alert" aria-live="polite" aria-relevant="all">
									<c:if test="${empty list }">
										<tr>
											<td colspan="5" class="align_center">데이터가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<!--d 내용 반복문 시작  -->
										<c:forEach var="vo" items="${list}">

											<tr class="odd">
											
												<td class="align_l name sorting_1"><span
													class="photo small"><img
														src="<c:url value='/addr_upload/${vo.photoName}'/>"
														title="test" alt="test"></span> <a href
													="<c:url value='/addrbook/addrDetail?bookNo=${vo.bookNo}'/>"><span
														class="name contact_detail" data-id="1061">${vo.name}</span></a></td>
												<td class="align_l hp"><span class="hp">${vo.hp}</span></td>
												<td class="align_l department">${vo.deptName}</td>																								
											</tr>

										</c:forEach>
										<!--반복처리 끝  -->
									</c:if>
								</tbody>
							</table>
</div>
</body>
</html>