<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<beans:bean class="org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter">
	<beans:property name="messageConverters">
		<beans:list>
			<beans:bean class="org.springframework.http.converter.json.MappingJacksonHttpMessageConverter"/>
		</beans:list>
	</beans:property>
</beans:bean>
<style type="text/css">
	.nav-link{
		font-size:0.75em;
	}
	.tab-pane li {
    border-bottom: 1px solid #dfe3e7;
    border-collapse:collapse;
	}
	
	.tab-pane li:last-child {
	    border-bottom: 1px solid #dfe3e7;
	}
	
	.tab-pane li:first-child{
		border-top: 1px solid #dfe3e7;
	}
	
	#contents{
		border-left: 1px solid #dfe3e7;
		border-right: 1px solid #dfe3e7;
	}
	span.recent-header{
		font-size:0.9em;
		font-weight:bold;
	}
	span.recent-menu{
		font-size:0.8em;
		font-weight:bold;
	}
	
	div.contents {
    all: initial;
    * {
        all: unset;
    	
    	}
    }
    div.contents{
	    padding:10px 20px 10px 20px;
    }
    #fileBtnArea:hover{
    	background-color:#eeeeee;
    }
    #submitTextAreaAndFile{
    	background-color:#607080;
    	border-color:#607080;
    }
    #submitTextAreaAndFile:hover{
    	background-color:#7c90a4;
    	border-color:#7c90a4;
    }
    #multiple-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
	}
	#multiple-container img{
		width:90px; height:90px;
	}
	#multiple-container img:hover{
		cursor:pointer;
	}
	#exampleFormControlTextarea1{
		border:none;
	}
	.attached_imgs{
		display: grid;
    	grid-template-columns: 1fr 1fr 1fr 1fr;
	}
	.attached_imgs img{
		max-width:150px;
		height: 150px;
	}
	#like-icon img{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	/* var index = 0;
	var sel_files = [];
	function setThumbnail(event) {
		sel_files = [];
		var files = event.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			sel_files.push(f);
		});
	    for (var image of event.target.files) {
	        var reader = new FileReader();
	        reader.onload = function(event) {
	            var img = document.createElement("img");
	            img.setAttribute("src", event.target.result);
	            document.querySelector("div#multiple-container").appendChild(img);
	            img.setAttribute("id", "img_id_"+index);
	            img.setAttribute("onclick", "deleteImageAction("+index+")");
	            img.setAttribute("data-bs-toggle", "tooltip");
	            img.setAttribute("data-bs-placement", "top");
	            img.setAttribute("title", "삭제하시려면 클릭하세요");
	            index++;
	        };
	        console.log(image);
	        reader.readAsDataURL(image);
	    }
	    
	}
	function deleteImageAction(index){
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_"+index;
		$(img_id).remove();
	}
	 */
	
   $(function(){
    	$('#submitTextAreaAndFile').click(function(){
    		//fileCheck();
    		$('form[name=PostingFeedForm]').submit();
    		
    		
    		
    		/* alert('이 버튼이 눌리긴 함');
    		var form=$('form[name=PostingFeedForm]')[0];
    		var formData = new FormData(form);
    		$.ajax({
    			url:"<c:url value='/board/writeFeedPosting'/>",
    			type:"post",
    			data:formData,
    			success: function (data){
    				alert(data)
    			},
    			error:function(data){
    				
    			},
    			cache: false,
    			contentType: false,
    			processData: false
    		}); */
    	});
    	$('.postlist li div#likeBtn').each(function(idx, item){
    		$(item).children('a').click(function(){
    			if($(item).children('a').children('img').attr("class")=="like"){
					$(item).children('a').children('img').attr("src", "<c:url value='/resources/images/board/unlike.svg'/>");
					$(item).children('a').children('img').attr("class", "unlike");
					$.ajax({
						url:'<c:url value="/board/deleteLike"/>'
						,type:"get"
						,data:"empNo="+$(item).children('input[name=empNo]').val()+"&postingNo="+$(item).children('input[name=postingNo]').val()
						,dataType:"json"
						,success:function(res){
							$('#likes').html(res);
						}
					});
				}else if($(item).children('a').children('img').attr("class")=="unlike"){
					$(item).children('a').children('img').attr("src", "<c:url value='/resources/images/board/like.svg'/>");
					$(item).children('a').children('img').attr("class", "like");
					$.ajax({
						url:'<c:url value="/board/addLike"/>'
						,type:"get"
						,data:"empNo="+$(item).children('input[name=empNo]').val()+"&postingNo="+$(item).children('input[name=postingNo]').val()
						,dataType:"json"
						,success:function(res){
							$('#likes').html(res);
						}
					});
				}
    		});
    	})
    	/* $('#like-icon').click(function(){
			
		}); */
    	
    	
    }); 
	 function fileCheck() {
			//input file 태그.
			var file = document.getElementById('fileBtn');
			//파일 경로.
			var filePath = file.value;
			//전체경로를 \ 나눔.
			var filePathSplit = filePath.split('\\'); 
			//전체경로를 \로 나눈 길이.
			var filePathLength = filePathSplit.length;
			//마지막 경로를 .으로 나눔.
			var fileNameSplit = filePathSplit[filePathLength-1].split('.');
			//파일명 : .으로 나눈 앞부분
			var fileName = fileNameSplit[0];
			//파일 확장자 : .으로 나눈 뒷부분
			var fileExt = fileNameSplit[1];
			//파일 크기
			var fileSize = file.files[0].size;
			
			console.log('파일 경로 : ' + filePath);
			console.log('파일명 : ' + fileName);
			console.log('파일 확장자 : ' + fileExt);
			console.log('파일 크기 : ' + fileSize);
		}
	 var fileArr;
	 var fileInfoArr=[];

	 //썸네일 클릭시 삭제.
	 function fileRemove(index) {
	     console.log("index: "+index);
	     fileInfoArr.splice(index,1);
	  
	     var imgId="#img_id_"+index;
	     $(imgId).remove();
	     console.log(fileInfoArr);
	 }

	 function previewImage(targetObj, View_area) {
		    var files=targetObj.files;
		    fileArr=Array.prototype.slice.call(files);
		    
		    var preview = document.getElementById(View_area); //div id
		    var ua = window.navigator.userAgent;
		 
		    if (ua.indexOf("MSIE") > -1) {
		        targetObj.select();
		        try {
		            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
		            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
		 
		 
		            if (ie_preview_error) {
		                preview.removeChild(ie_preview_error); //error가 있으면 delete
		            }
		 
		            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
		 
		            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
		            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		        } catch (e) {
		            if (!document.getElementById("ie_preview_error_" + View_area)) {
		                var info = document.createElement("<p>");
		                info.id = "ie_preview_error_" + View_area;
		                info.innerHTML = e.name;
		                preview.insertBefore(info, null);
		            }
		        }
		    } else {
		        var files = targetObj.files;
		        for ( var i = 0; i < files.length; i++) {
		            var file = files[i];
		            fileInfoArr.push(file);
		 
		            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
		            if (!file.type.match(imageType))
		                continue;

		            var span=document.createElement('span');
		            span.id="img_id_" +i;
		            span.style.width = '100px';
		            span.style.height = '100px';
		            preview.appendChild(span);
		 
		            var img = document.createElement("img");
		            img.className="addImg";
		            img.classList.add("obj");
		            img.file = file;
		            img.style.width='inherit';
		            img.style.height='inherit';
		            img.style.cursor='pointer';
		            const idx=i;
		            img.onclick=()=>fileRemove(idx);   //이미지를 클릭했을 때.
		            span.appendChild(img);
		 
		            if (window.FileReader) {
		                var reader = new FileReader();
		                reader.onloadend = (function(aImg) {
		                    return function(e) {
		                        aImg.src = e.target.result;
		                    };
		                })(img);
		                reader.readAsDataURL(file);
		            } else { // safari is not supported FileReader
		                //alert('not supported FileReader');
		                if (!document.getElementById("sfr_preview_error_"
		                    + View_area)) {
		                    var info = document.createElement("p");
		                    info.id = "sfr_preview_error_" + View_area;
		                    info.innerHTML = "not supported FileReader";
		                    preview.insertBefore(info, null);
		                }
		            }
		        }
		    }
		}
	 
</script>
	<section style="padding:0px">
		<!-- <div style="width:249px;height:64px;margin:0;padding:0;padding:24px 24px 16px;float:right">
			<span class="recent-header">최신글 모음</span>
		</div> -->
		<div style="width:auto;height:64px;margin:0;padding:0;padding:24px 24px 16px;margin-right:250px;float:left;">
			<h5>
				<a>${boardVo.boardName}<!-- parameter: 어느 게시판?  --></a>
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
	
<form action="<c:url value='/board/writeFeedPosting'/>" name="PostingFeedForm" method="post" enctype="multipart/form-data">
	<section style="padding:0px;max-width:1200px;min-width:650px">
		<input type="hidden" name="boardNo" value="${boardVo.boardNo }">
		<div style="padding:10px;padding-top:10px;margin:20px;margin-right:100px;border:1px solid #dfe3e7;border-radius:3px;min-width:50px;display:block">
			<div style="display:block">
				<textarea name="postingContent" class="form-control" id="exampleFormControlTextarea1" rows="3" style="min-width:50px;width:100%;font-size:0.8em" placeholder="새로운 정보, 기분 좋은 소식을 부서원들과 공유하세요."></textarea>
			</div>
			<div id="multiple-container" style="margin-top:10px">
				<span id='View_area' style='postition:relative; color: black; border: 0px solid black;'></span>
			</div>
			<div name="buttons" style="flex-flow:row-reverse;min-height:30px;margin-top:10px">
				<div style="float:right">
					<input type="button" id="submitTextAreaAndFile" class="btn btn-primary btn-sm" style="right:0px" value="이야기 하기">
				</div>
				<div style="padding-top:5px">
					<div id="fileBtnArea" style="float:right;margin-right:10px;border-radius:3px">
						<label for="fileBtn" ><span class="fa-fw select-all fas"></span></label>
						<input id="fileBtn" name="img_upload" type="file" style="position: absolute;width: 1px;height: 1px;padding: 0;margin: -1px;overflow: hidden;clip:rect(0,0,0,0);border: 0;display:block" accept="image/*" onchange="previewImage(this, 'View_area')" multiple>
					</div>
				</div>
			</div>
		</div>
		
	</section>
</form>	

	<div style="margin:0px;padding:20px;max-width:1200px;min-width:650px">
		<div style="padding:20px;margin:0px">
				<ul class="postlist" style="list-style:none;padding:0px;">
					<c:forEach var="vo" items="${postingList }">
					<li style="padding:16px 0px;border-top:1px solid #dfe3e7;">
					<div class="article_wrap" style="display:inline;align-content:stretch">
						
							<span class="avatar avatar-lg" style="display:inline;float:left" align="absmiddle"> <img alt="사원 사진"
								src="<c:url value='/resources/empImages/${vo.empImg }'/>" align="absmiddle">
							</span>
						
						<div name="restofVO" style="display:block;margin-left:60px;">
							<div name="empname">
								<a class="name" style="font-weight:bold;font-size:0.85em">${vo.empName } ${vo.posName }</a>
								<div id="likeBtn" style="display: inline-block; float: right; padding-right: 60px; margin-top: 20px">
									<input type="hidden" value="${loginEmpNo }" name="empNo">
									<input type="hidden" value="${vo.postingNo }" name="postingNo">
									<a id="like-icon"> 
									<img alt="" class='<c:if test="${vo.hasLiked eq '0' }">unlike</c:if><c:if test="${vo.hasLiked eq '1' }">like</c:if>' src="
									<c:if test="${vo.hasLiked=='0' }">
									<c:url value='/resources/images/board/unlike.svg'/>				
									</c:if>
									<c:if test="${vo.hasLiked=='1' }">
									<c:url value='/resources/images/board/like.svg'/>
									</c:if>
									" style="width: 20px; height: 20px">
									</a>
								</div>
							</div>
							<div name="regdate">
								<span class="date" style="font-size:0.8em"><fmt:formatDate value="${vo.postingRegdate }" pattern="MM-dd hh:mm"/></span>
								<c:if test="${!empty filesList }">
									<c:forEach var="ttt" items="${filesList }">
										<span>${ttt.pfFileName }</span>
									</c:forEach>
								</c:if>
							</div>
							<div name="content" style="min-height:100px;margin-top:20px;margin-bottom:20px">
								<div class="contents" name="contents" style="padding: 10px 20px 10px 20px">
								${vo.postingContent }
								</div>
								<c:if test="${!empty allFilesList }">
									
									
								
								<div class="attached-files/imgs">
									<div class="attached_files">
										
										<c:forEach var="attached_file" items="${allFilesList }">
											<c:if test="${attached_file.postingNo==vo.postingNo }">
											
											<c:set var="originalfilename" value="${attached_file.pfFileName }"/>
												<c:set var="lowerfilename" value="${fn:toLowerCase(originalfilename) }"/>
												<c:forTokens var="ext" items="${lowerfilename }" delims="." varStatus="status">
													<c:if test="${status.last }">
														<c:if test="${ext ne 'jpg'&&ext ne 'png'&&ext ne 'jpeg'&&ext ne 'jpe'&&ext ne 'jif'&&ext ne 'jfif'
														&&ext ne 'jfi'&&ext ne 'png'&&ext ne 'gif'&&ext ne 'webp'
														&&ext ne 'svg'&&ext ne 'svgz'&&ext ne 'eps'&&ext ne 'ai'&&ext ne 'tiff'&&ext ne 'tif'&&ext ne 'heif'&&ext ne 'heic'&&ext ne 'ind'&&ext ne 'indd'&&ext ne 'indt'
														&&ext ne 'psd'&&ext ne 'raw'&&ext ne 'arw'&&ext ne 'cr'&&ext ne 'rw2'&&ext ne 'nrw'&&ext ne 'k25'}">
														
														<a>${attached_file.pfFileName}</a>
														</c:if>
													</c:if>
												</c:forTokens>
											</c:if>
										</c:forEach>
										
									</div>
									<div class="attached_imgs">
									
									<c:forEach var="attached_img" items="${allFilesList }">
										<c:if test="${attached_img.postingNo==vo.postingNo }">
										<c:set var="originalfilename" value="${attached_img.pfFileName }"/>
											<c:set var="lowerfilename" value="${fn:toLowerCase(originalfilename) }"/>
											<c:forTokens var="ext" items="${lowerfilename }" delims="." varStatus="status">
												<c:if test="${status.last }">
													<c:if test="${ext eq 'jpg'||ext eq 'png'||ext eq 'jpeg'||ext eq 'jpe'||ext eq 'jif'||ext eq 'jfif'
													||ext eq 'jfi'||ext eq 'png'||ext eq 'gif'||ext eq 'webp'||ext eq 'svg'||ext eq 'svgz'
													||ext eq 'eps'||ext eq 'ai'||ext eq 'tiff'||ext eq 'tif'||ext eq 'heif'||ext eq 'heic'
													||ext eq 'ind'||ext eq 'indd'||ext eq 'indt'||ext eq 'psd'||ext eq 'raw'||ext eq 'arw'
													||ext eq 'cr'||ext eq 'rw2'||ext eq 'nrw'||ext eq 'k25'}">
													<a> <img alt="" src="<c:url value='/board_upload/posting_upload/${attached_img.pfFileName }'/>"> </a>
													</c:if>
												</c:if>
											</c:forTokens>
										</c:if>
									</c:forEach>
									<%-- <c:forEach var="attached" items="${filesList }">
									<span>${attached.pfFileName }</span>
									<a> <img alt="" src="<c:url value='/board_upload/posting_upload/${attached.pfFileName }'/>"> </a>
										<c:set var="originalfilename" value="${attached.pfFileName }"/>
											<c:set var="lowerfilename" value="${fn:toLowerCase(originalfilename) }"/>
											<c:forTokens var="ext" items="${lowerfilename }" delims="." varStatus="status">
												<c:if test="${status.last }">
													<c:if test="${ext eq 'png'||'jpeg'||'jpe'||'jif'||'jfif'||'jfi'||'png'||'gif'||'webp'
													||'svg'||'svgz'||'eps'||'ai'||'tiff'||'tif'||'heif'||'heic'||'ind'||'indd'||'indt'
													||'psd'||'raw'||'arw'||'cr'||'rw2'||'nrw'||'k25'}">
													
													<a> <img alt="" src="<c:url value='/board_upload/posting_upload/${attached.pfFileName }'/>"> </a>
													</c:if>
												</c:if>
											</c:forTokens>
									</c:forEach> --%>
									</div>
								</div>
								</c:if>
							</div>
							<div name="comments" style="margin-bottom:5px">
								<div name="comments-icons">
									<a><span class="fa-fw select-all fas"></span> 댓글 <span id="likes">${vo.postingLikes}</span> 개</a>&nbsp&nbsp&nbsp&nbsp<a><span class="fa-fw select-all fas"></span> 좋아요 누른 사람 0명</a>
								</div>
							</div>
							<div style="padding:20px 5px 20px 5px;border:1px solid #dfe3e7;border-radius:3px;display:block">
								
									<span class="avatar avatar-md" style="display:inline;float:left"> <img alt="사원 사진"
										src="<c:url value='/resources/empImages/${vo.empImg }'/>">
									</span>

								<div style="display:block;margin-left:40px;margin-right:80px;">
									<input type="text" class="form-control form-control-sm">
									<button class="btn btn-outline-primary btn-sm">댓글 작성</button>
								</div>
								<div>
									
								</div>
							</div>
						</div>
							
					</div>
						<!-- 원글 -->
							
							<!-- //원글 -->
							<!-- <div class="reply_header">
								<span class="ic_classic ic_reply"></span> <span class="txt_b">댓글<span
									class="num txt_b" id="commentCount"> 0</span> 개
								</span> <a class="txt_b btn_viewAll" style="display: none"> <span
									class="txt_b commentFold" data-comment="part"
									data-loading="false">모두 보기</span>
								</a> <span class="ic ic_feedPlus_s"></span> <span class="txt_ txt_b">
									좋아요 누른 사람 <a id="listPostRecommend" class="linkNum"> 1</a> 명
								</span>
							</div>
							<div class="reply_wrap" data-boardid="195" data-postid="1082"> -->
								<!-- 댓글 시작 -->
								<!-- <div class="reply_common" id="replyArea">
									<ul class="reply"></ul>
									<div class="reply_create">
										<span class="photo"><img
											src="/thumb/user/small/4302-21683"></span>
										<div class="msg_wrap">
											<div class="compo_reply_create">
												<p class="form_wrap " style="">
													<span class="textarea_edit"> <textarea type="text"
															class="edit w_max"></textarea>
													</span>
												</p>
												<span class="btn_fn7 posi1" id="uploadBtn" style="">
													<span class="ic_con ic_file_up_s" id="fileControl"></span>
												</span> <span class="btn_minor_s" id="create" style=""> <span
													class="txt">댓글 작성</span>
												</span>
											</div>
											<div id="progressArea" style="display: none;">
												<span id="progressBarWriteWrapview1893"
													style="margin: 0px; display: inline-block; vertical-align: top; position: relative; padding: 10px 17px 0 0; line-height: 110%"></span>
											</div>
											<div class="" id="commentAttachPart" style="display: none">
												<ul class="file_wrap">
												</ul>
												<ul class="img_wrap">
												</ul>
											</div>
										</div>
										<div class="action_wrap" style="display: none">
											<span class="btn_fn4"><span
												class="ic_feed ic_edit_white"></span></span> <span class="btn_fn4"><span
												class="ic_feed ic_del_white"></span></span>
										</div>
									</div>
								</div>
							</div> -->
							<!-- //댓글 -->
						<!-- </div>  -->
						<!-- <div style="margin:0px;">
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
						</div> -->
					</li>
					</c:forEach>
				</ul>
		</div>	
	</div>