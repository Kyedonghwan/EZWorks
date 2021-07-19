<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
								
<!-- 소메뉴 구성 영역 -->								
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<script>
	$(function(){
		var makeFolderCheck=true;
		$('#fileUpload').click(function(){
			$('#uploadModal').modal('show');
		})
		$('#makeFolder').click(function(){
			if(makeFolderCheck){
				makeFolderCheck=false;
				var str="<div style='width:430px;padding:10px;font-weight:bold;border:1px dotted #e4dfdf;border-radius:5px'>";
	    		str+="새 폴더명: <input type='text' class='form-control' id='newFolderName' placeholder='폴더 이름을 추가하세요' style='width: 200px;height:25px;display:inline'>";
	    		str+="<button type='button' class='btn btn-primary btn-sm' id='okMakeFolder'>확인</button>";
	    		str+="<button type='button' class='btn btn-primary btn-sm' id='cancelMakeFolder'>취소</button></div>";
				$(this).siblings().eq(3).after(str);
				$('#okMakeFolder').prev().focus();	
			}
		})
		
		
		
		
		$(document).on("click",'#cancelMakeFolder',function(){
			makeFolderCheck=true;
			$('#makeFolder').siblings().eq(4).remove();
		});
		
		$(document).on("click",'#okMakeFolder',function(){
			var folderNo=$('#currentFolderNo').val();
			var currentFolderName=$('#currentFolderName').text();
			var newName=$('#newFolderName').val();
			$.ajax({
				url:"<c:url value='/archiveFolder/insert'/>",
				type:"post",
				data:{parentNo:folderNo,name:newName},
				dataType:"json",
				success:function(res){
					var temp=$('input[name="folderNo"][value='+folderNo+']');
					if(temp.parent().next().length>0){
						var str="<li class='submenu-item'>";
						str+="<a href='#' class='showArchiveList'>"+newName+"<input type='hidden' value='"+res+"' name='folderNo'></a>";
						
						str+="</li>";
						temp.parent().next().prepend(str);
					}else{
						console.log(temp.parent().parent().attr('class'));
						temp.parent().parent().empty;
						var str="<li class='sidebar-item active has-sub'>";
              			str+="<a href='#' class='sidebar-link chevron-right'>";
                		str+="<img src='<c:url value='/resources/images/accordion/chevron-down.svg'/>' class='unfold'></a>";
                    	str+="<a href='#' class='showArchiveList'>"+currentFolderName+"<input type='hidden' value='"+folderNo+"' name='folderNo'></a>";
						str+="<ul class='submenu active' style='list-style:none'>";
						str+="<li class='submenu-item'>";
						str+="<a href='#'  class='showArchiveList'>"+newName+"<input type='hidden' value='"+res+"' name='folderNo'></a>";
						str+="</li>";
						str+="</ul></li>";
						console.log(temp.parent().parent().attr('class'));
						temp.parent().parent().html(str);
					} 
						
					$.showFolderList();
				},
				error:function(xhr,status,error){
					alert("error!!"+error);
				}
			})
			makeFolderCheck=true;
			$('#makeFolder').siblings().eq(4).remove();
		});
	})
</script>
<style>
	tr>td:nth-child(7),td:nth-child(6),td:nth-child(5),td:nth-child(4),td:nth-child(3),th:nth-child(7),th:nth-child(6),th:nth-child(5),th:nth-child(4),th:nth-child(3){
		text-align:center;
	}
</style>
<div class="container">
   
    <!-- end row -->
	<section style="height:64px;padding:24px 24px 16px">
		<h5>
			<a id="currentFolderName">전사자료실
				<input type="hidden" id="currentFolderNo" value="1">
			</a>			
		</h5>
	</section>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
                    	<button type="button" class="btn btn-primary btn-sm" id="makeFolder">새폴더</button>
						<button type="button" class="btn btn-primary btn-sm">다운로드</button>
						<button type="button" class="btn btn-primary btn-sm">삭제</button>
						<button type="button" class="btn btn-primary btn-sm">복사</button>
						<button type="button" class="btn btn-primary btn-sm">이동</button>
                        <table class="table project-table table-centered table-nowrap">
                            <thead>
                                <tr>
                                    <th scope="col"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th>
                                    <th scope="col" style="width:45%">이름</th>
                                    <th scope="col">크기</th>
                                    <th scope="col">확장자</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">등록일자</th>
                                    <th scope="col" style="width:11%">다운받은 수</th>
                                </tr>
                            </thead>
                            <tbody id="tbody">
                            </tbody>
                        </table>
                    </div>
                    <!-- end project-list -->

                    <div class="pt-3">
                        <ul class="pagination justify-content-end mb-0">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="uploadModal.jsp" %>
    <!-- end row -->
    
</div>

    
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>

					
<%@ include file="../include/bottom.jsp" %>
