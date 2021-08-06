<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal" id="organizationModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" id="oragnizationClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <div id="empContent">
        	
        </div>
      </div>
    </div>
  </div>
</div>
<style>
	#organizationModal .modal-dialog {
   
   	margin:0px;
   	top: 300px;
    left: 260px;
    width: 300px
	};
	
	#organizationModal .modal-content {
    height: 460px;
	}
	#organizationModal .card-body.text-center {
    padding: 0px;
	}

	#organizationModal .modal-body {
	    height: 400px;
	}
</style>
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
			var tree = new Tree(document.getElementById('tree'), {
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
		
	});
	
})



</script>

