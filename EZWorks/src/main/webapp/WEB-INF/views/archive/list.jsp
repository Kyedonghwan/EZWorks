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
		$('#fileUpload').click(function(){
			$('#uploadModal').modal('show');
		})
		
	})
</script>
<style>
	tr>td:nth-child(7),td:nth-child(6),td:nth-child(5),td:nth-child(4),td:nth-child(3),th:nth-child(7),th:nth-child(6),th:nth-child(5),th:nth-child(4),th:nth-child(3){
		text-align:center;
	}
</style>
<div class="container">
   
    <!-- end row -->
	
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
                    	<button type="button" class="btn btn-primary btn-sm">새폴더</button>
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
                            <tbody>
                                <tr>
                                    <td><input class="form-check-input" type="checkbox" value=""></td>
                                    <td style="width:45%">New admin Design</td>
                                    <td>
                                        28.6M
                                    </td>
                                    <td>pdf</td>
                                    <td>신라면</td>
                                    <td>02/5/2019</td>
                                    <td style="width:11%">13</td>
                                </tr>
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
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
    
    // Filepond: Multiple Files
    FilePond.create( document.querySelector('.multiple-files-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: false
    });
</script>
					
<%@ include file="../include/bottom.jsp" %>
