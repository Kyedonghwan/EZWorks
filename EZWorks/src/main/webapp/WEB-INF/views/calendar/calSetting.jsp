<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!--sweetalert2-->
<link rel="stylesheet" href="sweetalert2.min.css">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btn-gotocal').click(function(){
        	location.href="${pageContext.request.contextPath}/calendar/calendarMain";
        });
		
		$('.modifyCate').click(function(){
        	location.href="${pageContext.request.contextPath}/calendar/cateModify?schCateNo="+$('.inputReserv').val();
        });
		
		$('.delCate').click(function(){
			Swal.fire({
	    		  title: '일정을 삭제하시겠습니까?',
	    		  icon: 'error',
	    		  showCancelButton: true,
	    		  confirmButtonColor: '#4374D9',
	    		  cancelButtonColor: '#BDBDBD',
	    		  confirmButtonText: '삭제'
	    		}).then((result) => {
	    		  if (result.isConfirmed) {
		    		      $.ajax({
		    				type:"get",
		    				url:"<c:url value='/delCate'/>",
		    				data: "schCateNo="+$(this).val(),
		    				success:function(){
		    					location.href="<c:url value='/calendar/calSetting'/>";
		    				},error:function(){
		    					alert('error');
		    				}
		    			});
	    		  	}
	    		});
		});
	});
</script>


<style>
.go_skin_advanced .content_top {
    padding: 25px 24px;
}
.go_renew table.form_type>tbody td {
    padding: 4px 24px 4px 0;
}
.txt {
    display: inline;
    min-height: 13px;
    margin: 0 8px 0 0;
    font-size: 22px;
    font-weight: normal;
}
.tab_conent_wrap div.vertical_wrap {
    margin: 16px 0;
    padding: 0 24px;
}
.vertical_wrap label {
    margin-right: 8px;
}
.wfix_large {
    width: 200px;
}
.input {
    border: 1px solid #ddd;
    padding: 0 4px;
    height: 26px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    font-weight: normal;
    font-size: 13px;
}
.btn_fn10 {
    vertical-align: middle;
    letter-spacing: -1px;
    background: #e9e9e9;
    border: 1px solid #d9d9d9;
    border-radius: 2px;
    color: #656565;
    cursor: pointer;
    display: inline-block;
    line-height: 18px;
    padding: 4px 8px 2px 8px;
    font-size: 13px;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
    color: black;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
    color: black;
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
    color: black;
}
.sorting_1 {
    padding: 8px 16px;
    line-height: 1.6;
    vertical-align: top;
    font-size: 15px;
    color: black;
}
.last:hover{
	background-color: #EAEAEA;
}
p.data_null {
    text-align: center;
    color: #999;
    padding: 32px;
    font-size: 15px;
    color: black;
}
.page_action_wrap {
    text-align: center;
    margin-top: 20px;
    padding-bottom: 20px;
    color: black;
}
div.page_action_wrap .btn_minor, footer.btn_layer_wrap .btn_minor {
    display: inline-block;
    cursor: pointer;
    padding: 0 16px;
    height: 34px;
    line-height: 33px;
    border-radius: 2px;
    background: #f4f4f4;
    border: 1px solid #ddd;
    margin: 0 4px;
}

.btn_minor {
    display: inline-block;
    cursor: pointer;
    padding: 11px 25px 8px;
    color: #656565;
    font-weight: normal;
    font-size: 13px;
    line-height: 12px;
    border: 1px solid #d9d9d9;
    border-radius: 2px;
    background: #f3f3f3;
    border: 1px solid #d1d1d1;
}
.btn_fn7 {
    display: inline-block;
    height: 19px;
    line-height: 18px;
    padding: 0 4px;
    border: 1px solid #ddd;
    border-radius: 2px;
    background: #fff;
    cursor: pointer;
    font-size: 12px;
    white-space: nowrap;
    margin-left: 14px;
    color: black;
}
</style>
<%@include file="sidebar2.jsp"%>
<%@ include file="../include/middle.jsp"%>
<div class="card-header">
	<header class="content_top">
		<h1>
			<span class="txt" id="assetName">내 캘린더 관리</span>
		</h1>
	</header>
</div>
<div class="card-body" style="height: 100%;">
	<div class="vertical_wrap wrap_calendar_name">
		<form id="form-add-mycal" method="post" action="<c:url value='/calendar/calSetting'/>">
			<span class="wrap_txt">
				<label>캘린더 이름</label><input type="hidden" value="${empVo.empNo }" name="empNo">
				<input type="text" name="schCateName" class="input wfix_large">
				<button type="submit" class="btn-submit btn_fn10">추가</button>
			</span>
		</form> 
	</div>
	<br>
	<div class="dataTables_wrapper">
		<!-- 테이블 -->		
		<div id="assetItemDataTable_wrapper" class="dataTables_wrapper"
			role="grid">
			<div id="assetItemDataTable_processing" class="dataTables_processing"
				style="visibility: hidden;">Loading...</div>
			<table class="type_normal list_reser001 dataTable"
				id="assetItemDataTable" style="width: 100%; margin-bottom: 0px;">	
			<thead>
				<tr role="row">
						<th class="sorting name sorting_disabled" role="columnheader"
							rowspan="1" colspan="1" aria-label="항목" style="width: 539px;"><span
							class="title_sort">캘린더<ins class="ic"></ins></span></th>
						<th class="sorting_disable action sorting_disabled"
							role="columnheader" rowspan="1" colspan="1" aria-label="예약"
							style="width: 284px;"><span class="title_sort">수정</span></th>
						<th class="sorting_disable action sorting_disabled"
							role="columnheader" rowspan="1" colspan="1" aria-label="설정"
							style="width: 283px;"><span class="title_sort">삭제</span></th>
					</tr>
			</thead>
			
			<tbody role="alert" aria-live="polite" aria-relevant="all">
					<c:forEach var="vo" items="${list }">
						<tr class="odd">
							<td class="name sorting_1"><a data-bypass="" class=""
								data-btntype="reservation" data-id="12">${vo.schCateName }</a></td>
							<td class="action1"><a class="btn_fn7" data-bypass=""
								data-btntype="reservation" data-id="12">
								<span class="txt_b modifyCate">
								<input type="hidden" class="inputReserv" value="${vo.schCateNo }" style="width: 0px; height: 0px;">
								수정</span></a></td>
							<td class="action2">
								<button class="btn_fn7 delCate" value="${vo.schCateNo }">삭제</button>
							</td>
						</tr>
					</c:forEach>
			</tbody>
			</table>
			
		</div><br>
		<!-- //테이블 -->	
	</div>		
	<div class="page_action_wrap">
		<span id="btn-gotocal" data-role="button" class="btn_minor">
			<span>캘린더로 돌아가기</span>
		</span>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<%@ include file="../include/bottom.jsp"%>