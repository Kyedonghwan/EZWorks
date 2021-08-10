<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/summernote/summernote-lite.min.css'/>">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

<style>
	/* sign_type1 */
div.sign_type1 {display: inline-block; margin-right: -1px; font-size: 12px}
div.sign_type1.last table.tb_sign_type1 {border-left: 0}
div.sign_type1 table.tb_sign_type1, table.sign_member {border-spacing: 0; border-collapse: collapse;width:60px}
div.sign_type1 table.tb_sign_type1 {border: 1px solid #666}
div.sign_type1 table.tb_sign_type1 tbody tr th {width: 20px; background: #eee; padding: 4px; text-align: center; word-break: break-word; white-space: normal}
div.sign_type1 table.tb_sign_type1 tbody tr td {border-left: 1px solid #666; padding: 0!important}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td {height: 26px; border-left: 0; border-bottom: 1px solid #666; min-height:26px; vertical-align: middle}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.last {border-bottom: 0}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span {display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 70px; padding: 4px; font-size:12px }
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_name {height: 36px}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.arbitrary {background: url(../images/arbitrary.gif) no-repeat}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span img {width: auto; height: 100%}
div.sign_type1 table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.doc_return {padding:0;}

/* sign_type_new */
div.sign_type_new {display: inline-block; margin-right: -1px; font-size: 12px}
div.sign_type_new.last table.tb_sign_type1 {border-left: 0}
div.sign_type_new table.tb_sign_type1 {border: 1px solid #666}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_name {height: auto}
div.sign_type_new table.tb_sign_type1 tbody tr th {width: 15px; background: #eee; padding: 6px; text-align: center; word-break: break-word; white-space: normal}
div.sign_type_new table.tb_sign_type1 tbody tr td {border-left: 1px solid #666; padding:0 !important}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td {height: 26px; border-left: 0; border-bottom: 1px solid #666; min-height:26px}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.last {border-bottom: 0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span {display: block; text-align: center; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 70px; font-size:12px; padding: 2px 4px}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_name,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_position,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_rank,
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_type {height: 48px; text-align: center}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_sign {height: 74px;text-align: center;}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_stamp {height: 40px; padding-bottom: 0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.sign_stamp img {width: auto; height: 100%}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td span.arbitrary {background: url(../images/arbitrary.gif) no-repeat; height: 36px; padding:0}
div.sign_type_new table.tb_sign_type1 tbody tr td table.sign_member tbody tr td.wrap_arbitrary {padding:0}

span.sign_type2 span.sign_member {border: 1px solid #000; padding: 4px; display:block; margin: 0 0 -1px}
span.sign_type2 span.sign_member span.name {color: #333}
span.sign_type2 span.sign_member span.date {margin: 0!important}
span.sign_type2 span.sign_member span.rank {margin: 0 0 0 4px}

/* sign_type1_iline */
.sign_type1_inline {position: relative; display: inline-table!important; border-collapse: separate; border-spacing: 0; white-space: normal; font-size: 12px; margin: 1px -1px 0 0; padding-left: 26px;}
.sign_type1_inline:after {display: block; clear: left; overflow: hidden; height: 0; content: ''}
.sign_type1_inline:empty {padding-left: 0;}
.sign_type1_inline .sign_tit_wrap {position: absolute; top: -1px; left: 0; bottom: 0; vertical-align: middle; border: 1px solid #000; width: 24px; background: #eee; display: table-cell}
.sign_type1_inline .sign_tit_wrap .sign_tit {display: table; padding: 0 2px; text-align: center; word-break: break-all; white-space: normal; height: 100%}
.sign_type1_inline .sign_tit_wrap .sign_tit strong {display: table-cell; vertical-align: middle}
.sign_type1_inline .sign_member_wrap {vertical-align: top; background: #fff; display: table-cell; float: left; border: 1px solid #000; border-left: 0; margin: -1px 0 0 0}
.sign_type1_inline .sign_member_wrap .sign_member {width: 79px; vertical-align: top; display: table; table-layout: fixed}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank_wrap, .sign_type1_inline .sign_member_wrap .sign_member .sign_date_wrap {display: table-row}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank, .sign_type1_inline .sign_member_wrap .sign_member .sign_wrap, .sign_type1_inline .sign_member_wrap .sign_member .sign_date {display: table-cell; vertical-align: middle; text-align: center; width: 79px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_rank {height: 26px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap {height: 75px; border-top: 1px solid #000}
.sign_type1_inline strong {font-weight:bold;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap .arbitrary { background: url(../images/arbitrary.gif) no-repeat; height: 40px; width: 79px; padding: 0;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_date {height: 26px; border-top: 1px solid #000}
.sign_type1_inline .sign_member_wrap .sign_member .sign_stamp {width: 79px; height: 40px}
.sign_type1_inline .sign_member_wrap .sign_member .sign_stamp img {width: auto;  height: 100%;}
.sign_type1_inline .sign_member_wrap .sign_member .sign_wrap > span {padding: 2px 0; display: block}
.sign_type1_inline .sign_rank, .sign_type1_inline .sign_name, .sign_type1_inline .sign_position, .sign_type1_inline .sign_type, .sign_type1_inline .sign_date {overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 79px; }
.sign_arbitrary {background: url(../images/arbitrary.gif) no-repeat; height: 40px; width: 79px; padding: 0;}
	
</style>
<div class="container">
   
    <!-- end row -->
	<section style="height:64px;padding:24px 24px 16px">
		<h5>
			<a>
				<input type="hidden" id="currentFormNo" value="3"><c:if test="${approval.currentState!='임시저장'}">${approval.form3Title }</c:if><c:if test="${approval.currentState=='임시저장'}">임시 저장 문서: ${approval.form3Title} (<fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd hh시MM분 저장됨"/>)</c:if><span style="font-size:15px;color:#999"> in 연장근무신청서</span>
			</a>			
		</h5>
		
	</section>
	<form id="previewFrm" target="preview" action="<c:url value="/approval/preview"/>" method="post">
		<input type="hidden" name="previewContent">
	</form>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
                    	<c:if test="${myEmpNo!=null && approval.empNo==myEmpNo && approval.currentState=='진행중'}">
                       		<button type="button" class="btn btn-primary btn-sm cancelDraftBtn">상신취소</button>
                       		</c:if>
                       	<c:if test="${approvalLineOrder!=null && approvalLineOrder==approval.currentOrder && approval.currentState=='진행중'}">
	                    	<button type="button" class="btn btn-primary btn-sm agreeBtn">결재</button>
							<button type="button" class="btn btn-primary btn-sm disagreeBtn">반려</button>
							<button type="button" class="btn btn-primary btn-sm stopBtn">보류</button>
						</c:if>
						<c:if test="${approvalLineOrder!=null}">
							<c:if test="${(approvalLineOrder+1)==approval.currentOrder && approval.currentState=='진행중'}">
								<button type="button" class="btn btn-primary btn-sm cancelBtn">결재취소</button>
							</c:if>
						</c:if>
						<c:if test="${approval.currentState=='임시저장'}">
                        	<button type="button" class="btn btn-primary btn-sm approvalBtn">결재요청</button>
							<button type="button" class="btn btn-primary btn-sm tempSaveBtn">임시저장</button>
							<button type="button" class="btn btn-primary btn-sm cancelBtn">취소</button>
							<button type="button" class="btn btn-primary btn-sm approvalInfoBtn">결재정보</button>
						</c:if>
						<button type="button" class="btn btn-primary btn-sm previewBtn">미리보기</button>
                        <div style="border:3px solid gray;margin-top:20px;padding:20px">
                        	<table id="range">
                        		<tr>
                        			<td colspan="2">
                        			
                        			
                        				<div class="approval_import ie9-scroll-fix">
										    <!-- 문서 내용 표시 테스트 -->
										    <form id="document_content" class="form_doc_editor editor_view" onsubmit="return false;"><table class="__se_tbl" style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;">
										 <!-- Header --> 
										 <tbody> 
										  <tr> 
										   <td style="width:300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">연장근무신청서</td> 
										  </tr> 
										  <tr> 
										   <td style="width:300px; border: 0; padding: 0 !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"> 
										    <table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;">
										     <!-- User --> 
										     <tbody> 
										      <tr> 
										       <td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">기안자</td> 
										       <td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftUser}}" name="draftUser" id="draftUser" value="${vo['EMP_NAME']}" data-id="draftUser" data-name="draftUser" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="김상후" placeholder=""></td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안부서</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftDept}}" name="draftDept" id="draftDept" value="${vo['DEPT_NAME']}" data-id="draftDept" data-name="draftDept" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="다우그룹" placeholder=""></td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안일</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftDate}}" name="draftDate" id="draftDate" value="<c:if test="${approval.currentState!='임시저장'}"><fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd "/></c:if>" data-id="draftDate" data-name="draftDate" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="2021-08-05(목)" placeholder=""> </td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">문서번호</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:docNo}}" name="docNo" value="${vo['APPROVAL_STRINGNO']}" data-id="docNo" data-name="docNo" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="" placeholder=""> </td> 
										      </tr> 
										     </tbody> 
										    </table> </td> 
										   
													<td style="width: 500px; text-align: right; padding: 0px!important; border: 0!important; vertical-align: top !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"> 
										   				<span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="1" data-group-type="type1" data-is-reception="" id="drafterArea">
															<span class="sign_tit_wrap">
																<span class="sign_tit">
																	<strong>신청</strong>
																</span>
															</span>
															<span class="sign_member_wrap" id="activity_15824">
																<span class="sign_member">
																	<span class="sign_rank_wrap">
																		<span class="sign_rank">${vo['POS_NAME']}</span>
																	</span>
																	<span class="sign_wrap">
																		<c:if test="${approval.currentState!='임시저장'}">
																			<span class="sign_stamp">
																				<img src="https://tour.daouoffice.com/resources/images/stamp_approved.png">
																			</span>
																		</c:if>
																		<span class="sign_name"> <strong> ${vo['EMP_NAME']} </strong> 
																		</span>
																	</span>
																	<span class="sign_date_wrap">
																		<span class="sign_date" id="date_15824"><c:if test="${approval.currentState!='임시저장'}"><fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy/MM/dd"/></c:if></span>
																	</span>
																</span>
															</span>
													</span>
													
												<c:if test="${approval.currentOrder!=0}">
													<span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="10" data-group-type="type1" data-is-reception="">
														<span class="sign_tit_wrap">
															<span class="sign_tit">
																<strong>승인</strong>
															</span>
														</span>
												</c:if>
												
														<c:forEach var="item" items="${stampList}">
															<span class="sign_member_wrap">
																<span class="sign_member">
																	<span class="sign_rank_wrap">
																		<span class="sign_rank">${item["POS_NAME"] }</span>
																	</span>
																	<span class="sign_wrap">
																		<c:if test="${item['CURRENT_STATE']=='결재완료'}">
																			<span class="sign_stamp">
																			<img src="https://tour.daouoffice.com/resources/images/stamp_approved.png">
																			</span>
																		</c:if>
																		<span class="sign_name">${item["EMP_NAME"] }</span>
																	</span>
																	<span class="sign_date_wrap">
																		<span class="sign_date">
																			<c:if test="${item['CURRENT_STATE']=='결재완료'}">
																				<fmt:formatDate value="${item['AL_REGDATE']}" pattern="yyyy/MM/dd"/>
																			</c:if>
																			<c:if test="${item['CURRENT_STATE']=='반려'}">
																				<fmt:formatDate value="${item['AL_REGDATE']}" pattern="MM/dd(반려)"/>
																			</c:if>
																		</span>
																	</span>
																</span>
															</span>
														</c:forEach>
														
													<c:if test="${approval.currentOrder!=0}">	
														</span>
													</c:if>
													
													<span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><br>
													</td>
										  </tr> 
										 </tbody> 
										</table> 
										<br> 
										<span id="timelineApprovalFormSection"> 
										 <table id="timelineApprovalForm" class="__se_tbl" style="width: 800px; margin-top : 0px; margin-bottom:20px; border-collapse: collapse !important; color: black; background: white; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"> 
										  <tbody> 
										   <tr> 
										    <td colspan="4" style="width:800px; background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">신청&nbsp;현황</td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> <b style="color: rgb(255, 0, 0);">*</b>근무구분</td> 
										    <td id="name" colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"> 
										    <span>${approval.form20Div }</span>
										    <span style="font-size: 12px;">* * 자정 이후 근무시작인 경우 날짜를 다음날로 지정해주세요.</span></td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> <b style="color: rgb(255, 0, 0);">*</b>근무일시</td> 
										    
										   <td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"> <input type="text" readonly="" disabled value="${approval.form20Startdate }" class="ipt_editor ipt_editor_date" data-dsl="{{calendar:startDate}}" id="startdate">
										    <span id="startTime"> <span data-type="time" data-value="">${approval.form20A }시 ${approval.form20B }분 
										   </span> </span> ~&nbsp; 
										   <span id="endTime"> <span data-type="time" data-value="">${approval.form20C }시 ${approval.form20D }분 
										   </span> </span> </td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"><b style="color: rgb(255, 0, 0);">*</b>근무시간</td> 
										    <td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);"> <span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${approval.form20E }</span> </td> 
										   </tr> 
										   <tr> 
										    <td colspan="4" style="width:800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: rgb(255, 255, 255);"> <p> * 주간 근무시간 - 근무일이 포함된 한 주 </p> <p> 정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다. </p> <p> 근태관리에서 시간 수정이 가능하므로 주간 근무시간은 상이해질 수 있습니다. </p> </td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> <b style="color: rgb(255, 0, 0);">*</b>신청&nbsp;사유 </td> 
										    <td colspan="3" style="padding: 3px; border: 1px solid black; width: 450px; height: 100px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: top; background: rgb(255, 255, 255);"> <textarea class="txta_editor" style="width:100%;height:100%" data-dsl="{{textarea:description}}" name="description" id="description" value="${apprvoal.description }" disabled data-id="description" data-name="description" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="" placeholder=""></textarea> </td> 
										   </tr> 
										    
										  </tbody> 
										 </table> </span> 
										</form>
										</div>
                        		</tr>
                        		<tr>
                        			<td style="font-weight:bold">파일첨부
                        			</td>
                        			<td>
                        				<c:if test="${approval.currentState=='임시저장'}">
	                        				 <form method="post" name="approvalFrm" action="<c:url value='/approval/insert'/>" enctype="multipart/form-data">
													<input type="hidden" value="연장근무신청서" id="approvalName1">
													<input type="hidden" name="formNo">
											     	<input type="hidden" name="approvalStringNo">
											     	<input type="hidden" name="form3Title">
											     	<textarea style="display:none" name="form3Content"></textarea>
											     	<input type="hidden" name="emergency">
											     	<input type="hidden" name="currentState" value="진행중">
											     	<input type="hidden" name="currentOrder" id="currentOrder">
											     	<input name="form20Div" type="hidden">
											      	<input name="form20Startdate" type="hidden">
											      	<input name="form20A" type="hidden">
											      	<input name="form20B" type="hidden">
											      	<input name="form20C" type="hidden">
											      	<input name="form20D" type="hidden">
											      	<input name="form20E" type="hidden">
											      	<input name="form20Description" type="hidden">
											     	<div id="isNotExisted">
											     		<input name="alEmpNo" type="hidden" >
												      	<input name="alDeptNo" type="hidden">
												      	<input name="alOrderNo" type="hidden">
												      	<input name="referenceEmpNo" type="hidden">
												      	<input name="referenceDeptNo" type="hidden">
												      	<input name="browseEmpNo" type="hidden">
												      	<input name="receptionEmpNo" type="hidden">
												      	
											   		</div>
											   		<div id="isExisted">
											   		</div>
												   	<input type="hidden" name="tempApprovalNo" <c:if test="${ approval!=null && approval.currentState=='임시저장'}">value="${param.approvalNo}"</c:if>>
												 	<textarea style="display:none" name='approvalDraftingOpinion'></textarea>
												 	<input type="file" class="multiple-files-filepond" name="file" multiple="true">
										</form>	
							                	
							                </c:if>
							                <c:if test="${approval.currentState!='임시저장'}">
							                	<div style="padding:4px 8px;color:black;" id="attachFile">
							                		
							                	</div>
							                </c:if>
						               
                        			</td>
                        		</tr>
                        		<c:set var="idx" value="0"/>
	                        		<c:forEach var="item" items="${fileList}">
	                        		<tr>
	                        			<td style="width:20%">
	                        			</td>
	                        			<td style="width:80%">
	                        				<p style="background:#f4f4f4;" >
	                        				<c:if test="${item.ext == 'pdf'}"><img src="https://img.icons8.com/color/24/000000/pdf.png"/></c:if>
	                        				<c:if test="${item.ext == 'png'}"><img src="https://img.icons8.com/office/24/000000/png.png"/></c:if>
	                        				<c:if test="${item.ext == 'jpg'}"><img src="https://img.icons8.com/office/24/000000/jpg.png"/></c:if>
	                        				<c:if test="${item.ext != 'jpg' && item.ext != 'png' && item.ext != 'pdf' }"><img src="https://img.icons8.com/office/24/000000/file.png"/></c:if>
	                        				<a href="#" style="background:#f4f4f4;color:black;" class="downloadBtn"> ${item.afOriginalfilename} </a><span style='color:#999' class="afFileSize">${item.afFilesize}</span></p>
	                        				<form name="downloadFrm${idx}" method="post" action="<c:url value='/approval/download'/>">
	                        					<input type="hidden" name="afFilename" value="${item.afFilename}">
	                        					<input type="hidden" name="afOriginalfilename" value="${item.afOriginalfilename}">
	                        				</form>
	                        			</td>
	                        		</tr>
	                        		<c:set var="idx" value="${idx + 1}"/>
	                        		</c:forEach>
                        		<tr>
                        			<td style="font-weight:bold">관련문서
                        			</td>
                        			<td>
                        				<c:if test="${approval.currentState=='임시저장'}">
                        					<button type="button" class="btn btn-primary btn-sm" id="searchApproval">문서검색</button>
                        				</c:if>
	                        		</td>
                        		</tr>
                        		<c:if test="${approval.currentState!='임시저장'}">
	                        		<c:forEach var="raVo" items="${raList }">
	                        			<tr>
	                        				<td style="width:20%"></td>
	                        				<td style="width:80%" class="raRow">
	                        					<p style="background:#f4f4f4;">
	                        					<img src="https://img.icons8.com/office/24/000000/file.png"> 
	                        					<span style="color:black">${raVo.raapprovalName}</span>
	                        					<input type="hidden" value="${raVo.raapprovalNo}">&nbsp;
	                        					<button type="button" class="btn btn-primary btn-sm previewRABtn">미리보기</button>
	                        				</td>
	                        			</tr>
	                        		</c:forEach>
                        		</c:if>
                        	</table>
                        	<c:if test="${approval.currentState!='임시저장'}">
	                        	<div class="tab-pane fade show active" id="commentList" style="margin-top:30px;border-top:1px solid #999">
								  	<ul style="padding-left:0px">
								  	</ul>
								  	<div style="height:50px;list-style:none;padding-left:5px;padding-top:15px;height:65px;">
								  			<div style="float:left;width:40px">
								  				<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">
								  			</div>
								  			<div style="float:left; margin-left:10px;width:82%;height:60px;">
								  				<input type="text" class="form-control" style="width: 100%;height:100%;margin-left: 5px;" name="acContent" placeholder="댓글을 입력해주세요.">
								  			</div>
								  			<button style="float:left;width:10%;margin-left:20px" type="button" class="btn btn-primary" id="wc">댓글작성</button>
								  </div>
								 </div>
							 </c:if>
                        </div>
                       
                        <div style="border:3px solid gray;margin-top:20px;padding:0px 20px">
                        	<ul class="nav nav-tabs">
							  <li class="nav-item">
							    <a class="nav-link active" data-toggle="tab" href="#approvalLineDetail">결재선</a>
							  </li>
							  <li class="nav-item">
							    <a class="nav-link" data-toggle="tab" href="#formInfoDetail">문서정보</a>
							  </li>
							</ul>
							<div class="tab-content">
							  <div class="tab-pane fade show active" id="approvalLineDetail">
							  	<ul style="padding-left:0px">
							  		<li style="height:50px;list-style:none;padding-left:5px;padding-top:15px;padding-bottom:15px;height:120px;background-color:#f2f7ff">
							  			<div style="float:left;width:50px">
							  				<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">
							  			</div>
							  			<div style="float:left; margin-left:10px;height:100%;">
							  				<div style="font-size:15px;font-weight:bold;color:#00001f">${vo['EMP_NAME']} ${vo['POS_NAME'] }</div>
							  				<div style="font-size:15px;color:#9f9f9f">${vo['DEPT_NAME']}</div>
							  				<div style="font-size:15px;color:#9f9f9f"><c:if test="${approval.currentState!='임시저장'}">기안 상신&nbsp;|&nbsp;<fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd(E) hh:MM"/></c:if><c:if test="${approval.currentState=='임시저장'}">기안</c:if></div>
							  				<c:if test="${approval.approvalDraftingOpinion!=null}">
							  					<c:if test="${approval.currentState!='임시저장'}">
							  						<p style="padding:4px 8px;background:#f4f4f4;color:black;font-weight:bold;margin-top:8px">${approval.approvalDraftingOpinion}</p>
							  					</c:if>
							  				</c:if>
							  			</div>
							  		</li>
							  		<c:forEach var="item" items="${stampList}">
							  			<li style="height:50px;list-style:none;padding-left:5px;padding-top:15px;padding-bottom:15px;height:120px;background-color:#f2f7ff">
								  			<div style="float:left;width:50px">
								  				<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">
								  			</div>
								  			<div style="float:left; margin-left:10px;height:100%;">
								  				<div style="font-size:15px;font-weight:bold;color:#00001f">${item['EMP_NAME']} ${item['POS_NAME'] }<input type="hidden" name="empNo" value="${item['EMP_NO']}"></div>
								  				<div style="font-size:15px;color:#9f9f9f">${item['DEPT_NAME']}<input type="hidden" name="deptNo" value="${item['DEPT_NO']}"></div>
								  				<div style="font-size:15px;color:#9f9f9f">
								  					<c:if test="${approval.currentState!='임시저장'}">
									  					<c:if test="${approval.currentOrder==item['AL_ORDER']&& item['CURRENT_STATE']==null}">
									  					결재 대기</c:if>
									  					<c:if test="${approval.currentOrder!=item['AL_ORDER']&& item['CURRENT_STATE']==null}">결재 예정</c:if>
									  					<c:if test="${item['CURRENT_STATE']=='결재완료'}">결재 완료</c:if>
									  					<c:if test="${item['CURRENT_STATE']=='반려'}">반려</c:if>
									  					<c:if test="${item['AL_REGDATE']!=null }">&nbsp;|&nbsp;<fmt:formatDate value="${item['AL_REGDATE']}" pattern="yyyy-MM-dd(E) hh:MM"/></c:if>
								  					</c:if>
								  					<c:if test="${approval.currentState=='임시저장'}">
								  						결재
								  					</c:if>
								  				</div>
								  				<c:if test="${item['AL_OPINION']!=null}">
								  					<c:if test="${approval.currentState!='임시저장'}">
								  						<p style="padding:4px 8px;background:#f4f4f4;color:black;font-weight:bold;margin-top:8px">${item['AL_OPINION']}</p>
								  					</c:if>
								  				</c:if>
								  			</div>
							  			</li>
							  		</c:forEach>
							  	</ul>
							  </div>
							  <div class="tab-pane fade" id="formInfoDetail" style="height:350px;width:100%">
							  	<table style="height:100%;width:100%">
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서번호</th>
							  			<td style="color:#00001f;font-weight:bold;font-size:14px" id="approvalStringNo">${approval.approvalStringNo}</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">비밀등급</th>
							  			<td style="color:#00001f;font-weight:bold;font-size:14px">상</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">보안수준</th>
							  			<td style="color:#00001f;font-weight:bold;font-size:14px">5년</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">기안부서</th>
							  			<td style="color:#00001f;font-weight:bold;font-size:14px">${vo['DEPTNAME']}</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서참조</th>
							  			<td id="formDetail3">
							  				<c:forEach var="item" items="${reference }">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}<input type="hidden" name="empNo" value="${item['EMP_NO']}"><input type="hidden" name="deptNo" value="${item['DEPT_NO']}"></span>
							  				</c:forEach>
							  			</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서열람</th>
							  			<td id="formDetail4">
							  				<c:forEach var="item" items="${browse }">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}<input type="hidden" name="empNo" value="${item['EMP_NO']}"></span>
							  				</c:forEach>
							  			</td>
							  			
			
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서수신</th>
							  			<td id="formDetail2">
							  				<c:forEach var="item" items="${reception}">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}<input type="hidden" name="empNo" value="${item['EMP_NO']}"></span>
							  				</c:forEach>
							  			</td>
							  		</tr>
							  	</table>
							  </div>
							</div>
                        </div>
                        
                        <div style="margin-top:20px;padding-top:0px">
                        	<c:if test="${myEmpNo!=null && approval.empNo==myEmpNo && approval.currentState=='진행중'}">
                        		<button type="button" class="btn btn-primary btn-sm cancelDraftBtn">상신취소</button>
                        	</c:if>
                        	<c:if test="${approvalLineOrder!=null && approvalLineOrder==approval.currentOrder && approval.currentState=='진행중'}">
		                    	<button type="button" class="btn btn-primary btn-sm agreeBtn">결재</button>
								<button type="button" class="btn btn-primary btn-sm disagreeBtn">반려</button>
								<button type="button" class="btn btn-primary btn-sm stopBtn">보류</button>
							</c:if>
							<c:if test="${approvalLineOrder!=null}">
								<c:if test="${(approvalLineOrder+1)==approval.currentOrder && approval.currentState=='진행중'}">
									<button type="button" class="btn btn-primary btn-sm cancelBtn">결재취소</button>
								</c:if>
							</c:if>
							<c:if test="${approval.currentState=='임시저장'}">
	                        	<button type="button" class="btn btn-primary btn-sm approvalBtn">결재요청</button>
								<button type="button" class="btn btn-primary btn-sm tempSaveBtn">임시저장</button>
								<button type="button" class="btn btn-primary btn-sm previewBtn">미리보기</button>
								<button type="button" class="btn btn-primary btn-sm cancelBtn">취소</button>
								<button type="button" class="btn btn-primary btn-sm approvalInfoBtn">결재정보</button>
							</c:if>
							<button type="button" class="btn btn-primary btn-sm previewBtn">미리보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
</div>

    

							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	
<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>
<script src="<c:url value='/resources/vendors/apexcharts/apexcharts.js'/>"></script>
<script src="<c:url value='/resources/js/pages/dashboard.js'/>"></script>
<script src="<c:url value='/resources/js/archiveSidebar.js'/>"></script>
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/vendors/summernote/summernote-lite.min.js'/>"></script>
<script type="text/javascript">

	$(document).on('click','.previewRABtn',function(){
		var approvalNo = $(this).prev().val();
		window.open("<c:url value="/approval/raPreview?approvalNo="/>"+approvalNo,"_blank","width=850,height=1000");
	})
	
    $('#summernote').summernote({
        tabsize: 2,
        height: 540,
    });
    
    $(document).on('click','.downloadBtn',function(){
    	$(this).parent().next().submit();
    })
    
    function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return betweenTime+'분전';
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return betweenTimeHour+'시간전';
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return betweenTimeDay+'일전';
        }

        return Math.floor(betweenTimeDay / 365)+'년전';
 }
    
    $.showCommentList = function(){
    	var approvalNo=${param.approvalNo};
    	
    
    	
		$.ajax({
			url:"<c:url value='/approvalComment/showAll'/>",
			type:"get",
			dataType:"json",
			data:{"approvalNo":approvalNo},
			success:function(res){
				var temp="";
				$.each(res,function(idx,item){
					temp+='<li style="height:50px;list-style:none;padding-left:5px;padding-top:15px;padding-bottom:7px;height:90px;">';
					temp+='<div style="float:left;width:40px">';
					temp+='<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">';
					temp+='</div>';
					temp+='<div style="float:left; margin-left:10px;height:100%;">';
					temp+='<div style="font-size:15px;font-weight:bold;color:#00001f">'+this.EMP_NAME+' '+this.POS_NAME+'<span style="color:#999;margin-left:15px">'+ timeForToday(this.AC_REGDATE)+'</span></div>';
					temp+='<p style="padding:4px 8px;background:#f4f4f4;color:black;font-weight:bold;margin-top:8px">a'+this.AC_CONTENT+'</p>';
					temp+='</div>';
					temp+='</li>';
				})
				$('#commentList').children().eq(0).html(temp);
			},
			error:function(e){
				alert("ajax 전자결재 댓글 리스트 목록 에러");
			}
		})
	}
    

	$.byte=function(fileSize, fixed) {
	    var str
	
	    //MB 단위 이상일때 MB 단위로 환산
	    if (fileSize >= 1024 * 1024) {
	        fileSize = fileSize / (1024 * 1024);
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' MB';
	    }
	    //KB 단위 이상일때 KB 단위로 환산
	    else if (fileSize >= 1024) {
	        fileSize = fileSize / 1024;
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' KB';
	    }
	    //KB 단위보다 작을때 byte 단위로 환산
	    else {
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' Byte';
	    }
	    return str;
	}
    
    
    $(function(){
    	$('.previewBtn').click(function(){
    		$('input[name=previewContent]').val($('#range').html());
    		window.open("","preview","width=650,height=1000");
    		$('#previewFrm').submit();
    		/* window.open("<c:url value="/approval/preview?approvalNo="/>${param.approvalNo}","_blank","width=850,height=1000"); */
    	})
    	
    	$('#attachFile').html("<img src='https://img.icons8.com/ios/14/000000/attach.png' title='첨부'/> 첨부파일 ${vo['AFCOUNT']}개 <span style='color:#607080'>("+$.byte(${totalFileSize},1)+")</span>");
    	$('.afFileSize').each(function(idx,item){
    		
    		var afFileSize=$(this).text();
    		$(this).text("("+$.byte(afFileSize,1)+")");
    	})
    	
    	$.showCommentList();
    	$('#wc').click(function(){
    		var acContent=$('input[name=acContent]');
    		if(acContent.val().length<1){
    			Toastify({
					text:"댓글 내용을 입력하세요.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
    			$('input[name=acContent]').focus();
    			return false;
    		}
    		$.ajax({
    			url:"<c:url value='/approvalComment/write'/>",
    			type:"post",
    			data:{"acContent":acContent.val(),"approvalNo":${param.approvalNo}},
    			success:function(res){
    				$.showCommentList();
    				Toastify({
    					text:"댓글이 작성되었습니다.",
    					duration: 2000,
    					close:false,
    					gravity:"top",
    					position:"center",
    					backgroundColor:"black",
    				}).showToast();
    				$('input[name=acContent]').val("");
    			},
    			error:function(e){
    				alert("ajax 전자결재 댓글 작성 에러");
    			}
    		})
    	})
    	
    	
    })
    

    
    
</script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>	
<script>
FilePond.create( document.querySelector('.multiple-files-filepond'), { 
    allowImagePreview: false,
    allowMultiple: true,
    allowFileEncode: false,
    required: false,
    maxFiles: 2,
    checkValidity: false,
    maxFileSize: '100MB',
    storeAsFile: true
});
</script>
<%@include file="selectFormModal.jsp"%>

<c:if test="${myEmpNo!=null && approval.empNo==myEmpNo && approval.currentState=='진행중'}">
	<%@include file="cancelDraftModal.jsp"%>
</c:if>

<c:if test="${approvalLineOrder!=null && approvalLineOrder==approval.currentOrder && approval.currentState=='진행중'}">
<%@include file="approvalDisagreeModal.jsp"%>
<%@include file="approvalAgreeModal.jsp"%>
</c:if>

<c:if test="${approvalLineOrder!=null}">
	<c:if test="${from=='complete' && (approvalLineOrder+1)==approval.currentOrder && approval.currentState=='진행중'}">
		<%@include file="approvalCancelModal.jsp"%>						
	</c:if>
</c:if>
<c:if test="${approval.currentState=='임시저장'}">
	<div class="modal" tabindex="-1" id="cancelModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">작성 취소</h5>
	        <button type="button" class="btn-close cancelModal-close" data-dismiss="modal" aria-label="Close">
	         X</button>
	      </div>
	      <div class="modal-body">
	        <h5>문서작성을 취소하시겠습니까?</h5>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary cancelModalOk">확인</button>
	        <button type="button" class="btn btn-secondary cancelModal-close" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<script>
	$(function(){
		$('.cancelModal-close').click(function(){
			$('#cancelModal').hide();
		});
	
		$('.cancelBtn').click(function(){
			$('#cancelModal').show();
		}) 
	
		$('.cancelModalOk').click(function(){
			window.history.back();
		});
	})
	
	</script>
	<%@include file="approvalInfoModal.jsp"%>
	<%@include file="draftingOpinionModal.jsp"%>
	<%@include file="tempModal.jsp"%>
	
</c:if>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</body>

</html>	