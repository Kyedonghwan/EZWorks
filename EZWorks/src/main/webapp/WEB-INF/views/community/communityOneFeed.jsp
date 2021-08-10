<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	

<style type="text/css">
	.col-12 col-lg-12{
		padding:0;
	}
	.col-auto{
		 font-size:0.8em;
	}
	#mainTitle{
		font-size:1.3em;
		font-weight:bold;
	}
	#sp2{
		padding-top:7px;
	}
	#boardTitle{
		display: flex;
		align-items: center;
	}
	#boardInfo_Wrap{
		min-width: 500px;
		border:1px solid #dcdcdc;
		background-color: #f9f9f9;
		position: relative;
		border-radius: 4px;
		margin: 10px 24px;
		margin-top: 0px;
		padding: 14px 10px 14px;
	}
	.detail_info{
		margin: 0;
		list-style: none;
    	padding: 0 8px 0;
	}
	.simple_info {
	    display: flex;
	    align-items: center;
	    margin: 0;
	}
	#feedText{
		height:150px;
	}
	#feed{
		border:1px solid #dcdcdc;
		border-radius: 10px;
		padding-bottom:50px;
	}
	.btnsubmit{
		padding-top:10px;
		float: right;
		margin-right: 10px;
	}
	.data_contents{
		position: relative;
	    border-top: 1px solid #ddd;
	    padding: 20px 0 20px;
	    overflow: hidden;
	}
	.reply_content{
		position: relative;
	    margin-left: 65px;
	    padding-left: 0;
	    border-radius: 4px;
	    list-style:none;
	}
	.info {
	    position: relative;
	    margin-left: 65px;
	    width: 500px;
	}
	
	span.date {
	    display: block;
	    line-height: 1.5;
	    font-size: 13px;
	    color: #999;
	}
	span.name {
    font-weight: 500;
	}
	
	p.text {
	    margin-bottom: 10px;
	    margin-top: 5px;
	    margin-left: 65px;
	}
	
 	.feed_Data_Wrapper {
	    position: relative;
	    white-space: normal;
	    word-wrap: break-word;
	    text-overflow: clip;
	    min-width: 430px;
	} 
	
	.avatar.avatar-lg.me-3 {
	    position: absolute;
	    display: inline-block;
	    top: 0px;
	}
	
	#toolbar{
	    float:right;
	    margin-right: 10px;
	    font-size:0.8em;
	}

	.replyHeader {
	    margin-bottom: 10px;
	    margin-left: 65px;
	    font-size: 13px;
	}
	
	.replyWrapper {
	    position: relative;
	    margin-left: 65px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    min-width: 444px;
	    width:78%
	}
	ul.reply {
	    border: none;
	    margin-top: 10px;
	}
	
	.reply_write {
	    position: relative;
	    display: inline-flex;
   		align-items: center;
	}
	.avatar.bg-warning.me-3 {
	    position: relative;
	    margin-left:10px;
	}
	
	#exampleFormControlTextarea1 {
	    overflow-y: auto;
	    height: 28px;
	    min-height: 28px;
	    width:100%;
	}
	
	.form-group.mb-3 {
	    margin-right: 15px;
		position: relative;
		margin-top: 15px;
		width:600px;
	}
	span.replysubmit {
		 padding-top:10px; 
		 float: right; 
		 margin-bottom:10px;
	}
	.feed_contents_wrap {
    	width: 83%;
	}
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#btnSubmit").click(function(){
			if($('textarea[name=text]').val()==""){
				Toastify({
	                text: "내용을 입력하세요",
	                duration: 5000,
	                close:false,
	                gravity:"top",
	                position: "center",
	                backgroundColor: "#b6baea",
	            }).showToast();
				event.preventDefault();
				$('textarea[name=text]').focus();
			}else{
				$('.feedForm').submit();
			}
		});
	});
</script>

<%@ include file="../community/sidebar/sidebar2.jsp" %>		
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
<section class="row">
      <div class="col-12 col-lg-12">
            <div class="card">
                <div class="card-header" id="boardTitle">
	               <h5 class="card-title">${cboardVo.boardName}</h5>&nbsp
	               <span style="font-size:0.9em">${cboardVo.communityName}&nbsp(총 ${cboardVo.writingCount}건)</span>
                </div>
                <div class="card-body" id="boardInfo_Wrap">
                	<ul class="simple_info">
                		<li>
                			<strong>게시판 주소 : </strong>
                			<span><a href="<c:url value='/community/communityOneFeed?boardNo=${cboardVo.boardNo}&communityNo=${cboardVo.communityNo}'/>">
                				community/communityOneFeed/${cboardVo.boardName}</a></span>&nbsp
                		</li>                	
                	</ul>
                	<ul class="detail_info">
                		<li>
                			<strong>운영자 : </strong>
                			<span>${cboardVo.masterName}</span>
                		</li>
                		<li style="none">${cboardVo.intro}</li>
                	</ul>
                </div>
                <div class="card-body">
                    <div class="tab-content" id="myTabContent">
	                    <form class="feedForm" method="post" action="<c:url value='/community/communityOneFeed'/>">
		                    <input type="hidden" name="boardNo" value="${cboardVo.boardNo}">
		                    <input type="hidden" name="communityNo" value="${cboardVo.communityNo}">
		                    <input type="hidden" name="empVo" value="${empVo}">
		           
		                       <div class="col-md-10 form-group" id="feed">
		                      		<div class="form-floating">
		                               <textarea class="form-control" id="feedText" name="text"
		                                placeholder="새로운 정보, 기분 좋은 소식을 부서원들과 공유하세요."></textarea>
		                               <label for="intro">새로운 정보, 기분 좋은 소식을 부서원들과 공유하세요.</label>
		                           </div>
		                           <div class="btnsubmit">
		                           		<button type="submit" id="btnSubmit" class="btn btn-sm btn-outline-primary">이야기 하기</button>
		                           </div>
		                      </div>
	                    </form>
                    <div class="feed_contents_wrap">
                    	<ul class="feed_type" style="padding-left:0">
                  			<c:if test="${empty feedList}">
	                    		<li class="data_contents">
	                    			<span class="noData">아직 등록된 글이 없습니다. 글을 등록해주세요.</span>
	                    		</li>
 	              			</c:if>
                  			<c:if test="${!empty feedList}">
                  				<c:forEach var="vo" items="${feedList}">
                  				<li class="data_contents">
                  					<div class="feed_Data_Wrapper">
	                  					<div class="btn-group mb-2 btn-group-sm" role="group" aria-label="toolbar" id="toolbar">
		                                    <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
		                                    <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
			                            </div>
	                  					<span class="avatar avatar-lg me-3">
                  							<img src="<c:url value='/resources/images/faces/${vo.empImg}'/>">
                  						</span>
	                  					<div class="info">
                  							<span class="name">${vo.empName} ${vo.posName}</span>
                  							<span class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd (E) HH:mm"/></span>
                  						</div>
                  						<p class="text"><span>${vo.text}</span></p>
                  					</div>
                  				</li>
			                    <div class="replyHeader">
			                    	<span class="fa-fw select-all fas"></span> 댓글 
			                    	<span class=num_comment>${vo.replyCounts}</span>개
			                    </div>
			                  <div class="replyWrapper">
			                    	<div class="replyCommon" id="replyArea">
			                    		<ul class="reply">
				                    		<c:if test="${empty replyList}">
				                    			<li class="reply_content"></li>
				                    		</c:if>
				                    		<c:if test="${!empty replyList}">
				                    			<c:forEach var="vo" items="${replyList}">
					                    			<li class="reply_content">
					                    				<div class="reply_data">
					                    					<span class="avatar avatar-lg me-3">
					                  							<img src="<c:url value='/resources/images/faces/${vo.empImg}'/>">
					                  						</span>
					                    				</div>
					                    				<div class="reply_text">
					                    					<div class="info">
					                  							<span>${vo.empName} ${vo.posName}</span>
					                  							<span><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd (E) HH:mm"/></span>
					                  						</div>
					                  						<p class="text"><span>${vo.text}</span></p>
					                    				</div>
					                    			</li>
				                    			</c:forEach>
				                    		</c:if>
			                    		</ul>
			                    		<div class="reply_create" id="reply">
			                    			<form action="/community/communityOneReply" method="post" name="replyform">
			                    				<div class="btn-group mb-2 btn-group-sm" role="group" aria-label="toolbar" id="toolbar">
				                                    <button type="button" class="btn btn-sm btn-outline-secondary">수정</button>
				                                    <button type="button" class="btn btn-sm btn-outline-secondary">삭제</button>
					                            </div>
					               				<div class="reply_write">
					                    			<div class="avatar bg-warning me-3">
						                                <span class="avatar-content"><img src="<c:url value='/resources/images/faces/${empVo.empImg}'/>"></span>
						                                <span class="avatar-status bg-success"></span>
				                            		</div>
				               						<span class="form-group mb-3">
				                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				                                    </span>
				               						<span class="replysubmit">
						                           		<button type="submit" id="replySubmit" class="btn btn-sm btn-outline-primary">댓글 작성</button>
						                           </span>
				               					</div>
			                    			</form>
			                    		</div>
			                    	</div>
			                    </div><br>  
               				</c:forEach>
               			</c:if>
                   	</ul>
                 </div>   
	          </div>
	       </div>
	   </div>
	</div> 
</section>				
			
<%@ include file="../include/bottom.jsp" %> 