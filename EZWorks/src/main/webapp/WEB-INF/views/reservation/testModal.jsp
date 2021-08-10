<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade text-left" id="testModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true"
	data-bs-backdrop="false" >
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
			role="document">
			<div class="modal-content" 
				style="width: 400px; height: 700px; box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, .2);">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel4">내 캘린더 추가</h4>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<i data-feather="x"></i>
					</button>
				</div>
				<div class="modal-body" >
					<div id="tree2">
					
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light-secondary"
						data-bs-dismiss="modal">
						<i class="bx bx-x d-block d-sm-none"></i> <span
							class="d-none d-sm-block">취소</span>
					</button>
					<button type="submit" class="btn btn-primary ml-1"
						data-bs-dismiss="modal" id="cateInsertOk">
						<i class="bx bx-check d-block d-sm-none"></i> <span
							class="d-none d-sm-block">확인</span>
					</button>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/tree.js'/>"></script>
<script type="text/javascript">

$(function(){
	
	$('#organizationDropdown').on('click', function(event){  
    	event.stopPropagation();
	});
	$('#organizationModal').on('click', function(event){  
    	event.stopPropagation();
	});
	
	$('#oragnizationClose').on('click',function(){
		$('#organizationModal').hide();
	});
	$.ajax({
		url:"<c:url value='/emp/showOrganization'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			var tree = new Tree(document.getElementById('tree2'), {
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
					firstObj.name=this.deptName;
					var firstDeptNo=this.deptNo;
					var idx=0;
					$.each(res,function(){
						if(this.upperDeptNo==firstDeptNo){
							
							var secondObj={ 
							  open: true,
							  type: Tree.FOLDER,
							  children:[]
							  };
							secondObj.name=this.deptName;
							firstObj.children.push(secondObj);
							
							var secondDeptNo=this.deptNo;
							$.each(res,function(){
								if(this.upperDeptNo==secondDeptNo){
									var thirdObj={ 
									  open: true,
									  type: Tree.FOLDER,
									  children:[]
									  };
								
									thirdObj.name=this.deptName;
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
						if(this.DEPT_NAME==firstObj.name){
							firstObj.children.unshift({name:(this.EMP_NAME+" "+this.POS_NAME)});
						}
					})
					
					$.each(res,function(idx,item){
						$.each(firstObj.children,function(idx2,item2){
							if(item.DEPT_NAME==this.name){
								this.children.unshift({name:(item.EMP_NAME+" "+item.POS_NAME)});
							}
						})
					})
					
					$.each(res,function(idx,item){
						$.each(firstObj.children,function(idx2,item2){
							if('children' in this){
								$.each(this.children,function(idx3,item3){
									if(item.DEPT_NAME==this.name){
										this.children.unshift({name:(item.EMP_NAME+" "+item.POS_NAME)});
									}
								})
							}
						})
					})
					structure.push(firstObj);
					tree.json(structure);	
					$('#tree a').click(function(){
						$('#organizationModal').show();
						var tel;
						var email;
						var tree_a=$(this);
						$.each(res,function(){
							console.log(this.EMP_NAME+" "+this.POS_NAME);
							if((this.EMP_NAME+" "+this.POS_NAME)==tree_a.text()  ){
								email=this.EMP_EMAIL;
								tel=this.EMP_TEL;
							}
						})
						
						var temp='';
						temp+='<div class="card">';
	                    temp+='<div class="card-body text-center">';
	                    temp+='<div> <img src="https://img.icons8.com/bubbles/100/000000/administrator-male.png" class="img-lg rounded-circle mb-4" alt="profile image">';
	                    temp+='<h4>'+$(this).text()+'</h4>';
	                    temp+='<p class="text-muted mb-0">'+email+'</p>';
	                    temp+='<p class="text-muted mb-0">'+$(this).parent().children('summary').text()+'</p>';
	                    temp+='</div>';
	                    temp+=' <p class="mt-2 card-text">Cell. '+tel+'</p>';
	                    temp+='<div class="border-top pt-3">';
	                    temp+='<div class="row">';
	                    temp+='<div class="col-6">';
	                    temp+='<button class="btn btn-primary btn-sm mt-3 mb-4">쪽지보내기</button>';
	                    temp+='</div>';
	                    temp+='<div class="col-6">';
	                    temp+='<button class="btn btn-primary btn-sm mt-3 mb-4">일정보기</button>';
	                    temp+='</div>';
	                    temp+='</div>';
	                    temp+='</div>';
	                    temp+='</div>';
	                    temp+='</div>';
	                    $('#empContent').html(temp);
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
})



</script>