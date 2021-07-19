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
						temp+="<td><input class='form-check-input' type='checkbox' value=''></td>";
						temp+="<td colspan='6'><img src='https://img.icons8.com/material-two-tone/24/000000/folder-invoices.png'/><a class='showArchiveList' href='#'>"+item.name+"<input type='hidden' name='folderNo' value='"+item.no+"'</a></td>";
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
								temp+="<td><input class='form-check-input' type='checkbox' value=''></td>";
								temp+="<td style='width:45%'>"+item.fileName+"</td>";
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
<section>
	<div>
		<ul style="list-style:none" class="sideMenu-ul">
			<li class="sidebar-item active has-sub">
				<a href="#" class="sidebar-link chevron-right">
               		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
               	</a>
				<a href="#" style="font-weight:bold" class="showArchiveList">전사자료실<input type="hidden" value='1' name='folderNo'></a>
                
                <ul class="submenu active" style="list-style:none;">
	                <c:forEach var="vo" items="${archiveFolderList}">
	                		<c:if test="${vo.step==1}">
	                			<c:if test="${vo.hasChild=='Y'}">
			                    	<li class="sidebar-item active has-sub">
			              			<a href="#" class="sidebar-link chevron-right">
			                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
			                    	</a>
				                    <a href="#" class="showArchiveList">${vo.name}<input type="hidden" value='${vo.no}' name='folderNo'></a>
				                        <ul class="submenu active" style="list-style:none">
							                <c:forEach var="vo2" items="${archiveFolderList}">
							                		<c:if test="${vo2.step==2 && vo.no==vo2.parentNo}">
							                			<c:if test="${vo2.hasChild=='Y'}">
									                    	<li class="sidebar-item active has-sub">
									              			<a href="#" class="sidebar-link chevron-right">
									                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
									                    	</a>
										                    <a href="#" class="showArchiveList">${vo2.name}<input type="hidden" value='${vo2.no}' name='folderNo'></a>
										                        <ul class="submenu active" style="list-style:none">
															        <c:forEach var="vo3" items="${archiveFolderList}">
												                		<c:if test="${vo3.step==3 && vo2.no==vo3.parentNo}">
												                			<c:if test="${vo3.hasChild=='Y'}">
														                    	<li class="sidebar-item active has-sub">
														              			<a href="#" class="sidebar-link chevron-right">
														                    		<img src="<c:url value='/resources/images/accordion/chevron-down.svg'/>" class="unfold">
														                    	</a>
															                    <a href="#" class="showArchiveList">${vo3.name}<input type="hidden" value='${vo3.no}' name='folderNo'></a>
															                        <ul class="submenu active" style="list-style:none">
															                        	<c:forEach var="vo4" items="${archiveFolderList}">
																	                		<c:if test="${vo4.step==4 && vo3.no==vo4.parentNo}">
																	                			<li class="submenu-item">
																									<a href="#"  class="showArchiveList">${vo4.name}<input type="hidden" value='${vo4.no}' name='folderNo'></a>
																								</li>
																				             </c:if>
																	                  </c:forEach>
															                    	</ul>
															                    </li>
															                </c:if>
											                    			<c:if test="${vo3.hasChild=='N'}">
											                    				<li class="submenu-item">
																					<a href="#"  class="showArchiveList">${vo3.name}<input type="hidden" value='${vo3.no}' name='folderNo'></a>
																				</li>
											                    			</c:if>
															             </c:if>
												                  </c:forEach>
										                    	</ul>
										                    </li>
										                </c:if>
						                    			<c:if test="${vo2.hasChild=='N'}">
						                    				<li class="submenu-item">
																<a href="#"  class="showArchiveList">${vo2.name}<input type="hidden" value='${vo2.no}' name='folderNo'></a>
															</li>
						                    			</c:if>
										             </c:if>
							                  </c:forEach>
				                    	</ul>
				                    </li>
				                </c:if>
                    			<c:if test="${vo.hasChild=='N'}">
                    				<li class="submenu-item">
										<a href="#"  class="showArchiveList">${vo.name}<input type="hidden" value='${vo.no}' name='folderNo'></a>
									</li>
                    			</c:if>
				             </c:if>
	                   </c:forEach>
				  </ul>
				  </li>
             	<br>
             <li class="sidebar-item active has-sub">
                <a href="#" class='sidebar-link'>
                    <!-- <i class="bi bi-stack"></i> -->
                    <span style="font-weight:bold">개인자료실</span>
                </a>
                <ul class="submenu active" style="list-style:none">
                    <li class="sidebar-item active has-sub">
                        <a href="#" class='sidebar-link'>영업팀<!-- require parameter --></a>
                    	<ul class="submenu active" style="list-style:none">
                    		<!-- forEach -->
                    		<li class="submenu-item" >
                    			<a href="#">영업실적보고</a>
                    		</li>
                    		<li class="submenu-item">
                    			<a href="#">익명게시판</a>
                    		</li>
                    		<li class="submenu-item">
                    			<a href="#">영업실적보고</a>
                    		</li>
                    	</ul>
                    
                    </li>
                </ul>
             </li>
             <li>
             	<a href="#" style="font-weight:bold;color:#999">
             		+ 자료실 추가
             	</a>
             </li>
         </ul>
	</div>
</section>