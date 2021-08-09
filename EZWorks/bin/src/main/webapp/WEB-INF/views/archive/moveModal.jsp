<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>




$(function(){
	var modalFolderNo=1;
	
	$(document).on("click",'.folderModal2',function(){
		$('.folderModal2').each(function(){
			if($(this).children('input').val()>2){
				$(this).css({'color':'black','font-weight':''});	
			}else{
				$(this).css({'color':'black','font-weight':'bold'});
			}
			
		})
		$(this).css({'color':'rgb(67 94 190)','font-weight':'bold'});
		modalFolderNo=$(this).children('input').val();
	});
	
	$('#moveOk').click(function(){
		$('folderModal2').eq(0).css({'color':'rgb(67 94 190)','font-weight':'bold'});
		var moveArchivesList = [];
		$('table .form-check-input:checked').each(function(){
			if($(this).hasClass("archiveCheckbox")){
				var no =$(this).val();
				moveArchivesList.push(no);
			}
		});
		$.ajax({
			url:'<c:url value="/archive/move"/>',
			type:"post",
			dataType:"json",
			data:{
				"moveArchivesList":moveArchivesList,
				"folderNo":modalFolderNo
			},
			success:function(res){
				Toastify({
					text:"이동되었습니다.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				modalFolderNo=1;
				$('.form-check-input:checked').prop('checked',false);
				$('#moveModal').modal('hide');
				$.showFolderList();
			},
			error:function(e){
				alert("파일이동 실패-ajax error");
			}
			
		})
	})
	
	$('#moveFile').click(function(){
		
		if($('table .form-check-input:checked').length<1){
			Toastify({
				text:"선택된 항목이 없습니다.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			return false;
		}
		
		var exit=false;
		$('table .form-check-input:checked').each(function(){
			if($(this).hasClass("archiveFolderCheckbox")){
				Toastify({
					text:"폴더는 이동할 수 없습니다.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				exit=true;
				return false;
			}
		});
		if(exit){
			return false;
		}
		$('#moveModal').modal('show');
		$.ajax({
			url:"<c:url value='/archiveFolder/list'/>",
			dataType:"json",
			type:"get",
			success:function(res){
				var temp="";
				temp+='<ul style="list-style:none" class="sideMenu-ul">';
				temp+='<li class="sidebar-item active has-sub">';
				temp+='<a href="#" class="sidebar-link chevron-right">';
				temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
				temp+='</a>';
				temp+='<a href="#" style="font-weight:bold" class="folderModal2">전사자료실<input type="hidden" value="1" name="folderNo"></a>';
				temp+='<ul class="submenu active" style="list-style:none;">';
				temp+='';
				$.each(res,function(idx,item){
					if(item.step==1){
						if(item.hasChild=='Y' && item.parentNo==1){
							temp+='<li class="sidebar-item active has-sub">';
							temp+='<a href="#" class="sidebar-link chevron-right">';
							temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
							temp+='</a>';
							temp+='<a href="#" class="folderModal2">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
							temp+='<ul class="submenu active" style="list-style:none">';
							$.each(res,function(idx2,item2){
								if(item2.step==2 && item2.parentNo==item.no){
									if(item2.hasChild=='Y'){
										temp+='<li class="sidebar-item active has-sub">';
										temp+='<a href="#" class="sidebar-link chevron-right">';
										temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
										temp+='</a>';
										temp+='<a href="#" class="folderModal2">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
										temp+='<ul class="submenu active" style="list-style:none">';
										$.each(res,function(idx3,item3){
											if(item3.step==3 && item3.parentNo==item2.no){
												if(item3.hasChild=='Y'){
													temp+='<li class="sidebar-item active has-sub">';
													temp+='<a href="#" class="sidebar-link chevron-right">';
													temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
													temp+='</a>';
													temp+='<a href="#" class="folderModal2">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
													temp+='<ul class="submenu active" style="list-style:none">';
													$.each(res,function(idx4,item4){
														if(item4.step==4 && item4.parentNo==item3.no){
																temp+='<li class="submenu-item">';
																temp+='<a href="#"  class="folderModal2">'+item4.name+'<input type="hidden" value='+item4.no+' name="folderNo"></a>';
																temp+='</li>';
														}
													})
													temp+='</ul>';
													temp+='</li>';
												}else{
													temp+='<li class="submenu-item">';
													temp+='<a href="#"  class="folderModal2">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
													temp+='</li>';
												}
											}
										})
										temp+='</ul>';
										temp+='</li>';
									}else{
										temp+='<li class="submenu-item">';
										temp+='<a href="#"  class="folderModal2">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
										temp+='</li>';
									}
								}
							})
							temp+='</ul>';
							temp+='</li>';
						}else if(item.hasChild=='N'&& item.parentNo==1){
							temp+='<li class="submenu-item">';
							temp+='<a href="#"  class="folderModal2">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
							temp+='</li>';
						}
					}
				})
				temp+='</ul>';
				temp+='</li>';
				temp+='</ul>';
				temp+='<hr>';
				temp+='<ul style="list-style:none" class="sideMenu-ul">';
				temp+='<li class="sidebar-item active has-sub">';
				temp+='<a href="#" class="sidebar-link chevron-right">';
				temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
				temp+='</a>';
				temp+='<a href="#" style="font-weight:bold" class="folderModal2">개인자료실<input type="hidden" value="2" name="folderNo"></a>';
				temp+='<ul class="submenu active" style="list-style:none;">';
				$.each(res,function(idx,item){
					if(item.step==1 && item.parentNo==2){
						if(item.hasChild=='Y'){
							temp+='<li class="sidebar-item active has-sub">';
							temp+='<a href="#" class="sidebar-link chevron-right">';
							temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
							temp+='</a>';
							temp+='<a href="#" class="folderModal2">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
							temp+='<ul class="submenu active" style="list-style:none">';
							$.each(res,function(idx2,item2){
								if(item2.step==2 && item2.parentNo==item.no){
									if(item2.hasChild=='Y'){
										temp+='<li class="sidebar-item active has-sub">';
										temp+='<a href="#" class="sidebar-link chevron-right">';
										temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
										temp+='</a>';
										temp+='<a href="#" class="folderModal2">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
										temp+='<ul class="submenu active" style="list-style:none">';
										$.each(res,function(idx3,item3){
											if(item3.step==3 && item3.parentNo==item2.no){
												if(item3.hasChild=='Y'){
													temp+='<li class="sidebar-item active has-sub">';
													temp+='<a href="#" class="sidebar-link chevron-right">';
													temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
													temp+='</a>';
													temp+='<a href="#" class="folderModal2">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
													temp+='<ul class="submenu active" style="list-style:none">';
													$.each(res,function(idx4,item4){
														if(item4.step==4 && item4.parentNo==item3.no){
																temp+='<li class="submenu-item">';
																temp+='<a href="#"  class="folderModal2">'+item4.name+'<input type="hidden" value='+item4.no+' name="folderNo"></a>';
																temp+='</li>';
														}
													})
													temp+='</ul>';
													temp+='</li>';
												}else{
													temp+='<li class="submenu-item">';
													temp+='<a href="#"  class="folderModal2">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
													temp+='</li>';
												}
											}
										})
										temp+='</ul>';
										temp+='</li>';
									}else{
										temp+='<li class="submenu-item">';
										temp+='<a href="#"  class="folderModal2">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
										temp+='</li>';
									}
								}
							})
							temp+='</ul>';
							temp+='</li>';
						}else if(item.hasChild=='N'&& item.parentNo==2){
							temp+='<li class="submenu-item">';
							temp+='<a href="#"  class="folderModal2">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
							temp+='</li>';
						}
					}
				})
				temp+='</ul>';
				temp+='</li>';
				temp+='</ul>';
				$('#moveModalContent').html(temp);
				
			},
			error:function(e){
				alert("moveModal - 에러");
			}
		})
	})
	
	
})
</script>
<!-- 파일복사 모달 -->
    <div class="modal" tabindex="-1" id="moveModal">
    	<form name="moveFrm" method="post" 
			 enctype="multipart/form-data" >
	  <div class="modal-dialog">
	    <div class="modal-content" style="width:500px;height:450px">
	      <div class="modal-header">
	        <h5 class="modal-title">대상폴더 선택</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div id="moveModalContent" class="overflow-auto" style="height:275px">
    		</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="moveOk">확인</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	  </form>
	</div>