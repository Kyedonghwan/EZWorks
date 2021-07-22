<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Disabled Backdrop Modal -->
 <div class="modal fade text-left" id="backdrop" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel4" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
         role="document">
         <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="myModalLabel4">조직도</h4>
                 <button type="button" class="close" data-bs-dismiss="modal"
                     aria-label="Close">
                     <i data-feather="x"></i>
                 </button>
             </div>
             <div class="modal-body">
                 <table>
                 	<thead>
						<tr>
							<th>본부</th>
							<th>부서</th>
							<th>이름</th>
							<th>선택</th>
						</tr>
                 	</thead>
                 	<tbody>
                 		<tr>
                 			<td>경영지원본부</td>
                 			<td>인사팀</td>
                 			<td>홍길동</td>
                 			<td><input type="checkbox" checked></td>
                 		</tr>
                 	</tbody>
                 </table>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-primary ml-1"
                     data-bs-dismiss="modal">
                     <i class="bx bx-check d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">선택</span>
                 </button>
                 <button type="button" class="btn btn-light-secondary"
                     data-bs-dismiss="modal">
                     <i class="bx bx-x d-block d-sm-none"></i>
                     <span class="d-none d-sm-block">닫기</span>
                 </button>
             </div>
         </div>
     </div>
 </div>
