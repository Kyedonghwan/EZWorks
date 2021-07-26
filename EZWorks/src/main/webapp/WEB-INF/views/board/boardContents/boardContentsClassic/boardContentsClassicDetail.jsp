<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	#buttons button{
		border-color:white;
		font-size:0.8em;
		color:#607080
	}
	#buttons button:hover{
		background-color:#eeeeee;
	}
</style>
<body>

	<section style="padding:0px">

		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left">
			<h5>
				<a>${boardVo.boardName }</a> <a href="#"><span id="fav-toggle" class="fa-fw select-all fas" style="height:15px"></span></a>
			</h5>
		</div>

	</section>
	
	<section style="padding:0px">
		<div style="padding:5px;padding-top:10px;margin:20px;border:1px solid #dfe3e7;border-radius:3px;background-color:#f9f9f9">
			<ul style="font-size:0.8em;list-style:none">
				<li>
					<c:if test="${!empty adminList }">
					<span>운영자:
						<c:forEach var="admin" items="${adminList }">
							${admin } 
						</c:forEach>
					</span></c:if>
				</li>
				<li>
					<span>${boardVo.boardDescription }</span>
				</li>
			</ul>
		</div>
	</section>
	
	<section style="padding:0px;border-bottom:1px solid #dfe3e7">
		<div id = "buttons" style="margin:0px 20px 10px 20px">
			<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp새글쓰기</button>
			<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp수정</button>
			<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp삭제</button>
			<button class="btn btn-outline-primary btn-sm" href="#"><span class="fa-fw select-all fas"></span>&nbsp&nbsp메일발송</button>
			<button class="btn btn-outline-primary btn-sm" href="#" style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp인쇄</button>
			<button class="btn btn-outline-primary btn-sm" href="#" style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp목록</button>
			<button class="btn btn-outline-primary btn-sm" href="#" style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp아래</button>
			<button class="btn btn-outline-primary btn-sm" href="#" style="float:right"><span class="fa-fw select-all fas"></span>&nbsp&nbsp위</button>
		</div>
	</section>
	
	<section>
		<div style="padding:0px;margin:0px;margin:20px;">
			<h5>${vo.postingTitle }</h5>
		</div>
		<div style="padding:0px;margin:0px">
			<span class="avatar avatar-sm"><img alt="" src="<c:url value='/resources/empImages/${vo.empImg }'/>"></span>
		</div>
	</section>
</body>
</html>