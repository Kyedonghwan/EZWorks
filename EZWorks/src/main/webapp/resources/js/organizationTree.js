$(function(){
	
	$('#organizationDropdown').on('click', function(event){
    	event.stopPropagation();
	});
	
	$.ajax({
		url:"<c:url value='/emp/showOrganization'/>",
		type:"get",
		dataType:"json",
		success:function(res){
			console.log(res);
			var tree = new Tree(document.getElementById('tree'), {
			  navigate: true // allow navigate with ArrowUp and ArrowDown
			});
			'use strict';
			
			var structure = [];
			
			var firstObj={ 
			  open: false,
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
							  open: false,
							  type: Tree.FOLDER,
							  children:[]
							  };
							secondObj.name=this.deptName;
							firstObj.children.push(secondObj);
							
							var secondDeptNo=this.deptNo;
							$.each(res,function(){
								if(this.upperDeptNo==secondDeptNo){
									var thirdObj={ 
									  open: false,
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
				},
				error:function(e){
					alert("조직도 ajax 오류2");
				}
			})
			
		},
		error:function(e){
			alert("조직도 ajax 에러1");
		}
		
	})
})