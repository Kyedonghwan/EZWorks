<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal" tabindex="-1" id="addMyCal">
		<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">내 캘린더 추가</h5>
							<button type="button" class="close rounded-pill"
								data-bs-dismiss="modal" aria-label="Close">
								<i data-feather="x"></i>
							</button>
						</div>
						<div class="modal-body">
							<div>
								<input type="text" name="addCate" class="input">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" id="add_ok" class="btn btn-primary ml-1"
								data-bs-dismiss="modal">
								<i class="bx bx-check d-block d-sm-none"></i> <span
									class="d-none d-sm-block">확인</span>
							</button>
							<button type="button" class="btn btn-light-primary"
								data-bs-dismiss="modal">
								<i class="bx bx-x d-block d-sm-none"></i> <span
									class="d-none d-sm-block">닫기</span>
							</button>
							</div>
						</div>
					</div>
</div>

