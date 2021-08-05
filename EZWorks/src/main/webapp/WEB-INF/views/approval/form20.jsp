<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>

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
				<input type="hidden" id="currentFormNo" value="20">연장근무신청서
			</a>			
		</h5>
		
	</section>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
                    	<button type="button" class="btn btn-primary btn-sm approvalBtn">결재요청</button>
						<button type="button" class="btn btn-primary btn-sm tempSaveBtn">임시저장</button>
						<button type="button" class="btn btn-primary btn-sm previewBtn">미리보기</button>
						<button type="button" class="btn btn-primary btn-sm cancelBtn">취소</button>
						<button type="button" class="btn btn-primary btn-sm approvalInfoBtn">결재정보</button>
						
                        <div style="border:3px solid gray;margin-top:20px;padding:20px">
                        	<table>
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
										       <td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftUser}}" name="draftUser" id="draftUser" value="${empName}" data-id="draftUser" data-name="draftUser" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="김상후" placeholder=""></td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안부서</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftDept}}" name="draftDept" id="draftDept" value="${deptName}" data-id="draftDept" data-name="draftDept" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="다우그룹" placeholder=""></td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">기안일</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:draftDate}}" name="draftDate" id="draftDate" value="${today }" data-id="draftDate" data-name="draftDate" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="2021-08-05(목)" placeholder=""> </td> 
										      </tr> 
										      <tr> 
										       <td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">문서번호</td> 
										       <td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;"> <input type="text" readonly="" style="vertical-align:middle;width:100%;text-align: center;border:0px;box-shadow: inset 0px 0px 0px rgba(150,150,150,0.2)" data-dsl="{{label:docNo}}" name="docNo" value="${approvalStringNo }" data-id="docNo" data-name="docNo" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="" placeholder=""> </td> 
										      </tr> 
										     </tbody> 
										    </table> </td> 
										   <td style="width: 500px; text-align: right; padding: 0px!important; border: 0!important; vertical-align: top !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l"> 
										    <!-- 결재선 기본값으로 신청 1명, 승인 7명으로 설정--> 
										    	<span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="1" data-group-type="type1" data-is-reception="" id="drafterArea"><span class="sign_tit_wrap"><span class="sign_tit"><strong>신청</strong></span></span><span class="sign_member_wrap" id="activity_15824"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">${posName }</span></span><span class="sign_wrap"><span class="sign_name"> <strong> ${empName } </strong> </span></span><span class="sign_date_wrap"><span class="sign_date" id="date_15824"></span></span></span></span></span>
														  
														  
														  <!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span class="Active_dot1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span class="Active_dot3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span class="Active_dot4" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span><span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span></span><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><!-- 에디터 &nbsp; 버그. 개행과 공백을 최소화 시키자. --><br>
													
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
										    <td id="name" colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"> <span>
										    <input type="radio" class="editor_opt" data-dsl="{{radio_연장_야간_휴일}}" name="editorForm_4" value="연장" data-autotype="false" data-require="false" id="editorForm_4_연장" data-label="연장" checked="checked">
										    <label class="editor_label" data-type="removeSpan">연장</label>
										    <input type="radio" class="editor_opt" data-dsl="{{radio_연장_야간_휴일}}" name="editorForm_4" value="야간" data-autotype="false" data-require="false" id="editorForm_4_야간" data-label="야간"><label class="editor_label" data-type="removeSpan">야간</label><input type="radio" class="editor_opt" data-dsl="{{radio_연장_야간_휴일}}" name="editorForm_4" value="휴일" data-autotype="false" data-require="false" id="editorForm_4_휴일" data-label="휴일"><label class="editor_label" data-type="removeSpan">휴일</label></span> <span style="font-size: 12px;">* * 자정 이후 근무시작인 경우 날짜를 다음날로 지정해주세요.</span></td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> <b style="color: rgb(255, 0, 0);">*</b>근무일시</td> 
										    
										   <td colspan="3" style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"> <input type="text" readonly="" class="ipt_editor ipt_editor_date" data-dsl="{{calendar:startDate}}" id="startdate"> <span id="startTime"> <span data-type="time" data-value=""><select data-dsl="{{select}}" id="startHourSelect" name="editorForm_6" data-select-type="hour" class="editor_slt"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option></select>시 <select data-dsl="{{select}}" id="startMinuteSelect" name="editorForm_7" data-select-type="minute" class="editor_slt"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>분 </span> </span> ~&nbsp; <span id="endTime"> <span data-type="time" data-value=""><select data-dsl="{{select}}" id="endHourSelect" name="editorForm_8" data-select-type="hour" class="editor_slt"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option></select>시 <select data-dsl="{{select}}" id="endMinuteSelect" name="editorForm_9" data-select-type="minute" class="editor_slt"><option value="00">00</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option></select>분 </span> </span> </td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"><b style="color: rgb(255, 0, 0);">*</b>근무시간</td> 
										    <td colspan="3" style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px; vertical-align: middle; background: rgb(255, 255, 255);"> <span id="totalTime" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </td> 
										   </tr> 
										   <tr> 
										    <td colspan="4" style="width:800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: rgb(255, 255, 255);"> <p> * 주간 근무시간 - 근무일이 포함된 한 주 </p> <p> 정상근무시간 + 연장근무 승인 요청에 대한 결재가 완료된 총 시간입니다. </p> <p> 근태관리에서 시간 수정이 가능하므로 주간 근무시간은 상이해질 수 있습니다. </p> </td> 
										   </tr> 
										   <tr> 
										    <td style="width:200px;background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"> <b style="color: rgb(255, 0, 0);">*</b>신청&nbsp;사유 </td> 
										    <td colspan="3" style="padding: 3px; border: 1px solid black; width: 450px; height: 100px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: top; background: rgb(255, 255, 255);"> <textarea class="txta_editor" style="width:100%;height:100%" data-dsl="{{textarea:description}}" name="description" id="description" value="" data-id="description" data-name="description" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-value="" placeholder=""></textarea> </td> 
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
                        			</td>
                        		</tr>
                        		<tr>
                        			<td style="font-weight:bold">관련문서
                        			</td>
                        			<td>
                        				<button type="button" class="btn btn-primary btn-sm" id="searchApproval">문서검색</button>
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
							  				<div style="font-size:15px;font-weight:bold;color:#00001f">${empName} ${posName }</div>
							  				<div style="font-size:15px;color:#9f9f9f">${deptName }</div>
							  				<div style="font-size:15px;color:#9f9f9f">기안</div>
							  			</div>
							  		</li>
							  	</ul>
							  </div>
							  <div class="tab-pane fade" id="formInfoDetail" style="height:350px;width:100%">
							  	<table style="height:100%;width:100%">
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서번호</th>
							  			<td style="color:#00001f;font-weight:bold;font-size:14px" id="approvalStringNo">${approvalStringNo}</td>
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
							  			<td style="color:#00001f;font-weight:bold;font-size:14px">${deptName }</td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서참조</th>
							  			<td id="formDetail3"></td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서열람</th>
							  			<td id="formDetail4"></td>
							  		</tr>
							  		<tr>
							  			<th style="width:7%;text-align:center;font-size:14px">문서수신</th>
							  			<td id="formDetail2"></td>
							  		</tr>
							  	</table>
							  </div>
							</div>
                        </div>
                        
                        <div style="margin-top:20px;padding-top:0px">
                        	<button type="button" class="btn btn-primary btn-sm approvalBtn">결재요청</button>
							<button type="button" class="btn btn-primary btn-sm tempSaveBtn">임시저장</button>
							<button type="button" class="btn btn-primary btn-sm previewBtn">미리보기</button>
							<button type="button" class="btn btn-primary btn-sm cancelBtn">취소</button>
							<button type="button" class="btn btn-primary btn-sm approvalInfoBtn">결재정보</button>
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
	
	$('select').change(function(){
		if($('#startdate').val().length<1){
			Toastify({
				text:"근무 시작 날짜를 선택하세요.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			$('#startdate').focus();
			return false;
		}
		
		var startTime=$('#startHourSelect').val() +":"+$('#startMinuteSelect').val();
		var endTime=$('#endHourSelect').val() +":"+$('#endMinuteSelect').val();
		var startDate=$('#startdate').val()+" "+startTime;
		var a = moment($('#startdate').val());
		var b;
		
		var endDate
		if(startTime<endTime){
			b=a.clone();
		}else{
			b = a.clone().add(1,'day');
		}
		var endDate=b.format('YYYY-MM-DD')+" "+endTime;
		
		var t1=moment(startDate,'YYYY-MM-DD HH:mm');
		var t2=moment(endDate,'YYYY-MM-DD HH:mm');
		
		$('#totalTime').html(moment.duration(t2.diff(t1)).hours()+"시간 "+moment.duration(t2.diff(t1)).minutes()+"분");
	})
	
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
	
	$( "#startdate" ).datepicker();
	
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%@include file="selectFormModal.jsp"%>
<%@include file="approvalInfoModal.jsp"%>
<%@include file="draftingOpinionModal.jsp"%>
<%@include file="tempModal.jsp"%>

</body>

</html>	