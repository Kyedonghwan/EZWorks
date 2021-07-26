<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.svg'/>" type="image/x-icon">
<style type="text/css">
	a{
		color:black;
		font-size:0.85em;
	 }	
	ul.submenu.active {
    	padding-left: 20px;
	}
	.sideMenu-ul{
		padding-left:1rem;
	}
</style>
<script>

	$.byte=function(fileSize, fixed) {
	    var str
	
	    //MB 단위 이상일때 MB 단위로 환산
	    if (fileSize >= 1024 * 1024) {
	        fileSize = fileSize / (1024 * 1024);
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' MB';
	    }
	    //KB 단위 이상일때 KB 단위로 환산
	    else if (fileSize >= 1024) {
	        fileSize = fileSize / 1024;
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' KB';
	    }
	    //KB 단위보다 작을때 byte 단위로 환산
	    else {
	        fileSize = (fixed === undefined) ? fileSize : fileSize.toFixed(fixed);
	        str = fileSize + ' Byte';
	    }
	    return str;
	}
	
	$(function(){
		
		$(document).on("click",'.chevron-right',function(){
			if($(this).children('img').attr("class")=="fold"){
				$(this).children('img').attr("src","<c:url value='/resources/images/accordion/chevron-down.svg'/>");
				$(this).children('img').attr("class","unfold");
			}else{
				$(this).children('img').attr("src","<c:url value='/resources/images/accordion/chevron-right.svg'/>");
				$(this).children('img').attr("class","fold");
			}
		});
		
		$(document).on("click",'.showArchiveList',function(){
			$('.showArchiveList').each(function(){
				if($(this).children('input').val()>2){
					$(this).css({'color':'black','font-weight':''});	
				}else{
					$(this).css({'color':'black','font-weight':'bold'});
				}
				
			})
			$(this).css({'color':'rgb(67 94 190)','font-weight':'bold'});
			
			
			
			$('#currentFolderName').contents()[0].textContent =$(this).text();
			var folderNo = $(this).children('input[name="folderNo"]').val();
			$('#currentFolderNo').val(folderNo);
			$.showFolderList();
			
		});
		
		$(document).on("click",'.showArchiveList2',function(){
			
			$.ajax({
				url:'<c:url value="/archiveFolder/showParentFolder"/>',
				type:"get",
				data:"no="+$('#currentFolderNo').val(),
				dataType:"json",
				success:function(res){
					$('#currentFolderNo').val(res.no);
					$('#currentFolderName').contents()[0].textContent =res.name;
					$.showFolderList();
					
					$('.showArchiveList').each(function(){
						if($(this).children('input').val()>2){
							$(this).css({'color':'black','font-weight':''});	
						}else{
							$(this).css({'color':'black','font-weight':'bold'});
						}
						
						if($(this).children('input').val()==res.no){
							$(this).css({'color':'rgb(67 94 190)','font-weight':'bold'});
						}
					})
				},
				error:function(e){
					alert("/archiveFolder/showParentFolder 에러");
				}
			})
			
		});
		
		/*$('.showArchiveList').click(function(){
			$('#currentFolderName').contents()[0].textContent =$(this).text();
			var folderNo = $(this).children('input[name="folderNo"]').val();
			$('#currentFolderNo').val(folderNo);
			$.showFolderList();
		});*/
		
		$.showFolderList=function(){
			
			
			var folderNo=$('#currentFolderNo').val();
			var temp="<tr><td></td><td colspan='6'><a style='text-decoration:underline' href='#' class='showArchiveList2'>..(상위폴더로)</a></td></tr>";
			if(folderNo==1 || folderNo==2){
				temp="";
			}
			$.ajax({
				url:'<c:url value="/archiveFolder/detailList"/>',
				type:"get",
				data:"no="+folderNo,
				dataType:"json",
				success:function(res){
					$.each(res,function(idx,item){
						temp+="<tr>";
						temp+="<td><input class='form-check-input archiveFolderCheckbox' type='checkbox' value='"+item.no+"'></td>";
						temp+="<td colspan='6'><img src='https://img.icons8.com/material-two-tone/24/000000/folder-invoices.png'/><a class='showArchiveList' href='#'> "+item.name+" <input type='hidden' name='folderNo' value='"+item.no+"'></a> <button type='button' id='editFolder' class='btn btn-primary btn-sm'>폴더수정</button></td>";
						temp+="</tr>";
					})
					
					$('#tbody').html(temp);
					temp="";
					$.ajax({
						url:'<c:url value="/archive/detailList"/>',
						type:"get",
						data:"folderNo="+folderNo,
						dataType:"json",
						success:function(res){
							$.each(res,function(idx,item){
								var d = new Date(item.regdate);
								var formattedDate = d.getFullYear() + "." + (d.getMonth() + 1) + "." + d.getDate();
								temp+="<tr>";
								temp+="<td><input class='form-check-input archiveCheckbox' type='checkbox' value='"+item.no+"'></td>";
								temp+="<td style='width:45%'><a href='#' id='downloadArchive'>"+item.originalFileName+"</a><input type='hidden' value='"+item.fileName+"'></td>";
								temp+="<td>"+$.byte(item.fileSize, 1)+"</td>";
								temp+="<td>"+item.ext+"</td>";
								temp+="<td>"+item.writer+"</td>";
								temp+="<td>"+formattedDate+"</td>";
								temp+="<td style='width:11%'>"+item.downCount+"</td>";
								temp+="</tr>";
								
							});
							$('#tbody').append(temp);
						},
						error:function(xhr,status,error){
							alert("error발생!"+error);
						}
					})
					
					
				},
				error:function(xhr,status,error){
					alert("error발생!"+error);
				}
			})
		}
		
		$.showSideBar=function(){
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
					temp+='<a href="#" style="font-weight:bold" class="showArchiveList">전사자료실<input type="hidden" value="1" name="folderNo"></a>';
					temp+='<ul class="submenu active" style="list-style:none;">';
					temp+='';
					$.each(res,function(idx,item){
						if(item.step==1){
							if(item.hasChild=='Y' && item.parentNo==1){
								temp+='<li class="sidebar-item active has-sub">';
								temp+='<a href="#" class="sidebar-link chevron-right">';
								temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
								temp+='</a>';
								temp+='<a href="#" class="showArchiveList">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
								temp+='<ul class="submenu active" style="list-style:none">';
								$.each(res,function(idx2,item2){
									if(item2.step==2 && item2.parentNo==item.no){
										if(item2.hasChild=='Y'){
											temp+='<li class="sidebar-item active has-sub">';
											temp+='<a href="#" class="sidebar-link chevron-right">';
											temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
											temp+='</a>';
											temp+='<a href="#" class="showArchiveList">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
											temp+='<ul class="submenu active" style="list-style:none">';
											$.each(res,function(idx3,item3){
												if(item3.step==3 && item3.parentNo==item2.no){
													if(item3.hasChild=='Y'){
														temp+='<li class="sidebar-item active has-sub">';
														temp+='<a href="#" class="sidebar-link chevron-right">';
														temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
														temp+='</a>';
														temp+='<a href="#" class="showArchiveList">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
														temp+='<ul class="submenu active" style="list-style:none">';
														$.each(res,function(idx4,item4){
															if(item4.step==4 && item4.parentNo==item3.no){
																	temp+='<li class="submenu-item">';
																	temp+='<a href="#"  class="showArchiveList">'+item4.name+'<input type="hidden" value='+item4.no+' name="folderNo"></a>';
																	temp+='</li>';
															}
														})
														temp+='</ul>';
														temp+='</li>';
													}else{
														temp+='<li class="submenu-item">';
														temp+='<a href="#"  class="showArchiveList">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
														temp+='</li>';
													}
												}
											})
											temp+='</ul>';
											temp+='</li>';
										}else{
											temp+='<li class="submenu-item">';
											temp+='<a href="#"  class="showArchiveList">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
											temp+='</li>';
										}
									}
								})
								temp+='</ul>';
								temp+='</li>';
							}else if(item.hasChild=='N'&& item.parentNo==1){
								temp+='<li class="submenu-item">';
								temp+='<a href="#"  class="showArchiveList">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
								temp+='</li>';
							}
						}
					})
					temp+='</ul>';
					temp+='</li>';
					temp+='</ul>';
					temp+='<br>';
					temp+='<ul style="list-style:none" class="sideMenu-ul">';
					temp+='<li class="sidebar-item active has-sub">';
					temp+='<a href="#" class="sidebar-link chevron-right">';
					temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
					temp+='</a>';
					temp+='<a href="#" style="font-weight:bold" class="showArchiveList">개인자료실<input type="hidden" value="2" name="folderNo"></a>';
					temp+='<ul class="submenu active" style="list-style:none;">';
					$.each(res,function(idx,item){
						if(item.step==1 && item.parentNo==2){
							if(item.hasChild=='Y'){
								temp+='<li class="sidebar-item active has-sub">';
								temp+='<a href="#" class="sidebar-link chevron-right">';
								temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
								temp+='</a>';
								temp+='<a href="#" class="showArchiveList">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
								temp+='<ul class="submenu active" style="list-style:none">';
								$.each(res,function(idx2,item2){
									if(item2.step==2 && item2.parentNo==item.no){
										if(item2.hasChild=='Y'){
											temp+='<li class="sidebar-item active has-sub">';
											temp+='<a href="#" class="sidebar-link chevron-right">';
											temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
											temp+='</a>';
											temp+='<a href="#" class="showArchiveList">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
											temp+='<ul class="submenu active" style="list-style:none">';
											$.each(res,function(idx3,item3){
												if(item3.step==3 && item3.parentNo==item2.no){
													if(item3.hasChild=='Y'){
														temp+='<li class="sidebar-item active has-sub">';
														temp+='<a href="#" class="sidebar-link chevron-right">';
														temp+='<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">';
														temp+='</a>';
														temp+='<a href="#" class="showArchiveList">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
														temp+='<ul class="submenu active" style="list-style:none">';
														$.each(res,function(idx4,item4){
															if(item4.step==4 && item4.parentNo==item3.no){
																	temp+='<li class="submenu-item">';
																	temp+='<a href="#"  class="showArchiveList">'+item4.name+'<input type="hidden" value='+item4.no+' name="folderNo"></a>';
																	temp+='</li>';
															}
														})
														temp+='</ul>';
														temp+='</li>';
													}else{
														temp+='<li class="submenu-item">';
														temp+='<a href="#"  class="showArchiveList">'+item3.name+'<input type="hidden" value='+item3.no+' name="folderNo"></a>';
														temp+='</li>';
													}
												}
											})
											temp+='</ul>';
											temp+='</li>';
										}else{
											temp+='<li class="submenu-item">';
											temp+='<a href="#"  class="showArchiveList">'+item2.name+'<input type="hidden" value='+item2.no+' name="folderNo"></a>';
											temp+='</li>';
										}
									}
								})
								temp+='</ul>';
								temp+='</li>';
							}else if(item.hasChild=='N'&& item.parentNo==2){
								temp+='<li class="submenu-item">';
								temp+='<a href="#"  class="showArchiveList">'+item.name+'<input type="hidden" value='+item.no+' name="folderNo"></a>';
								temp+='</li>';
							}
						}
					})
					temp+='</ul>';
					temp+='</li>';
					temp+='</ul>';
					$('#main-sidebar').html(temp);
				},
				error:function(res){
					alert("ajax 에러 - list");
				}
			})	
		}
		
		//처음시작할때
		$.showSideBar();
		$('#currentFolderNo').val(1);
		$.showFolderList();
	})
</script>
<section style="height:64px;padding:24px 24px 16px;">
	<h5>
		<a>자료실</a>
	</h5>
</section>
<section style="height:64px;padding:0px 24px 16px;">
	<div  style="align:center;width:auto;">
			<a href="#" id="fileUpload" class="btn btn-outline-secondary" style="width:100%;font-size:0.85em;">
				파일 업로드
			</a>
	</div>
</section>
<section >
	<div id="main-sidebar">
	
	</div>
</section>