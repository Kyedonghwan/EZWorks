<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=zipcode]").val(data.zonecode);
           $("[name=address]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}


</script>
<style type="text/css">
body {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	margin: 0;
	padding: 0;
	position: relative;
	background: #fff;
	z-index: 0;
}

h3 {
	padding: 24px;
}

tr {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	border-collapse: collapse;
	padding: 8px;
	text-align: left;
	vertical-align: top;
	font-weight: normal;
	padding-left: 24px;
	height: 26px;
	width: 140px;
}

td {
	font-size: 14px;
	color: #333;
	white-space: normal;
	letter-spacing: -0.5px;
	word-break: break-all;
	border-collapse: collapse;
	vertical-align: top;
	padding: 4px 24px 4px 0;
}

.imgst {
	width: 100px;
	height: 100px;
}
span.requirement {
	color: red;
}

</style>
<body>
	<%@ include file="../include/top.jsp"%>
	<%@ include file="addrmenu/addrMenu.jsp"%>
	<%@ include file="../include/middle.jsp"%>
	<h3>연락처 추가</h3>
	<br>
	<br>
	<div class="content_page">
		<form id="contactCreateId" name="formContactCreate" method="post"
			action="<c:url value='/addrbook/addrWrite'/>">
			<fieldset>
				<table class="form_type">
					<colgroup>
						<col width="130px">
						<col width="*">
					</colgroup>
					<tbody>
						<br>
						<tr>
							<th><span class="title">사진</span></th>
							<td><span class="img_profile" style="overflow: hidden">
									<span class="wrap_btn wrap_file_upload"> <span
										class="btn_file_form fileinput-button"
										style="text-align: center;"> <span class="button text"><span
												class="buttonText">사진 올리기</span></span> <input type="file"
											name="file" title="파일 첨부" multiple="" accept="undefined"></span>
										<div class="progress" style="display: none; margin-top: 5px"></div></span>
									<img class="imgst"
									src="<%=request.getContextPath()%>/resources/images/faces/photo_profile_large.jpg"
									alt="" id="thumbnail_image" data-filename="" data-filepath="">
							</span> <span class="btn_fn7" id="del_photo" data-role="button">삭제</span>
								<div class="wrap_desc">
									<span class="desc">※ 사진은 자동으로 150x150 사이즈로 적용 됩니다.</span>
								</div></td>
						</tr>
						<tr>
							<th><span class="title">이름</span> <span class="requirement">*</span>
							</th>
							<td><span class="txt_edit"> <input name="name" style="width: 60%;display: inline;"
									value="" class="form-control" type="text">
							</span></td>
						</tr>
						<tr>
							<th><span class="title">회사</span></th>
							<td><span class="txt_edit"><input name="companyName"
									class="form-control" style="width: 60%;display: inline;" type="text"></span></td>
						</tr>
						<tr>
							<th><span class="title">부서</span></th>
							<td><span class="txt_edit"><input name="deptName" style="width: 60%;display: inline;"
									class="form-control" type="text"></span></td>
						</tr>
						<tr>
							<th><span class="title">직위</span></th>
							<td><span class="txt_edit"><input name="posName" style="width: 60%;display: inline;"
									class="form-control" type="text"></span></td>
						</tr>
						<!-- 	<tr class="line">
					<th><span class="title">그룹</span></th>
					<td>
						<ul id="groupNameTag" class="name_tag">
							<li class="creat" id="groupCreate">
									<span class="btn_wrap"><span class="ic_form ic_addlist"></span><span class="txt">그룹추가</span></span>
							</li>
						</ul>																		
					</td>
				</tr> -->
						<tr>
							<th><span class="title">이메일</span> <span class="requirement">*</span> </th>
							<td><span class="txt_edit"><input name="email"
									class="form-control" style="width: 60%;display: inline;" type="text"></span></td>
						</tr>
						<tr>
							<th><span class="title">휴대폰</span> <span class="requirement">*</span></th>
							<td><span class="txt_edit"><input name="hp"
									class="form-control" style="width: 60%;display: inline;" type="text"></span></td>
						</tr>
						<tr>
							<th><span class="title">회사전화</span></th>
							<td><span class="txt_edit"><input name="corpPhone"
									class="form-control" style="width: 60%;display: inline;" type="text"></span></td>
						</tr>
						<tr>
							<th><span class="title">주소</span></th>
							<td><span id="officeDetail" class="txt_edit">
									<div class="form-group">
										<input class="form-control"
											style="width: 40%; display: inline;" placeholder="우편번호"
											name="zipcode" id="zipcode" type="text" readonly="readonly">
										<button type="button" class="btn btn-default"
											onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;"
											placeholder="도로명 주소" name="address" id="address" type="text"
											readonly="readonly" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소" name="addressDetail"
											id="addressDetail" type="text" />
									</div>
							</span> </td>
						</tr>
						
						<tr>
							<th><span class="title">메모</span></th>
							<td><span class="textarea"> <textarea name="memo"
										class="form-control"></textarea>
							</span></td>
						</tr>
						<!--  hidden  -->
						<tr style="display: none">
							<th><span class="title">애칭</span></th>
							<td><span class="txt_edit"><input name="nickName"
									class="input wfix_large" type="text"></span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">생일</span></th>
							<td><span class="noti_date_wrap option_wrap"> <input
									name="birthday" class="input wfix_large" type="text"
									id="birthdayDate"> <span id="birthdayDateIcon"
									class="ic ic_calendar"></span>
							</span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">기념일</span></th>
							<td><span class="noti_date_wrap option_wrap"> <input
									name="anniversary" class="input wfix_large" type="text"
									id="anniversaryDate"> <span id="anniversaryDateIcon"
									class="ic ic_calendar"></span>
							</span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">집 전화</span></th>
							<td><span class="txt_edit"><input name="home_tel"
									class="input wfix_large" type="text"></span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">집 주소</span></th>
							<td><span id="homeDetail" class="txt_edit"> <input
									name="home_basicAddress" class="input wfix_max" type="text"
									readonly="readonly"> <input name="home_country"
									class="input wfix_max" type="hidden"> <input
									name="home_postalCode" class="input wfix_max" type="hidden">
									<input name="home_state" class="input wfix_max" type="hidden">
									<input name="home_city" class="input wfix_max" type="hidden">
									<input name="home_extAddress" class="input wfix_max"
									type="hidden"> <span title="상세주소입력"
									class="btn btn-outline-secondary" evt-rol="viewLayerAddress"
									type="office"></span>
							</span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">집 팩스</span></th>
							<td><span class="txt_edit"><input name="home_fax"
									class="input wfix_large" type="text"></span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">집 홈페이지</span></th>
							<td><span class="txt_edit"><input
									name="home_homepage" class="input wfix_large" type="text"></span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">회사 팩스</span></th>
							<td><span class="txt_edit"><input name="company_fax"
									class="input wfix_large" type="text"></span></td>
						</tr>
						<tr style="display: none">
							<th><span class="title">회사 홈페이지</span></th>
							<td><span class="txt_edit"><input
									name="company_homepage" class="input wfix_large" type="text"></span></td>
						</tr>
						<!--  hidden  -->

						<!-- <tr>
							<th><span class="title">항목추가</span></th>
							<td><select name="contactItem">
									<option value="contactItemDesc">추가할 항목을 선택하세요</option>
									<option value="nickName">애칭</option>
									<option value="birthday">생일</option>
									<option value="anniversary">기념일</option>
									<option value="home_tel">집 전화</option>
									<option value="home_basicAddress">집 주소</option>
									<option value="home_fax">집 팩스</option>
									<option value="home_homepage">집 홈페이지</option>
									<option value="company_fax">회사 팩스</option>
									<option value="company_homepage">회사 홈페이지</option>
							</select></td>
						</tr> -->
						<tr class="line">
							<td colspan="2"><hr></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div class="page_action_wrap">
				<input type="submit" id="saveDone" data-bypass=""
					class="btn btn-outline-secondary" data-role="button" value="저장" />
				<a id="saveContinueDone" data-bypass=""
					class="btn btn-outline-secondary" data-role="button"><span
					class="txt">계속등록</span></a> <a id="returnList" data-bypass=""
					class="btn btn-outline-secondary" data-role="button"><span
					class="txt">목록으로 이동</span></a> <a id="saveCancel" data-bypass=""
					class="btn btn-outline-secondary" data-role="button"><span
					class="txt">취소</span></a>
			</div>
		</form>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>