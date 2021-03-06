<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();	
}


</script>
<style>
#contacts{
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
thead{
    font-size: 14px;
    color: #333;
    white-space: normal;
    letter-spacing: -0.5px;
    word-break: break-all;
    border-collapse: collapse;

}

thead{
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
    
td{
    padding: 8px 1px;
    line-height: 1.6;
    border-bottom: 1px solid #eee;
    vertical-align: top;
}
.photo.small img{
    display: inline-block;
    width: 32px;
    height: 32px;
    border-radius: 32px;
   }
</style>
<body>


<!-- 테이블 시작  -->
	<table id="contacts" class="type_normal tb_addr_list dataTable" style="width: 100%; margin-bottom: 0px;">
			<thead>
			<tr role="row"><th class="sorting_disabled checkbox" role="columnheader" rowspan="1" colspan="1" aria-label="" style="width: 20px;"><input type="checkbox" id="checkedAll"></th><th class="name align_l sorting_asc" style="min-width: 100px; width: 101px;" role="columnheader" tabindex="0" aria-controls="contacts" rowspan="1" colspan="1" aria-label="이름(표시명): activate to sort column ascending"><span class="title_sort">이름(표시명)<ins class="ic"></ins><span class="selected"></span></span></th><th class="hp sorting_disabled align_l" style="min-width: 80px; width: 80px;" role="columnheader" rowspan="1" colspan="1" aria-label="휴대폰"><span class="title_sort">휴대폰<ins class="ic"></ins></span></th><th class="department sorting_disabled align_l" style="min-width: 50px; width: 51px;" role="columnheader" rowspan="1" colspan="1" aria-label="부서"><span class="title_sort">부서<ins class="ic"></ins></span></th><th class="company align_l sorting" style="min-width: 55px; width: 55px;" role="columnheader" tabindex="0" aria-controls="contacts" rowspan="1" colspan="1" aria-label="회사: activate to sort column ascending"><span class="title_sort">회사<ins class="ic"></ins><span class="selected"></span></span></th><th class="tel sorting_disabled align_l" style="min-width: 80px; width: 80px;" role="columnheader" rowspan="1" colspan="1" aria-label="회사전화"><span class="title_sort">회사전화<ins class="ic"></ins></span></th><th class="company_address sorting_disabled align_l" style="min-width: 100px; width: 101px;" role="columnheader" rowspan="1" colspan="1" aria-label="회사주소"><span class="title_sort">회사주소<ins class="ic"></ins></span></th><th class="memo sorting_disabled align_l" style="min-width: 100px; width: 101px;" role="columnheader" rowspan="1" colspan="1" aria-label="메모"><span class="title_sort">메모<ins class="ic"></ins></span></th><th class="group sorting_disabled align_l" style="min-width: 110px; width: 111px;" role="columnheader" rowspan="1" colspan="1" aria-label="
				    
				        그룹
				    
				">
				    <span class="title_sort">
				        그룹<ins class="ic"></ins>
				    </span>
				</th></tr>
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
		<td class="align_c">
		<input name="id" type="checkbox" value="1061" data-row="0">
		</td>
		<td class="align_l name sorting_1">
		<span class="photo small"><img src="<%=request.getContextPath()%>/resources/images/faces/1.jpg" title="test" alt="test"></span>
		<a><span class="name contact_detail" data-id="1061">${vo.name}</span></a></td>
		<td class="align_l hp"><span class="hp">${vo.hp}</span></td>
		<td class="align_l department">${vo.deptName}</td>
		<td class="align_l company"><span class="company"></span></td><td class="align_l tel"></td><td class="align_l company_address"></td>
		<td class="align_l memo"></td><td class="align_l group"><span class="group" title="전사주소록2">전사주소록</span></td>
		</tr>
		
		</c:forEach>
		  	<!--반복처리 끝  -->
	  	</c:if>
	</tbody>
	</table>
	
<!-- 테이블 끝 -->


<div class="divPage">
	<!-- 페이지 번호 추가 -->		
	<!-- 이전 블럭으로 이동 -->
	<c:if test="${pagingInfo.firstPage>1 }">
		<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
			<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
		</a>
	</c:if>
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<c:forEach var="i" begin="${pagingInfo.firstPage }" 
		end="${pagingInfo.lastPage }">
		<c:if test="${i==pagingInfo.currentPage }">
			<span style="color:blue;font-weight: bold">${i}</span>
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageProc(${i})">[${i}]</a>
		</c:if>
	</c:forEach>
	<!-- 다음 블럭으로 이동 -->
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
		</a>
	</c:if>
	<!--  페이지 번호 끝 -->
</div>

</body>
</html>