<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/top.jsp"%>
<%@ include file="addrmenu/addrMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>

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

#submitBtn {
	float: left;
	margin: 0 150px;
}


.imgst {
	width: 150px;
	height: 150px;
}


</style>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
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


$(function(){
	$('#saveDone').click(function(){
		if($('#name').val().length<1){
			Toastify({
	               text:"이름을 입력하세요.",
	               duration: 2000,
	               close:false,
	               gravity:"top",
	               position:"center",
	               backgroundColor:"black",
	            }).showToast();
			
			return false;
		}else if($('#email').val().length<1) {
			Toastify({
	               text:"이메일을 입력하세요.",
	               duration: 2000,
	               close:false,
	               gravity:"top",
	               position:"center",
	               backgroundColor:"black",
	            }).showToast();
			
			return false;
		}else if($('#hp').val().length<1){
			Toastify({
	               text:"휴대폰 번호를 입력하세요.",
	               duration: 2000,
	               close:false,
	               gravity:"top",
	               position:"center",
	               backgroundColor:"black",
	            }).showToast();
			
			return false;
		}
		
	})
});

  $(function() {
      $("#photoName").on('change', function(){
          readURL(this);
      });
  });

  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
              $('#image_section').attr('src', e.target.result);
          }

        reader.readAsDataURL(input.files[0]);
      }
  }


</script>

<div id="content">
	<header>
		<h1>
			<span id="title">연락처 수정</span>
		</h1>
	</header>

	<div class="content_page">
		<form id="contactCreateId" name="formContactCreate" method="post" enctype="multipart/form-data"
			action="<c:url value='/addrbook/addrEdit'/>">
				<input type="hidden" name="oldFileName" value="${vo.photoName }">
			<fieldset>
				<table class="form_type" >
					<colgroup>
						<col width="130px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th><span class="title">사진</span></th>
							<td><span class="img_profile" style="overflow: hidden">
									<img class="imgst"
									src="<c:url value='/addr_upload/${vo.photoName}'/>"
									alt="your image" id="image_section" data-filename="" data-filepath="">
									<br> <span class="wrap_btn wrap_file_upload"> <span
										class="btn_file_form fileinput-button"
										style="text-align: center;">  <input type="file" id="photoName" name="file" title="파일 첨부" ></span>
										<div class="progress" style="display: none; margin-top: 5px"></div></span>

							</span> 
							<!--  <span class="btn_fn7" id="del_photo" data-role="button">삭제</span>-->
								<div class="wrap_desc">
									<span class="desc">※ 사진은 자동으로 150x150 사이즈로 적용 됩니다.</span>
								</div></td>
						</tr>
						<tr>
							<input type="hidden" id="bookNo" name="bookNo" value="${vo.bookNo}"/>
							<th><span>이름</span> <span class="requirement">*</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" type="text" id="name" name="name"
								value="${vo.name}" required="required" />&nbsp; 
							</td>
						</tr>
						<tr>
							<th><span>회사</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" name="companyName" id="companyName"
								class="input wfix_large" type="text" value="${vo.companyName}" />
							</td>
						</tr>
						<tr>
							<th><span>부서</span></th>
							<td><input  class="form-control" style="width: 60%;display: inline;" name="deptName" id="deptName"
								class="input wfix_large" type="text" value="${vo.deptName}" />
							</td>
						</tr>
						<tr>
							<th><span>직위</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" name="posName" id="posName"
								class="input wfix_large" type="text" value="${vo.posName}" /> 

							</td>
						</tr>
						<tr>
							<th><span>이메일</span>	<span class="requirement">*</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" id="email" name="email" class="input wfix_large"
								type="text" value="${vo.email}" required="required" /> 
							</td>
						</tr>
						<tr>
							<th><span>휴대폰</span>	<span class="requirement">*</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" id="hp" name="hp" type="text" value="${vo.hp}"
								required="required" /> </td>
						</tr>
						<tr>
							<th><span>회사전화</span></th>
							<td><input class="form-control" style="width: 60%;display: inline;" name="corp_phone" id="corp_phone"
								 type="text" value="${vo.corpPhone}" />
								</td>
						</tr>
					<tr>
							<th><span class="title">주소</span></th>
							<td><span id="officeDetail" class="txt_edit">
									<div class="form-group">
										<input class="form-control"
											style="width: 40%; display: inline;" placeholder="우편번호"
											name="zipcode" id="zipcode" type="text" value="${vo.zipcode}"  readonly="readonly">
										<button type="button" class="btn btn-default"
											onclick="execPostCode();">
											<i class="fa fa-search"></i> 우편번호 찾기
										</button>
									</div>
									<div class="form-group">
										<input class="form-control" style="top: 5px;"
											placeholder="도로명 주소" name="address" id="address" type="text" value="${vo.address}" 
											readonly="readonly" />
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="상세주소" name="addressDetail"
											id="addressDetail" type="text" value="${vo.addressDetail}" />
									</div>
							</span> </td>
						</tr>
							<tr>
							<th><span class="title">메모</span></th>
							<td><span class="textarea"> <textarea name="memo"
										class="form-control"   value="${vo.memo}" ></textarea>
							</span></td>
						</tr>
						<tr class="line">
							<td colspan="2"><hr></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<div id="submitBtn">
				<input type="submit" id="editBtn" data-bypass=""
					class="btn btn-outline-info" data-role="button" value="저장" />
				<input type="button" id="cancleBtn" data-bypass=""
					class="btn btn-outline-secondary" data-role="button" value="취소" onclick
            ="location.href	='<c:url value='/addrbook/addrbook'/>'" />
			</div>
		</form>
		<div class="page_action_wrap">
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>