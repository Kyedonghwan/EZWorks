<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>				
<%@ include file="sideMenu.jsp" %>			
<%@ include file="../include/middle.jsp" %>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>

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

    
</div>

    

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
<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>	
</body>

</html>	