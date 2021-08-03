<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="assets/vendors/fontawesome/all.min.css">
<script type="text/javascript">
$(function (){
	$("#quickRegistToggler").click(function (){
  	$("#Toggle").toggle();
  });
});

function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();	
}



</script>
<style>
#quickbar {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	display: block;
	position: relative;
	min-height: 38px;
	padding: 0 0 8px 0;
}

#Toggle {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	margin: 0;
	padding: 0;
}

#buttonlay {
	float: left;
}

#quickRegistToggler {
	margin: 3px;
}

#delete {
	margin: 3px;
}

#tool_bar2 {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	margin: 0;
	position: relative;
	min-height: 38px;
	padding: 0 0 8px 0;
	display: block;
}

#toolBar li {
	float: left;
	margin: 0 0 -1px 24px;
	padding: 0;
	cursor: pointer;
	height: 40px;
	line-height: 40px;
	font-size: 13px;
	color: #999;
	list-style: none;
}

#contacts {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	border-collapse: collapse;
	padding: 0;
	table-layout: auto;
	border-top: 0;
	margin: 0;
	width: 100%;
	margin-bottom: 0px;
}

thead {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	border-collapse: collapse;
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

	<div class="card-header">
		<h4>개인 주소록</h4>
	</div>
	<div class="card-body" style="height: 600px;">
		<div id="radialGradient">

			<!-- 컨텐츠페이지 시작 -->

			<div class="conntent-page">
				<section class="tool-bar">
					<ul class="critical">
						<div id="quickbar">
							<div id="buttonlay">
								<a id="quickRegistToggler" data-bypass=""
									class="btn btn-outline-secondary"> <span
									class="ic_toolbar fast"></span> <span class="txt">빠른 등록</span>
								</a>
							</div>
							<button id="delete" class="btn btn-outline-secondary">삭제</button>
							<button id="grmanage" class="btn btn-outline-secondary">그룹관리</button>
						</div>
						<div id="Toggle" style="display: none">
							<form id="quickCreateForm" class="speed_regist">
								<!-- 토글버튼 누르면 숨겨진 퀵등록 폼태그 -->
								<fieldset>
									<div class="form_type form_speed" style="display: block;">
										<input id="quickName" type="text" placeholder="이름(표시명)"
											class="input w_small"> <input id="quickEmail"
											type="text" placeholder="이메일" class="input w_small">
										<input id="quickPhone" type="text" placeholder="휴대폰"
											class="input w_small"> <span
											class="fa-fw select-all fas" style="font-size: 1.3em"></span>






									</div>
								</fieldset>
							</form>
							<!-- 퀵등록 끝! -->
						</div>
					</ul>
				</section>
				<!-- 주소록 리스트 시작-->
				<form name="formContacts">
					<div>
						<div>
							<!-- ㄱㄴㄷㄹ 툴바 -->
							<div id="toolBar">
								<ul>
									<li><span class="lastName"
										onclick="lookConsonant('전체', '', '');">전체</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㄱ', '가', '나');">ㄱ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㄴ', '나', '다');">ㄴ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㄷ', '다', '라');">ㄷ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㄹ', '라', '마');">ㄹ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅁ', '마', '바');">ㅁ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅂ', '바', '사');">ㅂ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅅ', '사', '아');">ㅅ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅇ', '아', '자');">ㅇ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅈ', '자', '차');">ㅈ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅊ', '차', '카');">ㅊ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅋ', '카', '타');">ㅋ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅌ', '타', '파');">ㅌ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅍ', '파', '하');">ㅍ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('ㅎ', '하', '');">ㅎ</span></li>
									<li><span class="lastName"
										onclick="lookConsonant('a-z', 'a', 'Z');">a-z</span></li>
								</ul>
								<input type="hidden" name="range" /> <input type="hidden"
									name="range1" /> <input type="hidden" name="range2" />
							</div>
							<!-- ㄱㄴㄷㄹ 툴바 끝 -->

							<!-- 테이블 시작 -->
							<table id="contacts" class="type_normal tb_addr_list dataTable"
								style="width: 100%; margin-bottom: 0px;">
								<thead>
									<tr role="row">
										<th class="sorting_disabled checkbox" role="columnheader"
											rowspan="1" colspan="1" aria-label="" style="width: 20px;"><input
											type="checkbox" id="checkedAll"></th>
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
										<th class="company align_l sorting"
											style="min-width: 55px; width: 55px;" role="columnheader"
											tabindex="0" aria-controls="contacts" rowspan="1" colspan="1"
											aria-label="회사: activate to sort column ascending"><span
											class="title_sort">회사<ins class="ic"></ins><span
												class="selected"></span></span></th>
										<th class="tel sorting_disabled align_l"
											style="min-width: 80px; width: 80px;" role="columnheader"
											rowspan="1" colspan="1" aria-label="회사전화"><span
											class="title_sort">회사전화<ins class="ic"></ins></span></th>
										<th class="company_address sorting_disabled align_l"
											style="min-width: 100px; width: 101px;" role="columnheader"
											rowspan="1" colspan="1" aria-label="회사주소"><span
											class="title_sort">회사주소<ins class="ic"></ins></span></th>
										<th class="memo sorting_disabled align_l"
											style="min-width: 100px; width: 101px;" role="columnheader"
											rowspan="1" colspan="1" aria-label="메모"><span
											class="title_sort">메모<ins class="ic"></ins></span></th>
										<th class="group sorting_disabled align_l"
											style="min-width: 110px; width: 111px;" role="columnheader"
											rowspan="1" colspan="1"
											aria-label="
				    
				        그룹
				    
				">
											<span class="title_sort"> 그룹<ins class="ic"></ins>
										</span>
										</th>
									</tr>
								</thead>
								<tbody role="alert" aria-live="polite" aria-relevant="all">
									<c:if test="${empty list }">
										<tr>
											<td colspan="5" class="align_center">데이터가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<!--게시판 내용 반복문 시작  -->
										<c:forEach var="vo" items="${list}">

											<tr class="odd">
												<td class="align_c"><input name="id" type="checkbox"
													value="1061" data-row="0"></td>
												<td class="align_l name sorting_1"><span
													class="photo small"><img
														src="<%=request.getContextPath()%>/resources/images/faces/1.jpg"
														title="test" alt="test"></span> <a href
						="<c:url value='/addrbook/addrDetail?bookNo=${vo.bookNo}'/>"><span
														class="name contact_detail" data-id="1061">${vo.name}</span></a></td>
												<td class="align_l hp"><span class="hp">${vo.hp}</span></td>
												<td class="align_l department">${vo.deptName}</td>
												<td class="align_l company"><span class="company">${vo.companyName}</span></td>
												<td class="align_l tel"></td>
												<td class="align_l companyAddress">${vo.address}</td>
												<td class="align_l memo">${vo.memo}</td>
												<td class="align_l group"><span class="group"
													title="전사주소록2">전사주소록</span></td>
											</tr>

										</c:forEach>
										<!--반복처리 끝  -->
									</c:if>
								</tbody>
							</table>
						</div>
						<!-- 테이블끝 -->
					</div>
				</form>
			</div>

			<!-- 컨텐츠 끝 -->
		</div>
	</div>

	<!-- 페이지 처리 -->
	<div style="margin-top: 40px">
		<nav aria-label="Page navigation example">
			<ul
				class="pagination pagination-primary pagination-sm justify-content-center">
				<li
					class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.firstPage }'>disabled</c:if>">
					<a class="page-link" href="#"
					onclick="pageProc(${pagingInfo.firstPage-1})">Previous</a>
				</li>
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item"><a class="page-link" href="#"
							onclick="pageProc(${i})">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})"> <img
						src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
					</a>
				</c:if>
				<li
					class="page-item <c:if test='${pagingInfo.currentPage==pagingInfo.lastPage }'>disabled</c:if>"><a
					class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>


</body>
</html>