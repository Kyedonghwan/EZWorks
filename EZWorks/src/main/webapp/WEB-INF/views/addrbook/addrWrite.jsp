<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
body{
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
    
   h3{
   	padding:24px;
   }
   
   tr{
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
   td{
      font-size: 14px;
    color: #333;
    white-space: normal;
    letter-spacing: -0.5px;
    word-break: break-all;
    border-collapse: collapse;
    vertical-align: top;
    padding: 4px 24px 4px 0;
   }
</style>
<body>
<%@ include file="../include/top.jsp" %>																
<%@ include file="addrmenu/addrMenu.jsp" %>									
<%@ include file="../include/middle.jsp" %>
<h3>연락처 추가</h3>
<br>
<br>	
<div class="content_page">
	<form id="contactCreateId" name="formContactCreate" method="post" action="<c:url value='/addrbook/addrWrite'/>">
		<fieldset>
			<table class="form_type">
				<colgroup>
					<col width="130px">
					<col width="*">
				</colgroup>
				<tbody>
				<br>
				<!--<tr>
					<th><span class="title">사진</span></th>
					<td>
					<span class="img_profile" style="overflow:hidden">
						<span class="wrap_btn wrap_file_upload"><span class="btn_file_form fileinput-button" style="text-align: center;"><span class="button text"><span class="buttonText">사진 올리기</span></span><input type="file" name="file" title="파일 첨부" multiple="" accept="undefined"></span><div class="progress" style="display:none;margin-top:5px"></div></span>
						<img src="/resources/images/photo_profile_large.jpg" alt="" id="thumbnail_image" data-filename="" data-filepath="">
					</span>
					<span class="btn_fn7" id="del_photo" data-role="button">삭제</span>
                       <div class="wrap_desc"><span class="desc">※ 사진은 자동으로 150x150 사이즈로 적용 됩니다.</span></div>
					</td>
				</tr> -->
				<tr>
					<th><span class="title">이름</span>
						<ins class="asterisk">*</ins>
					</th>
					<td>
						<span class="txt_edit">
							<input name="name" value="" class="input wfix_large" type="text">
						</span>
					</td>
				</tr>
				<tr>
					<th><span class="title">회사</span>
					</th>
					<td><span class="txt_edit"><input name="companyName" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr>
					<th><span class="title">부서</span>
					</th>
					<td><span class="txt_edit"><input name="deptName" class="input wfix_large" type="text"></span></td>
				</tr>
								<tr>
					<th><span class="title">직위</span>
					</th>
					<td><span class="txt_edit"><input name="posName" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr class="line">
					<th><span class="title">그룹</span></th>
					<td>
						<ul id="groupNameTag" class="name_tag">
							<li class="creat" id="groupCreate">
									<span class="btn_wrap"><span class="ic_form ic_addlist"></span><span class="txt">그룹추가</span></span>
							</li>
						</ul>																		
					</td>
				</tr>
				<tr>
					<th><span class="title">이메일</span>
					</th>
						<td><span class="txt_edit"><input name="email" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr>
					<th>
                        <span class="title">휴대폰</span>
					</th>
						<td><span class="txt_edit"><input name="hp" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr>
					<th>
                        <span class="title">회사전화</span>
					</th>
					<td><span class="txt_edit"><input name="corp_phone" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr>
					<th><span class="title">주소</span></th>
					<td>
						<span id="officeDetail" class="txt_edit">
							<input name="company_basicAddress" class="input wfix_max" type="text" readonly="readonly">
							<input name="company_country" class="input wfix_max" type="hidden">
							<input name="company_postalCode" class="input wfix_max" type="hidden">
							<input name="company_state" class="input wfix_max" type="hidden">
							<input name="company_city" class="input wfix_max" type="hidden">
							<input name="company_extAddress" class="input wfix_max" type="hidden">
							<span title="상세주소입력" class="ic_con ic_detail" evt-rol="viewLayerAddress" type="office"></span>
						</span>
					</td>
				</tr>
				<tr>
					<th><span class="title">메모</span></th>
					<td>
						<span class="textarea">
							<textarea name="memo" class="edit w_max"></textarea>									
						</span>
					</td>
				</tr>
				<!--  hidden  -->
				<tr style="display:none">
					<th>
						<span class="title">애칭</span>
					</th>
					<td>
						<span class="txt_edit"><input name="nickName" class="input wfix_large" type="text"></span>
					</td>
				</tr>
				<tr style="display:none">
					<th>
						<span class="title">생일</span>
					</th>
					<td>
						<span class="noti_date_wrap option_wrap">
							<input name="birthday" class="input wfix_large" type="text" id="birthdayDate">
							<span id="birthdayDateIcon" class="ic ic_calendar"></span>
						</span>
					</td>
				</tr>
				<tr style="display:none">
					<th>
						<span class="title">기념일</span>
					</th>
					<td>
						<span class="noti_date_wrap option_wrap">
							<input name="anniversary" class="input wfix_large" type="text" id="anniversaryDate">
							<span id="anniversaryDateIcon" class="ic ic_calendar"></span>
						</span>
					</td>
				</tr>
				<tr style="display:none">
					<th>
						<span class="title">집 전화</span>
					</th>
					<td>
						<span class="txt_edit"><input name="home_tel" class="input wfix_large" type="text"></span>
					</td>
				</tr>
				<tr style="display:none">
					<th>
						<span class="title">집 주소</span>
					</th>
					<td>
						<span id="homeDetail" class="txt_edit">
							<input name="home_basicAddress" class="input wfix_max" type="text" readonly="readonly">
							<input name="home_country" class="input wfix_max" type="hidden">
							<input name="home_postalCode" class="input wfix_max" type="hidden">
							<input name="home_state" class="input wfix_max" type="hidden">
							<input name="home_city" class="input wfix_max" type="hidden">
							<input name="home_extAddress" class="input wfix_max" type="hidden">
							<span title="상세주소입력" class="btn btn-outline-secondary" evt-rol="viewLayerAddress" type="office"></span>
						</span>
					</td>
				</tr>
				<tr style="display:none">
					<th>
						<span class="title">집 팩스</span>
					</th>
					<td>
						<span class="txt_edit"><input name="home_fax" class="input wfix_large" type="text"></span>
					</td>
				</tr>
				<tr style="display:none">
					<th><span class="title">집 홈페이지</span>
					</th>
					<td><span class="txt_edit"><input name="home_homepage" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr style="display:none">
					<th>
                        <span class="title">회사 팩스</span>
					</th>
					<td><span class="txt_edit"><input name="company_fax" class="input wfix_large" type="text"></span></td>
				</tr>
				<tr style="display:none">
					<th><span class="title">회사 홈페이지</span>
					</th>
					<td><span class="txt_edit"><input name="company_homepage" class="input wfix_large" type="text"></span></td>
				</tr>
				<!--  hidden  -->
				
				<tr>
					<th><span class="title">항목추가</span></th>
					<td>
						<select name="contactItem">
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
						</select>
					</td>
				</tr>
				<tr class="line"><td colspan="2"><hr></td></tr>						
				</tbody>
			</table>
		</fieldset>
	<div class="page_action_wrap">
		<input type="submit" id="saveDone" data-bypass="" class="btn btn-outline-secondary" data-role="button" value="저장" />
		<a id="saveContinueDone" data-bypass="" class="btn btn-outline-secondary" data-role="button"><span class="txt">계속등록</span></a>
		<a id="returnList" data-bypass="" class="btn btn-outline-secondary" data-role="button"><span class="txt">목록으로 이동</span></a>
		<a id="saveCancel" data-bypass="" class="btn btn-outline-secondary" data-role="button"><span class="txt">취소</span></a>				
	</div>
	</form>
</div>
<%@ include file="../include/bottom.jsp" %>
</body>
</html>