<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
  <meta charset="utf-8">
   <script src="../resources/js/jquery-3.6.0.min.js"></script> <!-- 값 제어를 위해 jquery -->
    <link href="../resources/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
    <script src="../resources/datepicker/js/datepicker.js"></script> <!-- Air datepicker js -->
    <script src="../resources/datepicker/js/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
  <script>
 
  datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

  /*
      * 달력 생성기
      * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
      * @example   datePickerSet($("#datepicker"));
      * 
      * 
      * @param sDate, 
      * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
      * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
      */
  function datePickerSet(sDate, eDate, flag) {

      //시작 ~ 종료 2개 짜리 달력 datepicker	
      if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
          var sDay = sDate.val();
          var eDay = eDate.val();

          if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
              var sdp = sDate.datepicker().data("datepicker");
              sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

              var edp = eDate.datepicker().data("datepicker");
              edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
          }

          //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
          if (!isValidStr(eDay)) {
              sDate.datepicker({
                  maxDate: new Date(eDay.replace(/-/g, "/"))
              });
          }
          sDate.datepicker({
              language: 'ko',
              autoClose: true,
              onSelect: function () {
                  datePickerSet(sDate, eDate);
              }
          });

          //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
          if (!isValidStr(sDay)) {
              eDate.datepicker({
                  minDate: new Date(sDay.replace(/-/g, "/"))
              });
          }
          eDate.datepicker({
              language: 'ko',
              autoClose: true,
              onSelect: function () {
                  datePickerSet(sDate, eDate);
              }
          });

          //한개짜리 달력 datepicker
      } else if (!isValidStr(sDate)) {
          var sDay = sDate.val();
          if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
              var sdp = sDate.datepicker().data("datepicker");
              sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
          }

          sDate.datepicker({
              language: 'ko',
              autoClose: true
          });
      }


      function isValidStr(str) {
          if (str == null || str == undefined || str == "")
              return true;
          else
              return false;
      }
  }
  </script>

<style>
.writeLabel{
	width: 20%;
	float: left;
	text-align: left;
	padding: 5px 10px 20px 10px;
	clear: left;		
}
@media screen { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 25%;
        }
}
.modal-body{
	margin-top: 20px;
}

.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
.modal {
        text-align: center;
}
.input{
	 	width: 55%;
		height: 1.5em;
		font-size: 0.9em;
		margin : 5px 0 20px 0;
}
.chkbox, .selectSch{
	margin : 10px 0 25px 0;
}
.datepick{
	width: 15%;
		height: 1.5em;
		font-size: 0.9em;
		margin : 5px 0 20px 0;
}

</style>
<div class="modal" tabindex="-1" id="writeModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form name="writeSch" method="post"
		action="<c:url value='/calendar/calendarMain'/>">
		<div class="modal-dialog">
					<div class="modal-content" style="width:700px;height: 450px">
						<div class="modal-header">
							<h5 class="modal-title">일정등록</h5>
							<button type="button" class="close rounded-pill"
								data-bs-dismiss="modal" aria-label="Close">
								<i data-feather="x"></i>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<label class="writeLabel">
									일정명
								</label>
								<input type="text" value="" class="input">
							</div>
							<div>
								<label class="writeLabel">일시</label>
								<input type="text" id="datepicker1" name="from" class="datepick">
								<label for="to">~</label>
								<input type="text" id="datepicker2" name="to" class="datepick">
								<input type="checkbox" value="종일" class="chkbox">종일
							</div>
							<div>
								<label class="writeLabel">전사일정</label>
								<input type="checkbox" value="전사일정" class="chkbox">전사일정
							</div>
							<div>
								<label class="writeLabel">내 캘린더</label>
								<select class="selectSch">
									<option>(기본)내 일정</option>
									<option>내 일정(중요)</option>
									<option>연차</option>
								</select>
							</div>
							<div>
								<label class="writeLabel">장소</label>
								<input type="text" class="input">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">일정상세입력</span>
							</button>
							<button type="button" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">확인</span>
							</button>
							<button type="button" class="btn btn-light-primary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> <span
									class="d-none d-sm-block">닫기</span>
							</button>
							
						</div>
					</div>
				</div>
	</form>
</div>
