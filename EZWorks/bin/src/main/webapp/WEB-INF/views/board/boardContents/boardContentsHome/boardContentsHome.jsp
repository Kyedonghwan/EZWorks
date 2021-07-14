<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.nav-link{
		font-size:0.75em;
	}
	.tab-pane li {
    border: 1px solid #dfe3e7;
    border-bottom: none;
	}
	
	.tab-pane li:last-child {
	    border-bottom: 1px solid #dfe3e7;
	}
</style>
</head>
<body>
	<section style="padding:0px;border:1px solid black">
		<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item" role="presentation" style="background-color:white">
					<a class="nav-link" id="favorites-tab" data-bs-toggle="tab" href="#favorites" role="tab" 
					aria-controls="favorites" aria-selected="false" style="background-color:white">
						즐겨찾기
					</a>
				</li>
				<li class="nav-item" role="presentation">
					<a class="nav-link active" id="home-tab" data-bs-toggle="tab" href="#home" role="tab"
					aria-controls="home" aria-selected="true" style="background-color:white">
						전체 게시판
					</a>
				</li>
			</ul>
	</section>
	<div style="margin:0px;padding:0px">
	<section style="margin-right:250px;padding:0px;border:1px solid black">
		<div style="margin:0px;padding:0px">
			<div class="tab-content" id="myTabContent" style="border-top:1px solid #dfe3e7">
				<div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="favorites-tab">
					<p>favorites</p>
							<ul style="list-style:none;padding:0px">
								<c:forEach var="i" begin="0" end="10">
								<li style="padding:16px 24px">
									<div style="margin:0px;">
										<span>다우그룹 <span>></span>
										<a>다우오피스 소식</a>
										</span>
										
										<span>
											<span>댓글 아이콘</span>
											<span>댓글 수</span>
										</span>
										<div>
											<a>게시글 제목</a>
										</div>
										<div>
											<span><a><img alt="" src="">이미지 사진</a></span>
											<a>김지연 부장</a>
											<span>등록일</span>
										</div>
									</div>
								</li>
								</c:forEach>
							</ul>
				</div>
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>home</p>
					<ul style="list-style:none;padding:0px">
						<c:forEach var="i" begin="0" end="3">
							<li style="padding:16px 24px;margin:0px 0px;">
								<div style="margin:0px;">
									<span>다우그룹 <span>></span>
									<a>다우오피스 소식</a>
									</span>
									
									<span>
										<span>댓글 아이콘</span>
										<span>댓글 수</span>
									</span>
									<div>
										<a>게시글 제목</a>
									</div>
									<div>
										<span><a><img alt="" src="">이미지 사진</a></span>
										<a>김지연 부장</a>
										<span>등록일</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 최신글 모음 -->
	<section style="width:auto;">
		<div style="margin:0px;padding:0px">
			
		</div>
	</section>
	</div>
</body>

</html>