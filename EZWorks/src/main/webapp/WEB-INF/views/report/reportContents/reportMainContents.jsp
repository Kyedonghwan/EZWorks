<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/report/reportMainContents.css'/>">
<div class="content_page dashboard_report">
                <div class="dr_wrapper"><!--dr:dashboard_report-->
                    <h1 class="s_title">작성할 보고서
                        <span class="btn_wrap">
                            <span class="ic ic_info btn-toggle-desc">
                                <span class="layer_tail tooltip-desc" style="display:none;">
                                    <i class="ic ic_tail"></i>
                                    <div>내가 보고자로 등록된 정기 보고서 중 아직 작성하지 않은 보고서를 보여드립니다.</div>
                                </span>
                            </span>
                        </span>
                    </h1>
                    <div class="dashboard_box">
                        <div class="card_item_wrapper" id="todo_list"><section class="card_item report_home_card">
	<div class="h_border"></div>
	<div class="card_wrapper">
		<header>
			
		</header>
		
		<div class="card_subject">
			<a href="/app/report/series/1635"><time class="year">2021</time><time class="date">08/06(금)</time><p class="folder_type" title="금일 보고드립니다">금일 보고드립니다<span class="times">(제 7회차)</span></p> </a>
		</div>
		<div class="card_content">
			<table class="form_s"><tbody><tr><th>부서</th><td title="영업본부">영업본부</td></tr><tr><th>보고현황</th><td title="보고자 0명 (미보고자 1명)">보고자 0명 (미보고자 1명)</td></tr></tbody></table>
		</div>
		<div class="card_action">
			<a class="btn_lead" id="1627960140681526"><span class="ic ic_report"></span><span class="txt">보고하기</span></a>
		</div>
	</div>
</section><section class="card_item report_home_card">
	<div class="h_border"></div>
	<div class="card_wrapper">
		<header>
			
		</header>
		
		<div class="card_subject">
			<a href="/app/report/series/1634"><time class="year">2021</time><time class="date">07/30(금)</time><p class="folder_type" title="금일 보고드립니다">금일 보고드립니다<span class="times">(제 6회차)</span></p> </a>
		</div>
		<div class="card_content">
			<table class="form_s"><tbody><tr><th>부서</th><td title="영업본부">영업본부</td></tr><tr><th>보고현황</th><td title="보고자 0명 (미보고자 1명)">보고자 0명 (미보고자 1명)</td></tr></tbody></table>
		</div>
		<div class="card_action">
			<a class="btn_lead" id="1627960140681618"><span class="ic ic_report"></span><span class="txt">보고하기</span></a>
		</div>
	</div>
</section></div>
                    </div>
                </div>
                <div class="dr_wrapper"><!--dr:dashboard_report-->    
                    <h1 class="s_title">최근 생성된 보고서
                        <span class="btn_wrap">
                            <span class="ic ic_info btn-toggle-desc">
                                <span class="layer_tail tooltip-desc" style="display:none;">
                                    <i class="ic ic_tail"></i>
                                    <div>최근에 등록된 시간순서대로, 최대 20개의 목록을 표시합니다.</div>
                                </span>
                            </span>
                        </span>
                    </h1>
                    <div class="dataTables_wrapper" id="recent_list">
                                        <!-- 테이블 -->        
                    <div id="recentList_wrapper" class="dataTables_wrapper" role="grid"><div id="recentList_processing" class="dataTables_processing" style="visibility: hidden;">Loading...</div><table class="type_normal tb_lately_report dataTable" id="recentList" style="width: 100%; margin-bottom: 0px;">    
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <tr role="row"><th class="date sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="보고일" style="width: 180px;"><span class="title_sort">보고일</span></th><th class="part sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="부서" style="width: 270px;"><span class="title_sort">부서</span></th><th class="folder_type sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="보고서" style="width: 310px;"><span class="title_sort">보고서</span></th><th class="subject sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="제목" style="width: 389px;"><span class="title_sort">제목</span></th><th class="name sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="보고자" style="width: 120px;"><span class="title_sort">보고자</span></th></tr>
                        </thead>
                    <tbody role="alert" aria-live="polite" aria-relevant="all"><tr class="odd"><td class="date sorting_1">2021-01-22(금) 09:50</td><td class="part">다우그룹</td><td class="folder_type"><span data-id="190" style="cursor: pointer;"> 주간보고서</span></td><td class="subject"><span class="detail" data-id="8320" data-folder-id="190" data-type="OCCASIONAL" style="cursor: pointer;"> 12월 2주차 주간보고</span></td><td class="name">김상후 대표이사</td></tr></tbody></table></div>
                    <!-- //테이블 -->                    </div>
                </div>
            </div>
