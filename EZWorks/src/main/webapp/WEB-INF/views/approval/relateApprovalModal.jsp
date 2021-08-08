<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!-- 결재정보 모달 /결재선 구현 -->


<div class="modal" tabindex="-1" id="relateApprovalModal">
  <div class="modal-dialog" style="right:300px">
    <div class="modal-content" style="width:1200px;height:600px">
      <div class="modal-header">
        <h5 class="modal-title" style="height:50px">결재 문서 첨부</h5>
        <button type="button" class="btn-close relateApprovalModalClose" data-bs-dismiss="modal" aria-label="Close" ></button>
      </div>
      <div class="modal-body">
      	<div style="float:left;width:23%;">
	        <div class="overflow-auto"> 
	        	<section>
				<div>
					<ul style="list-style:none">
						<li class="sidebar-item active has-sub">
			                <a href="#" class='sidebar-link'>
			                    <!-- <i class="bi bi-stack"></i> -->
			                    <span style="font-weight:bold">기안</span>
			                </a>
			                <ul class="submenu active" style="list-style:none">
			                	<li class="submenu-item ">
			                        <a href="#" id="raDraftBtn">결재 요청함</a>
			                    </li>
			                </ul>
			             </li>
			             <br>
			             <li class="sidebar-item active has-sub">
			                <a href="#" class='sidebar-link'>
			                    <!-- <i class="bi bi-stack"></i> -->
			                    <span style="font-weight:bold">결재</span>
			                </a>
			                <ul class="submenu active" style="list-style:none">
			                    <li class="submenu-item ">
			                        <a href="#" id="raCompleteBtn">결재 완료함</a>
			                    </li>
			                    <li class="submenu-item ">
			                        <a href="#" id="raReferenceBtn">참조/열람 문서함</a>
			                    </li>
			                </ul>
			             </li>
			             <br>
			             <li class="sidebar-item active has-sub">
			                <a href="#" class='sidebar-link'>
			                    <span style="font-weight:bold">부서 문서함</span>
			                    
			                </a>
			                <ul class="submenu active" style="list-style:none">
			                    <li class="submenu-item ">
			                        <a href="#" id="raDeptCompleteBtn">기안 완료함</a>
			                    </li>
			                    <li class="submenu-item ">
			                        <a href="#" id="raDeptReferenceBtn">부서 참조함</a>
			                    </li>
			                </ul>
			             </li>
			             <br>
			         </ul>
				</div>
			</section>
	        </div>
		</div>
		<div style="float:left;width:75%">
			<div>
				<h6 id="selectRA">문서함을 선택하세요</h6>
			</div>
			<div class="overflow-auto" style="height:400px"> 
				<table class="table project-table table-centered table-nowrap">
                   <thead>
                       <tr>
                           <th scope="col"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
                           <th scope="col" style="width:15%;text-align:center">결재양식</th>
                           <th scope="col" style="width:40%;text-align:center">제목</th>
                           <th scope="col" style="width:10%;text-align:center">기안자</th>
                           <th scope="col" style="width:15%;text-align:center">결재일</th>
                           <th scope="col" style="width:15%;text-align:center">결재상태</th>
                       </tr>
                   </thead>
                   <tbody id="raContents">
                   </tbody>
               </table>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="relateApprovalOk">확인</button>
        <button type="button" class="btn btn-secondary relateApprovalModalClose" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript" src="<c:url value='/resources/js/tree.js'/>"></script>
<script type="text/javascript">

$(function(){
	var idx1=1;
	$('.relateApprovalModalClose').click(function(){
		$('#relateApprovalModal').hide();
	})
	
	$('#searchApproval').click(function(){
		$('#relateApprovalModal').show();
	})
	
	$('#raDraftBtn').click(function(){
		$.ajax({
			url:"<c:url value="/approval/raDraft"/>",
			dataType:"json",
			type:"get",
			success:function(res){
				$('#selectRA').text('결재 요청함');
				var temp="";
				$.each(res,function(idx,item){
					if(item.CURRENT_STATE!='진행중'){
						temp+='<tr>';
                        temp+='<td scope="col"><input class="form-check-input" type="checkbox" value="'+item.APPROVAL_NO+'"><input type="hidden" value="'+item.APPROVAL_STRINGNO+'"></td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+item.FORM_NAME+'</td>';
                        temp+='<td scope="col" style="width:40%;text-align:center"><span>'+item.FORM3_TITLE+'</span> <img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> '+item.ACCOUNT+'</td>';
                        temp+='<td scope="col" style="width:10%;text-align:center">'+$('.sign_name Strong').text()+'</td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+moment(new Date(item.APPROVAL_REGDATE)).format('YYYY-MM-DD')+'</td>';
                        if(item.CURRENT_STATE=='결재완료')
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state complete" style="margin-right:5px">결재완료</span></td>';
                        else
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state disagree" style="margin-right:5px">반려</span></td>';
                        temp+='</tr>';
					}
				})
				$('#raContents').html(temp);
			},
			error:function(e){
				alert("ra 기안완료 ajax 에러");
			}
		})
	})
	
	$('#raCompleteBtn').click(function(){
		$.ajax({
			url:"<c:url value="/approval/rac"/>",
			dataType:"json",
			type:"get",
			success:function(res){
				$('#selectRA').text('결재 완료함');
				var temp="";
				$.each(res,function(idx,item){
					if(item.CURRENT_STATE!='진행중'){
						temp+='<tr>';
                        temp+='<td scope="col"><input class="form-check-input" type="checkbox" value="'+item.APPROVAL_NO+'"><input type="hidden" value="'+item.APPROVAL_STRINGNO+'"></td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+item.FORM_NAME+'</td>';
                        temp+='<td scope="col" style="width:40%;text-align:center"><span>'+item.FORM3_TITLE+'</span> <img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> '+item.ACCOUNT+'</td>';
                        temp+='<td scope="col" style="width:10%;text-align:center">'+item.EMP_NAME+'</td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+moment(new Date(item.APPROVAL_REGDATE)).format('YYYY-MM-DD')+'</td>';
                        if(item.CURRENT_STATE=='결재완료')
                        temp+='<td scope="col" style="width:15%;text-align:center"><span class="state complete" style="margin-right:5px">결재완료</span></td>';
                        else
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state disagree" style="margin-right:5px">반려</span></td>';
                        temp+='</tr>';
					}
				})
				$('#raContents').html(temp);
			},
			error:function(e){
				alert("ra 결재 완료 ajax 에러");
			}
		})
	})
	
	$('#raReferenceBtn').click(function(){
		$.ajax({
			url:"<c:url value="/approval/raReference"/>",
			dataType:"json",
			type:"get",
			success:function(res){
				$('#selectRA').text('참조/열람 문서함');
				var temp="";
				$.each(res,function(idx,item){
					if(item.CURRENT_STATE!='진행중'){
						temp+='<tr>';
                        temp+='<td scope="col"><input class="form-check-input" type="checkbox" value="'+item.APPROVAL_NO+'"><input type="hidden" value="'+item.APPROVAL_STRINGNO+'"></td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+item.FORM_NAME+'</td>';
                        temp+='<td scope="col" style="width:40%;text-align:center"><span>'+item.FORM3_TITLE+'</span> <img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> '+item.ACCOUNT+'</td>';
                        temp+='<td scope="col" style="width:10%;text-align:center">'+item.EMP_NAME+'</td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+moment(new Date(item.APPROVAL_REGDATE)).format('YYYY-MM-DD')+'</td>';
                        if(item.CURRENT_STATE=='결재완료')
                        temp+='<td scope="col" style="width:15%;text-align:center"><span class="state complete" style="margin-right:5px">결재완료</span></td>';
                        else
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state disagree" style="margin-right:5px">반려</span></td>';
                        temp+='</tr>';
					}
				})
				$('#raContents').html(temp);
			},
			error:function(e){
				alert("ra 참조 ajax 에러");
			}
		})
	})
	
	$('#raDeptCompleteBtn').click(function(){
		$.ajax({
			url:"<c:url value="/approval/raDeptComplete"/>",
			dataType:"json",
			type:"get",
			success:function(res){
				$('#selectRA').text('부서문서함 - 기안 완료함');
				var temp="";
				$.each(res,function(idx,item){
					if(item.CURRENT_STATE!='진행중'){
						temp+='<tr>';
                        temp+='<td scope="col"><input class="form-check-input" type="checkbox" value="'+item.APPROVAL_NO+'"><input type="hidden" value="'+item.APPROVAL_STRINGNO+'"></td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+item.FORM_NAME+'</td>';
                        temp+='<td scope="col" style="width:40%;text-align:center"><span>'+item.FORM3_TITLE+'</span> <img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> '+item.ACCOUNT+'</td>';
                        temp+='<td scope="col" style="width:10%;text-align:center">'+item.EMP_NAME+'</td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+moment(new Date(item.APPROVAL_REGDATE)).format('YYYY-MM-DD')+'</td>';
                        if(item.CURRENT_STATE=='결재완료')
                        temp+='<td scope="col" style="width:15%;text-align:center"><span class="state complete" style="margin-right:5px">결재완료</span></td>';
                        else
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state disagree" style="margin-right:5px">반려</span></td>';
                        temp+='</tr>';
					}
				})
				$('#raContents').html(temp);
			},
			error:function(e){
				alert("ra 부서문서함 ajax 에러");
			}
		})
	})
	
	$('#raDeptReferenceBtn').click(function(){
		$.ajax({
			url:"<c:url value="/approval/raDeptReference"/>",
			dataType:"json",
			type:"get",
			success:function(res){
				$('#selectRA').text('부서문서함 - 부서 참조함');
				var temp="";
				$.each(res,function(idx,item){
					if(item.CURRENT_STATE!='진행중'){
						temp+='<tr>';
                        temp+='<td scope="col"><input class="form-check-input" type="checkbox" value="'+item.APPROVAL_NO+'"><input type="hidden" value="'+item.APPROVAL_STRINGNO+'"></td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+item.FORM_NAME+'</td>';
                        temp+='<td scope="col" style="width:40%;text-align:center"><span>'+item.FORM3_TITLE+'</span> <img style="margin-left:10px" src="https://img.icons8.com/ios/14/000000/comments.png" title="댓글"/> '+item.ACCOUNT+'</td>';
                        temp+='<td scope="col" style="width:10%;text-align:center">'+item.EMP_NAME+'</td>';
                        temp+='<td scope="col" style="width:15%;text-align:center">'+moment(new Date(item.APPROVAL_REGDATE)).format('YYYY-MM-DD')+'</td>';
                        if(item.CURRENT_STATE=='결재완료')
                        temp+='<td scope="col" style="width:15%;text-align:center"><span class="state complete" style="margin-right:5px">결재완료</span></td>';
                        else
                        	temp+='<td scope="col" style="width:15%;text-align:center"><span class="state disagree" style="margin-right:5px">반려</span></td>';
                        temp+='</tr>';
					}
				})
				$('#raContents').html(temp);
			},
			error:function(e){
				alert("ra 부서참조함 ajax 에러");
			}
		})
	})
	$('#relateApprovalOk').click(function(){
		$('#attachRA').nextAll().remove();
		$('#raContents input[type=checkbox]').each(function(idx,item){
			
			if($(this).is(':checked')){
				
				var temp="";
				temp+='<tr><td style="width:20%"></td><td style="width:80%" class="raRow"><p style="background:#f4f4f4;"><img src="https://img.icons8.com/office/24/000000/file.png"> <span style="color:black">['+$(this).next().val()+'] '+$(this).parent().next().next().children('span').text()+'</span><input type="hidden" value="'+$(this).val()+'">&nbsp;<button type="button" class="btn btn-primary btn-sm previewRABtn">미리보기</button></td></tr>';
				$('#attachRA').after(temp);
				
			}
		})
		$('#relateApprovalModal').hide();
	})
	
	
})

$(document).on('click','.previewRABtn',function(){
	var approvalNo = $(this).prev().val();
	window.open("<c:url value="/approval/raPreview?approvalNo="/>"+approvalNo,"_blank","width=850,height=1000");
})

</script>