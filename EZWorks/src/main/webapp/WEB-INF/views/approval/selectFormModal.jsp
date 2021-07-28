<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!-- 새결제진행 버튼 -> 양식선택 모달 -->
<div class="modal" tabindex="-1" id="selectFormModal">
  <form name="selectFormFrm" method="post">
  <div class="modal-dialog">
    <div class="modal-content" style="width:650px;height:480px">
      <div class="modal-header">
        <h5 class="modal-title">결제양식 선택</h5>
        <button type="button" class="btn-close selectFormModalClose" data-bs-dismiss="modal" aria-label="Close" ></button>
      </div>
      <div class="modal-body">
       	<div style="float:left;width:50%;">
        	<input type="text" class="form-control" style="width: 97%" id="searchForm" placeholder="양식번호 또는 이름 검색">
			<div style="margin: 5px;height:270px;border: 1px solid #eaf1f7" class="overflow-auto" id="formTree">
			</div>
		</div>
		<div style="float:left;width:48%;margin-left:10px;height:310px">
			<table style="border:1px solid #eaf1f7;border-radius:10px;height:100%;width:100%" id="formTable">
				<tr ><td colspan="2" style="text-align:center;background-color:#f4f4f4;font-weight:bold"></td></tr>
				<tr><td style="text-align:center;font-weight:bold"></td><td style="text-align:center"></td></tr>
				<tr><td style="text-align:center;font-weight:bold"></td><td style="text-align:center"></td></tr>
				<tr><td style="text-align:center;font-weight:bold"></td><td style="text-align:center"></td></tr>
				<tr><td colspan="2" style="text-align:center"></td></tr>
			</table>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="selectFormOk">확인</button>
        <button type="button" class="btn btn-secondary selectFormModalClose" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
  </form>
</div>
	
<script type="text/javascript" src="<c:url value='/resources/js/tree.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.selectFormModalClose').click(function(){
		$('#selectFormModal').hide();
	})
	
	$('#newApproval').click(function(){
		$('#selectFormModal').show();
	})
	
	$.ajax({
		url:"<c:url value='/form/showFormFolder'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			var tree = new Tree(document.getElementById('formTree'), {
			  navigate: true 
			});
			'use strict';
			
			var structure = [];
			
			$.each(res,function(){
				
				var obj={ 
						  open: true,
						  type: Tree.FOLDER,
						  selected: false,
						  children:[]
				};
				
				obj.name=this;
				structure.unshift(obj);
			})
			
			$.ajax({
				url:"<c:url value='/form/showForm'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					$.each(res,function(idx,item){
						$.each(structure,function(idx2,item2){
							if(item.formFolder==item2.name){
								this.children.push({name:item.formName+" ("+item.formNo+")"});
							}
						})
					})
					
					tree.json(structure);	
					
					$('#formTree a').click(function(){
						var tel;
						var email;
						var tree_a=$(this);
						var temp = tree_a.text().split('(')[1];
						$.each(res,function(){
							if(this.formNo==temp.substring(0,temp.length-1)){
								name=this.formName;
								life=this.formLife;
								secu=this.formSecu;
								formNo=this.formNo;
								$('#formTable tr').eq(0).children('td').html("상세정보");
								$('#formTable tr').eq(1).children('td').eq(0).html("제목");
								$('#formTable tr').eq(2).children('td').eq(0).html("보존연한");
								$('#formTable tr').eq(3).children('td').eq(0).html("보안수준");
								$('#formTable tr').eq(1).children('td').eq(1).html(name);
								$('#formTable tr').eq(2).children('td').eq(1).html(life+" 년");
								$('#formTable tr').eq(3).children('td').eq(1).html(secu);
								$('#formTable tr').eq(4).children('td').html('<button type="button" class="btn btn-primary" id="addUsedForm">자주 쓰는 양식으로 추가</button>');
								
								$('#addUsedForm').click(function(){
									$.ajax({
										url:'<c:url value="/form/insertUsedForm"/>',
										data:'formNo='+formNo,
										type:'get',
										dataType:'json',
										success:function(res){
											if(res==0){
												Toastify({
													text:"이미 등록된 양식입니다.",
													duration: 2000,
													close:false,
													gravity:"top",
													position:"center",
													backgroundColor:"black",
												}).showToast();
												return false;
											}
											$.showUsedForm();
											Toastify({
												text:"자주쓰는 양식에 추가되었습니다.",
												duration: 2000,
												close:false,
												gravity:"top",
												position:"center",
												backgroundColor:"black",
											}).showToast();
										},
										error:function(e){
											alert('자주쓰는양식 ajax 데이터삽입 에러');
										}
									})
								})
							}
						})
					})
					
				},
				error:function(e){
					alert("양식 ajax 오류2");
				}
			})
			
		},
		error:function(e){
			alert("양식 ajax 오류1");
		}
		
	})
})



</script>