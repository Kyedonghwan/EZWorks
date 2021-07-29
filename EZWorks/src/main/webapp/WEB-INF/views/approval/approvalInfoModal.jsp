<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!-- 결재정보 모달 /결재선 구현 -->


<div class="modal" tabindex="-1" id="approvalInfoModal">
  <form name="approvalInfoFrm" method="post">
  <div class="modal-dialog">
    <div class="modal-content" style="width:900px;height:600px">
      <div class="modal-header">
        <h5 class="modal-title" style="height:50px">결재 정보</h5>
        <button type="button" class="btn-close approvalInfoModalClose" data-bs-dismiss="modal" aria-label="Close" ></button>
      </div>
      <div class="modal-body">
      	<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">결재선</button>
		    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">참조자</button>
		    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">열람자</button>
		  </div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-home" style="padding:10px" role="tabpanel" aria-labelledby="nav-home-tab">
		  
		  	<div style="float:left;width:36%;">
	        	<input type="text" class="form-control searchEmp" style="width: 97%" placeholder="이름/아이디/부서/직책/전화번호">
				<div style="margin: 5px;height:270px;border: 1px solid #eaf1f7" class="overflow-auto" id="approvalInfoEmpTree">
				</div>
			</div>
			<div style="float:left;width:62%;margin-left:10px;height:310px">
				<table style="border:1px solid #eaf1f7;width:100%;height:100%" >
					<tr style="border:1px solid #eaf1f7;">
						<th style="width:15%;text-align:center"></th>
						<th style="width:20%;text-align:center">타입</th>
						<th style="width:20%;text-align:center">이름</th>
						<th style="width:30%;text-align:center">부서</th>
						<th style="width:15%;text-align:center"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></th>
					<tr>
					<tr>
						<td colspan="5" style="height:80%">
							<div class="overflow-auto" style="width:100%;height:100%">
								<table style="width:100%;">
									<tr>
										<th colspan="5" style="background-color:#e6e6ec">신청</th>
									</tr>
									<tr>
										<td style="width:15%;text-align:center;font-weight:bold;background-color:#fafafa"><a href="#">>></a></td>
										<td style="width:20%;text-align:center">기안</td>
										<td style="width:20%;text-align:center">김상후</td>
										<td style="width:30%;text-align:center">EZ그룹</td>
										<td style="width:15%;text-align:center"><a href="#"></a></td>
									</tr>
									<tr>
										<th colspan="5" style="background-color:#e6e6ec">승인</th>
									</tr>
									<tr>
										<td style="width:15%;text-align:center;font-weight:bold;background-color:#fafafa"><a href="#" id="add1">>></a></td>
										<td style="width:20%;text-align:center"></td>
										<td style="width:20%;text-align:center"></td>
										<td style="width:30%;text-align:center"></td>
										<td style="width:15%;text-align:center"></td>
									</tr>
									
									<tr id="beforeTarget">
										<th colspan="5" style="background-color:#e6e6ec">수신</th>
									</tr>
									<tr>
										<td style="width:15%;text-align:center;font-weight:bold;background-color:#fafafa"><a href="#" id="add2">>></a></td>
										<td style="width:20%;text-align:center"></td>
										<td style="width:20%;text-align:center"></td>
										<td style="width:30%;text-align:center"></td>
										<td style="width:15%;text-align:center"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr style="border:1px solid #eaf1f7;">
						<td colspan="5" style="background-color:#e6e6ec;text-align:center">
							<button type="button" class="btn btn-primary btn-sm" id="loadApprovalLine">나의 결제선 불러오기</button>
							<button type="button" class="btn btn-primary btn-sm" id="addApprovalLine">개인결재선으로 저장</button>
						</td>
					</tr>
				</table>
			</div>
		  
		  </div>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" style="padding:10px" aria-labelledby="nav-profile-tab">
		  	<div style="float:left;width:36%;">
	        	<input type="text" class="form-control searchEmp" style="width: 97%" placeholder="이름/아이디/부서/직책/전화번호">
				<div style="margin: 5px;height:270px;border: 1px solid #eaf1f7" class="overflow-auto" id="approvalInfoEmpTree2">
				</div>
			</div>
			<div style="float:left;width:62%;margin-left:10px;height:310px">
				<table style="border:1px solid #eaf1f7;width:100%;height:100%" >
					<tr style="border:1px solid #eaf1f7;">
						<th style="width:20%;text-align:center"></th>
						<th style="width:30%;text-align:center">이름</th>
						<th style="width:35%;text-align:center">부서</th>
						<th style="width:15%;text-align:center"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></th>
					<tr>
					<tr>
						<td colspan="4" style="height:80%">
							<div class="overflow-auto" style="width:100%;height:100%">
								<table style="width:100%;">
									<tr>
										<td style="width:20%;text-align:center;font-weight:bold;background-color:#fafafa"><a href="#" id="add3">>></a></td>
										<td style="width:30%;text-align:center"></td>
										<td style="width:35%;text-align:center"></td>
										<td style="width:15%;text-align:center"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		  </div>
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" style="padding:10px" aria-labelledby="nav-contact-tab">
		  	<div style="float:left;width:36%;">
	        	<input type="text" class="form-control searchEmp" style="width: 97%" placeholder="이름/아이디/부서/직책/전화번호">
				<div style="margin: 5px;height:270px;border: 1px solid #eaf1f7" class="overflow-auto" id="approvalInfoEmpTree3">
				</div>
			</div>
			<div style="float:left;width:62%;margin-left:10px;height:310px">
				<table style="border:1px solid #eaf1f7;width:100%;height:100%" >
					<tr style="border:1px solid #eaf1f7;">
						<th style="width:20%;text-align:center"></th>
						<th style="width:30%;text-align:center">이름</th>
						<th style="width:35%;text-align:center">부서</th>
						<th style="width:15%;text-align:center"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></th>
					<tr>
					<tr>
						<td colspan="4" style="height:80%">
							<div class="overflow-auto" style="width:100%;height:100%">
								<table style="width:100%;">
									<tr>
										<td style="width:20%;text-align:center;font-weight:bold;background-color:#fafafa"><a href="#" id="add4">>></a></td>
										<td style="width:30%;text-align:center"></td>
										<td style="width:35%;text-align:center"></td>
										<td style="width:15%;text-align:center"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
		  </div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="approvalInfoOk">확인</button>
        <button type="button" class="btn btn-secondary approvalInfoModalClose" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
  </form>
</div>

<!-- 결제선 생성 모달 -->

<div class="modal" tabindex="-1" id="addApprovalLineModal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:330px;height:330px">
	      <div class="modal-header">
	        <h5 class="modal-title">개인 결재선으로 저장</h5>
	        <button type="button" class="btn-close addApprovalLineModal-close" data-bs-dismiss="modal" aria-label="Close">X</button>
	      </div>
	      <div class="modal-body" style="height:330px">
	      	<div class="input-group">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="">결재선 이름</span>
			  </div>
			  <input type="text" class="form-control" id="addApprovalLineModalName">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="addApprovalLineModalOk">확인</button>
	        <button type="button" class="btn btn-secondary addApprovalLineModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	  
</div>

<!-- 결제선 불러오기 모달 -->

<div class="modal" tabindex="-1" id="loadApprovalLineModal">
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:330px;height:330px">
	      <div class="modal-header">
	        <h5 class="modal-title">나의 결재선</h5>
	        <button type="button" class="btn-close loadApprovalLineModal-close" data-bs-dismiss="modal" aria-label="Close">X</button>
	      </div>
	      <div class="modal-body">
	        <div id="loadApprovalModalContent" class="overflow-auto" style="height:150px">
    		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="loadApprovalLineModalOk">확인</button>
	        <button type="button" class="btn btn-secondary loadApprovalLineModal-close" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	  
</div>

<script type="text/javascript" src="<c:url value='/resources/js/tree.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.approvalInfoModalClose').click(function(){
		$('#approvalInfoModal').hide();
	})
	
	$('.approvalInfoBtn').click(function(){
		$('#approvalInfoModal').show();
	})
	
	$('#addApprovalLine').click(function(){
		$('#addApprovalLineModal').show();
	})
	
	$('.addApprovalLineModal-close').click(function(){
		$('#addApprovalLineModal').hide();
	})
	
	$('.loadApprovalLineModal-close').click(function(){
		$('#loadApprovalLineModal').hide();
	})
	
	
	
	
	
	<!-- 결재선 저장버튼 클릭 -->
	$('#addApprovalLineModalOk').click(function(){
		var malName=$('#addApprovalLineModalName').val();
		if(malName<1){
			Toastify({
				text:"결재선 이름을 입력하세요.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			$('#addApprovalLineModalName').focus();
			return false;
		}
		
		var temp=$('#add1').parent().parent().parent().children('tr:gt(3)');
		var malList=[];
		
		var detailTemp="";
		
		temp.each(function(idx,item){
			if(!$(this).children().is('td')){
				return false;
			}
			
			if($(this).children().is('td')){
				var malFull=$(this).children().eq(1).text();
				
				malList.push({"malName":malName,"malFull":malFull});
			}
		})
		
		if(malList.length==0){
			Toastify({
				text:"결재선 항목이 없습니다.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			return false;
		}
		
		
		$.ajax({
			url:'<c:url value="/mal/insert"/>',
			type:'post',
			data:JSON.stringify(malList),
			contentType: 'application/json',
			traditional:true,
			success:function(res){
				
				Toastify({
					text:res,
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				if(res=="추가되었습니다.")
					$('#addApprovalLineModal').hide();
			},
			error:function(e){
				alert("결재선 추가 ajax 에러");
			}
		})
		
	})
		
		$('#loadApprovalLine').click(function(){
			$('#loadApprovalLineModal').show();
			$.ajax({
				url:'<c:url value="/mal/load"/>',
				type:"get",
				dataType:"json",
				success:function(res){
					var temp="";
					$.each(res,function(idx,item){
						temp+='<p><a href="#" style="font-size:20px;font-weight:bold;color:#00001f">'+this+'</a></p>';
					})
					$('#loadApprovalModalContent').html(temp);
					$('#loadApprovalModalContent a').click(function(){
						$('#loadApprovalModalContent a').css('color','#00001f');
						$(this).css('color','#435ebe');
						
						var malName=$(this).text();
						
						$('#loadApprovalLineModalOk').click(function(){
							$.ajax({
								url:"<c:url value='/mal/load2'/>",
								type:"post",
								dataType:"json",
								data:{"malName":malName},
								success:function(res){
									var temp=$('#add1').parent().parent().parent().children('tr:gt(3)');
									
									temp.each(function(idx,item){
										if(!$(this).children().is('td')){
											return false;
										}
										if($(this).children().is('td')){
											$(this).remove();
											
										}
									})
									var idx1=1;
									$.each(res,function(idx,item){
										var str="";
										str+='<tr>';
										str+='<td style="width:20%;text-align:center">'+this.MALFULL+'</td>';
										str+='<td style="width:30%;text-align:center">'+this.DEPTNAME+'</td>';
										str+='<td style="width:15%;text-align:center"><a href="#" class="deleteBtn4"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></a></td>';
										str+='</tr>';
										$('#add1').parent().attr('rowspan',++idx1);
										$('#beforeTarget').before(str);
										
									})
									
									$('#loadApprovalLineModal').hide();
									Toastify({
										text:"등록되었습니다.",
										duration: 2000,
										close:false,
										gravity:"top",
										position:"center",
										backgroundColor:"black",
									}).showToast();
								},
								error:function(e){
									alert("불러오기 2 ajax");
								}
							})
						})
					})
				},
				error:function(e){
					alert("결재선 불러오기 ajax 에러")
				}
				
			})
		})
	
	
	$.ajax({
		url:"<c:url value='/emp/showOrganization'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			var tree1 = new Tree(document.getElementById('approvalInfoEmpTree'), {
			  navigate: true 
			});
			
			var tree2 = new Tree(document.getElementById('approvalInfoEmpTree2'), {
			  navigate: true 
			});
			
			var tree3 = new Tree(document.getElementById('approvalInfoEmpTree3'), {
				  navigate: true 
				});
			
			'use strict';
			
			var structure = [];
			
			var firstObj={ 
			  open: true,
			  type: Tree.FOLDER,
			  selected: false,
			  children:[]
			  };
			
			$.each(res,function(){
				if(this.upperDeptNo==0){
					firstObj.name=this.deptName+" ("+this.deptNo+")";
					var firstDeptNo=this.deptNo;
					var idx=0;
					$.each(res,function(){
						if(this.upperDeptNo==firstDeptNo){
							
							var secondObj={ 
							  open: true,
							  type: Tree.FOLDER,
							  children:[]
							  };
							secondObj.name=this.deptName+" ("+this.deptNo+")";
							firstObj.children.push(secondObj);
							
							var secondDeptNo=this.deptNo;
							$.each(res,function(){
								if(this.upperDeptNo==secondDeptNo){
									var thirdObj={ 
									  open: true,
									  type: Tree.FOLDER,
									  children:[]
									  };
								
									thirdObj.name=this.deptName+" ("+this.deptNo+")";
									firstObj.children[idx].children.push(thirdObj);
								}
							})
							idx++;
						}
					})
				}
			})
			$.ajax({
				url:"<c:url value='/emp/showOrganization2'/>",
				type:"get",
				dataType:"json",
				success:function(res){
					$.each(res,function(){
						var temp=firstObj.name.split('(')[1];
						if(this.DEPT_NO==temp.substring(0,temp.length-1)){
							firstObj.children.unshift({name:(this.EMP_NAME+" "+this.POS_NAME+" ("+this.EMP_NO+")")});
						}
					})
					
					$.each(res,function(idx,item){
						$.each(firstObj.children,function(idx2,item2){
							var temp=this.name.split('(')[1];
							if(temp!=null &&item.DEPT_NO==temp.substring(0,temp.length-1)){
								this.children.unshift({name:(item.EMP_NAME+" "+item.POS_NAME+" ("+item.EMP_NO+")")});
							}
						})
					})
					
					$.each(res,function(idx,item){
						$.each(firstObj.children,function(idx2,item2){
							if('children' in this){
								$.each(this.children,function(idx3,item3){
									var temp=this.name.split('(')[1];
									if(temp!=null&&item.DEPT_NO==temp.substring(0,temp.length-1)){
										this.children.unshift({name:(item.EMP_NAME+" "+item.POS_NAME+" ("+item.EMP_NO+")")});
									}
								})
							}
						})
					})
					structure.push(firstObj);
					tree1.json(structure);
					tree2.json(structure);
					tree3.json(structure);
					var idx1=1;
					var empName;
					var deptName;
					var empNo;
					var deptNo;
					$('#approvalInfoEmpTree a').click(function(){
						temp=$(this).text().split('(')[0];
						empName=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[0];
						deptName=temp.substring(0,temp.length-1);
						temp=$(this).text().split('(')[1];
						empNo=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[1];
						deptNo=temp.substring(0,temp.length-1);
					})
					$('#add1').click(function(){
						var bool=false;
							if(empName!=null){
								$(this).parent().parent().parent().children('tr').each(function(){
									if($(this).children('td').eq(1).text()==empName){
										Toastify({
											text:"중복된 대상입니다.",
											duration: 2000,
											close:false,
											gravity:"top",
											position:"center",
											backgroundColor:"black",
										}).showToast();
										bool=true;
										return false;
									}
								})
								if(bool) return false;
								var str="";
								str+='<tr>';
								str+='<td style="width:20%;text-align:center">결재</td>';
								str+='<td style="width:20%;text-align:center">'+empName+'<input type="hidden" value='+empNo+'></td>';
								str+='<td style="width:30%;text-align:center">'+deptName+'<input type="hidden" value='+deptNo+'></td>';
								str+='<td style="width:15%;text-align:center"><a href="#" class="deleteBtn"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></a></td>';
								str+='</tr>';
								$(this).parent().attr('rowspan',++idx1);
								$('#beforeTarget').before(str);
								
								
								
							}else{
								Toastify({
									text:"대상이 없습니다",
									duration: 2000,
									close:false,
									gravity:"top",
									position:"center",
									backgroundColor:"black",
								}).showToast();
							}
							
						})
						
					$(document).on('click','.deleteBtn',function(){
							$(this).parent().parent().remove();
							$('#add1').parent().attr('rowspan',--idx1);
						})	
					var idx2=1;
					var empName2;
					var deptName2;
					var empNo2;
					var deptNo2;
					$('#approvalInfoEmpTree a').click(function(){
						temp=$(this).text().split('(')[0];
						empName2=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[0];
						deptName2=temp.substring(0,temp.length-1);
						temp=$(this).text().split('(')[1];
						empNo2=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[1];
						deptNo2=temp.substring(0,temp.length-1);
					})
					$('#add2').click(function(){
						var bool=false;
							if(empName2!=null){
								$(this).parent().parent().parent().children('tr').each(function(){
									if($(this).children('td').eq(1).text()==empName2){
										Toastify({
											text:"중복된 대상입니다.",
											duration: 2000,
											close:false,
											gravity:"top",
											position:"center",
											backgroundColor:"black",
										}).showToast();
										bool=true;
										return false;
									}
								})
								if(bool) return false;
								var str="";
								str+='<tr>';
								str+='<td style="width:20%;text-align:center">수신</td>';
								str+='<td style="width:20%;text-align:center">'+empName2+'<input type="hidden" value='+empNo2+'></td>';
								str+='<td style="width:30%;text-align:center">'+deptName2+'<input type="hidden" value='+deptNo2+'></td>';
								str+='<td style="width:15%;text-align:center"><a href="#" class="deleteBtn2"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></a></td>';
								str+='</tr>';
								$(this).parent().attr('rowspan',++idx2);
								$(this).parent().parent().parent().append(str);
								
								
								
							}else{
								Toastify({
									text:"대상이 없습니다",
									duration: 2000,
									close:false,
									gravity:"top",
									position:"center",
									backgroundColor:"black",
								}).showToast();
							}
							
						})
						$(document).on('click','.deleteBtn2',function(){
							$(this).parent().parent().remove();
							$('#add2').parent().attr('rowspan',--idx2);
						})	
						
						<!-- 2번째 탭-->
						
					var idx3=1;
					var empName3
					var deptName3;
					var empNo3;
					var deptNo3;
					$('#approvalInfoEmpTree2 a').click(function(){
						temp=$(this).text().split('(')[0];
						empName3=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[0];
						deptName3=temp.substring(0,temp.length-1);
						temp=$(this).text().split('(')[1];
						empNo3=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[1];
						deptNo3=temp.substring(0,temp.length-1);
					})
					$('#add3').click(function(){
						var bool=false;
							if(empName3!=null){
								$(this).parent().parent().parent().children('tr').each(function(){
									if($(this).children('td').eq(1).text()==empName3){
										Toastify({
											text:"중복된 대상입니다.",
											duration: 2000,
											close:false,
											gravity:"top",
											position:"center",
											backgroundColor:"black",
										}).showToast();
										bool=true;
										return false;
									}
								})
								if(bool) return false;
								var str="";
								str+='<tr>';
								str+='<td style="width:20%;text-align:center">'+empName3+'<input type="hidden" value='+empNo3+'></td>';
								str+='<td style="width:30%;text-align:center">'+deptName3+'<input type="hidden" value='+deptNo3+'></td>';
								str+='<td style="width:15%;text-align:center"><a href="#" class="deleteBtn3"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></a></td>';
								str+='</tr>';
								$(this).parent().attr('rowspan',++idx3);
								$(this).parent().parent().parent().append(str);
								
								
								
							}else{
								Toastify({
									text:"대상이 없습니다",
									duration: 2000,
									close:false,
									gravity:"top",
									position:"center",
									backgroundColor:"black",
								}).showToast();
							}
							
						})
						
					$(document).on('click','.deleteBtn3',function(){
							$(this).parent().parent().remove();
							$('#add3').parent().attr('rowspan',--idx3);
						})	
						
						
					<!-- 3번째 탭 -->
						
					var idx4=1;
					var empName4;
					var deptName4;
					var empNo4;
					var deptNo4;
					$('#approvalInfoEmpTree3 a').click(function(){
						temp=$(this).text().split('(')[0];
						empName4=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[0];
						deptName4=temp.substring(0,temp.length-1);
						temp=$(this).text().split('(')[1];
						empNo4=temp.substring(0,temp.length-1);
						temp=$(this).parent().children('summary').text().split('(')[1];
						deptNo4=temp.substring(0,temp.length-1);
					})
					$('#add4').click(function(){
						var bool=false;
							if(empName4!=null){
								$(this).parent().parent().parent().children('tr').each(function(){
									if($(this).children('td').eq(1).text()==empName4){
										Toastify({
											text:"중복된 대상입니다.",
											duration: 2000,
											close:false,
											gravity:"top",
											position:"center",
											backgroundColor:"black",
										}).showToast();
										bool=true;
										return false;
									}
								})
								if(bool) return false;
								var str="";
								str+='<tr>';
								str+='<td style="width:20%;text-align:center">'+empName4+'<input type="hidden" value='+empNo4+'></td>';
								str+='<td style="width:30%;text-align:center">'+deptName4+'<input type="hidden" value='+deptNo4+'></td>';
								str+='<td style="width:15%;text-align:center"><a href="#" class="deleteBtn4"><img src="https://img.icons8.com/material-outlined/24/000000/trash--v1.png"/></a></td>';
								str+='</tr>';
								$(this).parent().attr('rowspan',++idx4);
								$(this).parent().parent().parent().append(str);
								
								
								
							}else{
								Toastify({
									text:"대상이 없습니다",
									duration: 2000,
									close:false,
									gravity:"top",
									position:"center",
									backgroundColor:"black",
								}).showToast();
							}
							
						})
						
					$(document).on('click','.deleteBtn4',function(){
							$(this).parent().parent().remove();
							$('#add4').parent().attr('rowspan',--idx4);
						})		
						
				},
				error:function(e){
					alert("조직도 ajax 오류2");
				}
			})
			
		},
		error:function(e){
			alert("조직도 ajax 오류1");
		}
		
	})
	
	$('#approvalInfoOk').click(function(){
		var temp=$('#add1').parent().parent().parent().children('tr:gt(3)');
		var str="";
		var bool1=false;
		
		var detailTemp="";
		
		temp.each(function(idx,item){
			if(!$(this).children().is('td')){
				return false;
			}
			if($(this).children().is('td')){
				var empName= $(this).children().eq(1).text().split(' ')[0];
				var empRank= $(this).children().eq(1).text().split(' ')[1];
				
				
				<!-- 결재선 상세에 표시하기 -->
				
				var deptName= $(this).children().eq(2).text();
				var empNo= $(this).children().eq(1).children('input').val();
				
				
				detailTemp+='<li style="height:50px;list-style:none;padding-left:5px;padding-top:15px;padding-bottom:15px;height:120px">';
				detailTemp+='<div style="float:left;width:50px">';
				
				detailTemp+='<img style="width:100%;height:100%;border-radius:25px" src="https://tour.daouoffice.com/thumb/user/small/4301-212117">';
					<!-- 이부분은 empNo를 이용해서 이미지를 구현할지, 매 순간 이미지를 불러올지 고민 -->
				detailTemp+='</div>';
				detailTemp+='<div style="float:left; margin-left:10px;height:100%;">';
				detailTemp+='<div style="font-size:15px;font-weight:bold;color:#00001f">'+$(this).children().eq(1).text()+'</div>';
				detailTemp+='<div style="font-size:15px;color:#9f9f9f">'+deptName+'</div>';
				detailTemp+='<div style="font-size:15px;color:#9f9f9f">결재</div>';
				detailTemp+='</div>';
				detailTemp+='</li>';
				
				<!-- 결재문서에 나타내기 -->
				if(bool1==false){
					str+='<span style="margin-left:5px" class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="10" data-group-type="type1" data-is-reception="">';
					str+='<span class="sign_tit_wrap">';
					str+='<span class="sign_tit">';
					str+='<strong>승인</strong>';
					str+='</span>';
					str+='</span>';
				}
				
				bool1=true;
				str+='<span class="sign_member_wrap">'
				str+='<span class="sign_member">';
				str+='<span class="sign_rank_wrap">';
				str+='<span class="sign_rank">'+empRank+"</span>";
				str+='</span>';
				str+='<span class="sign_wrap">';
				str+='<span class="sign_name">'+empName+'</span>';
				str+='</span>';
				str+='<span class="sign_date_wrap">';
				str+='<span class="sign_date"></span>';
				str+='</span>';
				str+='</span>';
				str+='</span>';
			}
		})
		
		<!--결제선 상세 넣어주기 -->
		$('#approvalLineDetail li').nextAll().remove();
		$('#approvalLineDetail li').after(detailTemp);
		
		if(bool1){
			str+='</span>';
		}
		
		
		
		var temp2=$('#add2').parent().parent().nextAll();
		<!--수신 문서상세에 표시하기 -->
		var detailTemp2="";
		
		temp2.each(function(idx,item){
			<!-- 문서 상세에 표시하기  - 수신 -->
			var empNo2= $(this).children().eq(1).children('input').val();
			var empName2=$(this).children().eq(1).text();
			detailTemp2+='<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">'+empName2+'</span>'
			
		})
		
		
		<!--결제선 상세 넣어주기 -->
		$('#formDetail2').html(detailTemp2);
		
		var temp3=$('#add3').parent().parent().nextAll();
		<!--수신 문서상세에 표시하기 -->
		var detailTemp3="";
		
		temp3.each(function(idx,item){
			<!-- 문서 상세에 표시하기  - 수신 -->
			var empNo3= $(this).children().eq(0).children('input').val();
			var empName3=$(this).children().eq(0).text();
			detailTemp3+='<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">'+empName3+'</span>'
			
		})
		
		
		<!--결제선 상세 넣어주기 -->
		$('#formDetail3').html(detailTemp3);
		
		var temp4=$('#add4').parent().parent().nextAll();
		<!--수신 문서상세에 표시하기 -->
		var detailTemp4="";
		
		temp4.each(function(idx,item){
			<!-- 문서 상세에 표시하기  - 수신 -->
			var empNo4= $(this).children().eq(0).children('input').val();
			var empName4=$(this).children().eq(0).text();
			detailTemp4+='<span style="border-radius:5px;background-color:#f2f7ff;color:#00001f;font-weight:bold;margin-right:10px">'+empName4+'</span>'
			
		})
	
		<!--결제선 상세 넣어주기 -->
		$('#formDetail4').html(detailTemp4);
		
		$('#drafterArea').next().remove();
		$('#drafterArea').after(str);
		$('#approvalInfoModal').hide();
		
	})
	
})



</script>