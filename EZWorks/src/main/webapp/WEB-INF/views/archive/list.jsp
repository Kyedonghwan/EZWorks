<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>
									
<!-- 소메뉴별 컨텐츠 구성 영역 -->									
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>
<script>	
	var editCheck=false;
	$(document).on('click','#editFolder',function(){
		var folderName=$(this).prev().text();
		$(this).parent().html("<td colspan='6'><input type='hidden' name='folderNo' value='"+$(this).prev().children('input').val()+"'><img src='https://img.icons8.com/material-two-tone/24/000000/folder-invoices.png'/><input type='text' class='form-control' id='editFolderName' value='"+folderName+"' style='width:200px;height:25px;display:inline'>&nbsp;<button type='button' id='editFolderOK' class='btn btn-primary btn-sm'>확인</button>&nbsp;<button type='button' id='editFolderCancel' class='btn btn-primary btn-sm'>취소</button></td>");
		$('#editFolderName').focus();
	});
	
	$(document).on('click','#editFolderOK',function(){
		var folderNo=$(this).prev().prev().prev().val();
		var folderName=$(this).prev().val();
		if(folderName.length<1){
			Toastify({
				text:"값을 입력하세요.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			$('#currentFolderName').focus();
			return false;
		}
		else if(folderName.length>12){
			Toastify({
				text:"12글자 이하로 입력하세요.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			$('#currentFolderName').focus();
			return false;
		}
		var obj={"no":folderNo,"name":folderName}
		$.ajax({
			url:"<c:url value='/archiveFolder/edit'/>",
			type:"get",
			dataType:"json",
			data:obj,
			success:function(){
				$.showFolderList();
				$.showSideBar();
				Toastify({
					text:"수정하였습니다.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				$('#currentFolderName').focus();
			},
			error:function(e){
				alert("edit-ajax에러");
			}
		})
	});
	
	$(document).on("click","#editFolderCancel",function(){
		$.showFolderList();
	});
	
	$(function(){
		
		$('#flexCheckDefault').click(function(){
			$('table .form-check-input').prop('checked',this.checked);
	});
		
		
		$('#deleteFolder').click(function(){
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
			var delArray=[];
			var checkArray=[];
			
			$('table .form-check-input:checked').each(function(){
				
				if($(this).hasClass("archiveCheckbox")){
					checkArray.push('archive');
					delArray.push($(this).val());
				}else if($(this).hasClass("archiveFolderCheckbox")){
					checkArray.push('archiveFolder');
					delArray.push($(this).val());
				}
				
				
			});
			
			var objParams = {
					"checkArray":checkArray,
					"delArray":delArray,
					"parentNo":$('#currentFolderNo').val()
			};
			
			
			$.ajax({
				url:"<c:url value='/archiveFolder/delete'/>",
				dataType:"json",
				type:"post",
				data:objParams,
				success:function(res){
					$.showFolderList();
					$.showSideBar();
					$('thead .form-check-input:checked').prop('checked',false);
					Toastify({
						text:"삭제되었습니다.",
						duration: 2000,
						close:false,
						gravity:"top",
						position:"center",
						backgroundColor:"black",
					}).showToast();
					return false;
				},
				error:function(e){
					alert('delete-ajax 에러');
				}
			})
		})
		
		var makeFolderCheck=true;
		
		$('#makeFolder').click(function(){
			if(makeFolderCheck){
				makeFolderCheck=false;
				var str="<div style='width:430px;padding:10px;font-weight:bold;border:1px dotted #e4dfdf;border-radius:5px'>";
	    		str+="새 폴더명: <input type='text' class='form-control' id='newFolderName' placeholder='폴더 이름을 추가하세요' style='width: 200px;height:25px;display:inline'>";
	    		str+="&nbsp;<button type='button' class='btn btn-primary btn-sm' id='okMakeFolder'>확인</button>";
	    		str+="&nbsp;<button type='button' class='btn btn-primary btn-sm' id='cancelMakeFolder'>취소</button></div>";
				$(this).siblings().eq(3).after(str);
				$('#okMakeFolder').prev().focus();	
			}
		})
		
		
		$(document).on("click","#downloadArchive",function(){
			var no =$(this).parent().prev().children('input').val();
			var originalFileName=$(this).text();
			var fileName=$(this).next().val();
			
			$('form[name="downloadFrm2"]').attr('action','<c:url value="/archive/download"/>');
			$('form[name="downloadFrm2"]>input[name="no"]').val(no);
			$('form[name="downloadFrm2"]>input[name="fileName"]').val(fileName);
			$('form[name="downloadFrm2"]>input[name="originalFileName"]').val(originalFileName);
			$('form[name="downloadFrm2"]').submit();
			Toastify({
				text:"파일 다운로드를 시작합니다.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
		})
		
		$('#downloadMultipleArchive').click(function(){
			$('form[name="downloadFrm"]').empty();
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
			
			$('form[name="downloadFrm"]').attr('action','<c:url value="/archive/downloadZip"/>');
			var idx=0;
			$('table .form-check-input:checked').each(function(){
				
				if($(this).hasClass("archiveCheckbox")){
					var temp="";
					var no =$(this).val();
					var originalFileName=$(this).parent().next().children('a').text();
					var fileName=$(this).parent().next().children('input').val();
					temp+='<input type="hidden" name="multipleFileList['+idx+'].no" value='+no+'>';
					temp+='<input type="hidden" name="multipleFileList['+idx+'].fileName" value='+fileName+'>';
					temp+='<input type="hidden" name="multipleFileList['+idx+'].originalFileName" value='+originalFileName+'>';
					
					$('form[name="downloadFrm"]').append(temp);
					idx++;
				}
			});
			$('form[name="downloadFrm"]').submit();
			Toastify({
				text:"파일 다운로드를 시작합니다.",
				duration: 2000,
				close:false,
				gravity:"top",
				position:"center",
				backgroundColor:"black",
			}).showToast();
			$('.form-check-input:checked').each(function(){
				$(this).prop('checked',false);
			})
		})
		
		$(document).on("click",'#cancelMakeFolder',function(){
			makeFolderCheck=true;
			$('#makeFolder').siblings().eq(4).remove();
		});
		
		$(document).on("click",'#okMakeFolder',function(){
			var folderNo=$('#currentFolderNo').val();
			
			var currentFolderName=$('#currentFolderName').text();
			if(currentFolderName.length<1){
				Toastify({
					text:"값을 입력하세요.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				$('#currentFolderName').focus();
				return false;
			}
			else if(currentFolderName.length>12){
				Toastify({
					text:"12글자 이하로 입력하세요.",
					duration: 2000,
					close:false,
					gravity:"top",
					position:"center",
					backgroundColor:"black",
				}).showToast();
				$('#currentFolderName').focus();
				return false;
			}
			var newName=$('#newFolderName').val();
			$.ajax({
				url:"<c:url value='/archiveFolder/insert'/>",
				type:"post",
				data:{parentNo:folderNo,name:newName},
				dataType:"json",
				success:function(res){
					$.showFolderList();
					$.showSideBar();
					Toastify({
						text:"추가하였습니다.",
						duration: 2000,
						close:false,
						gravity:"top",
						position:"center",
						backgroundColor:"black",
					}).showToast();
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
		<form action="post" name="downloadFrm">
		</form>
		<form action="post" name="downloadFrm2">
			<input name="no" type="hidden">
			<input name="fileName" type="hidden">
			<input name="originalFileName" type="hidden">
		</form>
	</section>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
  
                    	<button type="button" class="btn btn-primary btn-sm" id="makeFolder">새폴더</button>
						<button type="button" class="btn btn-primary btn-sm" id="downloadMultipleArchive">다운로드</button>
						<button type="button" class="btn btn-primary btn-sm" id="deleteFolder">삭제</button>
						<button type="button" class="btn btn-primary btn-sm" id="cloneFile">복사</button>
						<button type="button" class="btn btn-primary btn-sm" id="moveFile">이동</button>
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
    <%@ include file="cloneModal.jsp" %>
    <%@ include file="uploadModal.jsp" %>
    <%@ include file="moveModal.jsp" %>
    <!-- end row -->
    
</div>

    
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
							</div>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script src="<c:url value='/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/fontawesome/all.min.js'/>"></script>
	<script src="<c:url value='/resources/vendors/apexcharts/apexcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/pages/dashboard.js'/>"></script>
	<script src="<c:url value='/resources/js/archiveSidebar.js'/>"></script>
	
</body>

</html>					

