<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/vendors/summernote/summernote-lite.min.css'/>">
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
				<input type="hidden" id="currentFormNo" value="3">일반품의서
			</a>			
		</h5>
		
	</section>
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
                        <div style="border:3px solid gray;margin-top:20px;padding:20px">
                        	<table>
                        		<tr>
                        			<td colspan="2">
                        			
                        			
                        				<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> 
										 <!-- 문서 헤더 시작--> 
										 
										<table style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><colgroup> 
										   <col style="width: 90px;"> 
										   <col style="width: 180px;"> 
										   <col style="width: 90px;"> 
										   <col style="width: 120px;"> 
										   <col style="width: 90px;"> 
										   <col style=""> 
										  </colgroup> 
										  
											<tbody>
												<tr>
													<td style="padding: 3px; border: 1px solid black; height: 90px !important; font-size: 27px; font-weight: bold; text-align: center; vertical-align: middle; " colspan="2">
														
										품 &nbsp;의 &nbsp;서
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: right;" colspan="4">
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
																		<span class="sign_stamp">
																			<img src="https://tour.daouoffice.com/resources/images/stamp_approved.png">
																		</span>
																		<span class="sign_name"> <strong> ${vo['EMP_NAME']} </strong> 
																		</span>
																	</span>
																	<span class="sign_date_wrap">
																		<span class="sign_date" id="date_15824"><fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy/MM/dd"/></span>
																	</span>
																</span>
															</span>
													</span>
													<span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="10" data-group-type="type1" data-is-reception="">
														<span class="sign_tit_wrap">
															<span class="sign_tit">
																<strong>승인</strong>
															</span>
														</span>
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
														
													</span>
													<span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><br>
													</td>
												</tr>
												<tr>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										기안부서
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${vo['DEPT_NAME']}</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										기 안 일
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd "/></span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										문서번호
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${vo['APPROVAL_STRINGNO']}</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
												</tr>
												<tr>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										기 안 자
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">${vo['EMP_NAME']}</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										보존년한
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{label:preserveDuration}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">5</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										비밀등급
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13" data-dsl="{{label:securityLevel}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="" data-autotype=""><span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">상</span><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="13" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
												</tr>
											</tbody>
										</table>
										 
										 <!-- 문서 헤더 끝--> 
										 <!-- 마진 시작--> 
										 
										<table style="width: 800px; border-collapse: collapse; border-spacing: 0px; border: 1px solid black;">
											<tbody>
												<tr>
													<td style="padding: 0px !important; height: 10px; vertical-align: middle; border: 1px solid black; font-size: 9px;">
														<p style="font-family: &quot;맑은 고딕&quot;; font-size: 7pt; line-height: 14px; margin-top: 0px; margin-bottom: 0px;"><br></p>
													</td>
												</tr>
											</tbody>
										</table>
										 
										<table style="width: 800px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><colgroup> 
										   <col style="width: 90px;"> 
										   <col style="width: 710px;"> 
										  </colgroup> 
										  
											<tbody>
												<tr>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold;">
														
										제 &nbsp;&nbsp;&nbsp; 목
													</td>
													<td style="padding: 3px; height: 20px; vertical-align: middle; border: 1px solid black; text-align: left;">
														<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text:subject}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" data-value="">${approval.form3Title }<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
													</td>
												</tr>
												<tr>
													<td style="padding: 3px; height: 540px; vertical-align: top; border: 1px solid black; " colspan="2">
														${approval.form3Content}
													</td>
												</tr>
											</tbody>
										</table>
										 
										 <!-- 제목 및 내용 끝 --> 
										 <!-- 푸터--> 
										 
										<table style="width: 800px; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;">
											<tbody>
												<tr>
												</tr>
											</tbody>
										</table>
										 
										 <!-- 푸터 끝--></span><p style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;"><br></p></span>
									
									
									</td>
                        		</tr>
                        		<tr>
                        			<td style="font-weight:bold">첨부 파일
                        			</td>
                        			<td>
						                
                        			</td>
                        		</tr>
                        		<tr>
                        			<td style="font-weight:bold">첨부 관련 문서
                        			</td>
                        			<td>
                        				
                        			</td>
                        		</tr>
                        	</table>
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
							  				<div style="font-size:15px;color:#9f9f9f">기안 상신&nbsp;|&nbsp;<fmt:formatDate value="${vo['APPROVAL_REGDATE']}" pattern="yyyy-MM-dd(E) hh:MM"/></div>
							  				<c:if test="${approval.approvalDraftingOpinion!=null}">
							  					<p style="padding:4px 8px;background:#f4f4f4;color:black;font-weight:bold;margin-top:8px">${approval.approvalDraftingOpinion}</p>
							  				</c:if>
							  			</div>
							  		</li>
							  		<c:forEach var="item" items="${stampList}">
							  			<li style="height:50px;list-style:none;padding-left:5px;padding-top:15px;padding-bottom:15px;height:120px;background-color:#f2f7ff">
								  			<div style="float:left;width:50px">
								  				<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">
								  			</div>
								  			<div style="float:left; margin-left:10px;height:100%;">
								  				<div style="font-size:15px;font-weight:bold;color:#00001f">${item['EMP_NAME']} ${item['POS_NAME'] }</div>
								  				<div style="font-size:15px;color:#9f9f9f">${item['DEPT_NAME']}</div>
								  				<div style="font-size:15px;color:#9f9f9f"><c:if test="${approval.currentOrder==item['AL_ORDER']&& item['CURRENT_STATE']==null}">결재 대기</c:if><c:if test="${approval.currentOrder!=item['AL_ORDER']&& item['CURRENT_STATE']==null}">결재 예정</c:if><c:if test="${item['CURRENT_STATE']=='결재완료'}">결재 완료</c:if><c:if test="${item['CURRENT_STATE']=='반려'}">반려</c:if><c:if test="${item['AL_REGDATE']!=null }">&nbsp;|&nbsp;<fmt:formatDate value="${item['AL_REGDATE']}" pattern="yyyy-MM-dd(E) hh:MM"/></div></c:if>
								  				<c:if test="${item['AL_OPINION']!=null}">
								  					<p style="padding:4px 8px;background:#f4f4f4;color:black;font-weight:bold;margin-top:8px">${item['AL_OPINION']}</p>
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
							  			<td style="color:#00001f;font-weight:bold;font-size:14px" id="approvalStringNo">${vo['APPROVE_STRINGNO']}</td>
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
							  			<td style="color:#00001f;font-weight:bold;font-size:14px">EZ그룹</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서참조</th>
							  			<td id="formDetail3">
							  				<c:forEach var="item" items="${reference }">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}</span>
							  				</c:forEach>
							  			</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서열람</th>
							  			<td id="formDetail4">
							  				<c:forEach var="item" items="${browse }">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}</span>
							  				</c:forEach>
							  			</td>
							  			
			
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서수신</th>
							  			<td id="formDetail2">
							  				<c:forEach var="item" items="${reception}">
							  					<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">${item["EMP_NAME"]} ${item["POS_NAME"]}</span>
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
    $('#summernote').summernote({
        tabsize: 2,
        height: 540,
    });
    $("#hint").summernote({
        height: 100,
        toolbar: false,
        placeholder: 'type with apple, orange, watermelon and lemon',
        hint: {
            words: ['apple', 'orange', 'watermelon', 'lemon'],
            match: /\b(\w{1,})$/,
            search: function (keyword, callback) {
                callback($.grep(this.words, function (item) {
                    return item.indexOf(keyword) === 0;
                }));
            }
        }
    });

    function saveContent(){
       var summernoteContent = $('#summernote').summernote('code');
       console.log("summernoteContent : "+summernoteContent);
    }
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

</body>

</html>	