<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp" %>
<%@ include file="messageMenu/messageMenu.jsp"%>
<%@ include file="../include/middle.jsp"%>  
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/message/ssong.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" type="text/css"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	$('#login').on("click",function(e) {
		e.preventDefault();
		if ($('#inputEmail').val().length < 1) {
			alert('이메일을 입력하세요.');
			$('#inputEmail').focus();
			event.preventDefaulut();
		} else if ($('#inputPassword').val().length < 1) {
			alert('비밀번호를 입력하세요.');
			$('#inputPassword').focus();
			event.preventDefaulut();
		}
	});
});// */	
</script>   
   <form class="form-signin" name="frmInsert" method="post"
		action="<c:url value='/message/cfLogin'/>">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h2 class="card-title text-center">로그인하기</h2>
                     
                            <div class="form-label-group"> 
                            	<input type="email" id="inputEmail" class="form-control" name="userEmail"
                            		placeholder="이메일주소를 입력하세요" required autofocus> 
                            </div>
                            <div class="form-label-group">
                            	<input type="password" id="inputPassword" class="form-control" name="userPwd"
                            		placeholder="비밀번호를 입력하세요" required> 
                            </div>

                            <div class="custom-control custom-checkbox mb-3"> 
                            	<input type="checkbox" class="custom-control-input" id="customCheck1" name="customCheck"> 
                            	<label class="custom-control-label" for="customCheck1">아이디저장</label> 
                            </div> 
                            
                           		<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"
                           			id="login">로그인하기</button>
                           		
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<%@ include file="../include/bottom.jsp" %>  