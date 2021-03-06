<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<c:url value='/resources/vendors/toastify/toastify.css'/>">
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
	#replySubmit{
		background-color:#607080;
    	border-color:#607080;
    	color:white;
	}
	#replaySubmit:hover{
		background-color:#7c90a4;
    	border-color:#7c90a4;
	}
	#fileDownload{
    	border-color:white;
		font-size:0.8em;
		color:#607080;
    }
    #fileDownload:hover{
    	background-color:#eeeeee;
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
	            img.setAttribute("title", "?????????????????? ???????????????");
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
	  /*  var c = document.getElementById("color"),
	    res = document.getElementById("result"),
	    
	    t = document.getElementById("time"),
	    res2 = document.getElementById("result2"); */

		/* c.addEventListener("input", function() {
	    res.innerHTML = c.value;
		}, false);  */
    	$('#submitTextAreaAndFile').click(function(){
    		//fileCheck();
    		if($('textarea[name=postingContent]').val()==''){
    			Toastify({
			        text: "????????? ???????????????",
			        duration: 2000,
			        close:false,
			        gravity:"top",
			        position: "center",
			        backgroundColor: "black",
			    }).showToast();
				return false;
    		}
    		
    		$('form[name=PostingFeedForm]').submit();
    		
    		
    		
    		/* alert('??? ????????? ????????? ???');
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
    	$('.postlist li').each(function(idx, item){
    		$(item).find('#like-icon').click(function(){
    			if($(item).find('#like-icon').children('img').attr("class")=="like"){
					$(item).find('#like-icon').children('img').attr("src", "<c:url value='/resources/images/board/unlike.svg'/>");
					$(item).find('#like-icon').children('img').attr("class", "unlike");
					$.ajax({
						url:'<c:url value="/board/deleteLike"/>'
						,type:"get"
						,data:"empNo="+$(item).find('#likeBtn').children('input[name=empNo]').val()+"&postingNo="+$(item).find('#likeBtn').children('input[name=postingNo]').val()
						,dataType:"json"
						,success:function(res){
							//$(item).parent().next().next().next().find('#totalReplyCount').text(res);
							$(item).find('#likes').html(res);
						}
					});
				}else if($(item).find('#like-icon').children('img').attr("class")=="unlike"){
					$(item).find('#like-icon').children('img').attr("src", "<c:url value='/resources/images/board/like.svg'/>");
					$(item).find('#like-icon').children('img').attr("class", "like");
					$.ajax({
						url:'<c:url value="/board/addLike"/>'
						,type:"get"
						,data:"empNo="+$(item).find('#likeBtn').children('input[name=empNo]').val()+"&postingNo="+$(item).find('#likeBtn').children('input[name=postingNo]').val()
						,dataType:"json"
						,success:function(res){
							//$(item).parent().next().next().next().find('#totalReplyCount').text(res);
							$(item).find('#likes').html(res);
						}
					});
				}
    		});
    	});
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	$('#listing div#restofVO').each(function(idx, item){
    		$(item).find('input[name=replyText]').keydown(function() {
    			if (event.keyCode === 13) {
  				    event.preventDefault();
  				    
  				  if($('input[name=replyText]').val()==''){
  					  
  				  }
  			  }
    		});
    	});
    	
    	
    	
    	/* $('input[name=replyText]').each(function(idx, item){
    		$(item).keydown(function(){
   				if(event.keyCpode === 13) {
	    			if($(item).val()==''){
	    				event.preventDefault();
	    			}
    			}
    		});
    	}); */
    	
    	
    	
    	
    	/* $('input[name=replyText]').keydown(function() {
			  if (event.keyCode === 13) {
				  if($('input[name=replyText]').val()==''){
				    event.preventDefault();
					  
				  }
			  };
			}); */
		
    	$('#listing div#restofVO').each(function(idx, item){
    		$(item).find('#replySubmit').click(function(){
    			
    			if($(item).find('input[name=replyText]').val()==''){
    				return false;
    			}
    			
    			var queryString = $(item).find('form[name=replyForm]').serialize();
    			$.ajax({
    				url: '<c:url value="/board/addComments"/>'
    				,type: "post"
    				,data: queryString
    				,dataType: 'json'
    				,success: function(res){
    					if(res != null){
    						var htmlStr = "";
    						
    						htmlStr += "<div style='display: inline; align-content: stretch'>";
    						htmlStr += "<span class='avatar avatar-md' style='display: inline; float: left; position: absolute; margin-top: 6px'>";
    						htmlStr += "<img alt='?????? ??????' src='<c:url value='/resources/empImages/"+res.empImg+"'/>'>";
    						htmlStr += "</span>";
    						htmlStr += "<div class='input-group input-group-sm' style='padding-left: 40px; display: block;'>";
    						htmlStr += "<div>";
    						htmlStr += "<a style='font-weight: bold'>"+res.empName+"</a>&nbsp&nbsp<span style='font-size:0.8em'>";
    						htmlStr += res.brandnewdate+"</span>";
    						htmlStr += "</div>";
    						htmlStr += "<div>";
    						htmlStr += "<span style='font-size: 0.8em'>"+res.replyText+"</span>";
    						htmlStr += "</div>";
    						htmlStr += "</div>";
    						htmlStr += "</div>";
    						
    						$(item).find('#replyList').append(htmlStr);
    						$(item).find('input[name=replyText]').val('');
    						$(item).find('#totalReplyCount').html(res.initTotalCount);
    						
    					}
    				},error: function(xhr, status, error){
    					alert(error);
    				}
    			});
    		})
    	});
    	
    }); 
	 function fileCheck() {
			//input file ??????.
			var file = document.getElementById('fileBtn');
			//?????? ??????.
			var filePath = file.value;
			//??????????????? \ ??????.
			var filePathSplit = filePath.split('\\'); 
			//??????????????? \??? ?????? ??????.
			var filePathLength = filePathSplit.length;
			//????????? ????????? .?????? ??????.
			var fileNameSplit = filePathSplit[filePathLength-1].split('.');
			//????????? : .?????? ?????? ?????????
			var fileName = fileNameSplit[0];
			//?????? ????????? : .?????? ?????? ?????????
			var fileExt = fileNameSplit[1];
			//?????? ??????
			var fileSize = file.files[0].size;
			
			console.log('?????? ?????? : ' + filePath);
			console.log('????????? : ' + fileName);
			console.log('?????? ????????? : ' + fileExt);
			console.log('?????? ?????? : ' + fileSize);
		}
	 var fileArr;
	 var fileInfoArr=[];

	 //????????? ????????? ??????.
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
		            var src = document.selection.createRange().text; // get file full path(IE9, IE10?????? ?????? ??????)
		            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
		 
		 
		            if (ie_preview_error) {
		                preview.removeChild(ie_preview_error); //error??? ????????? delete
		            }
		 
		            var img = document.getElementById(View_area); //???????????? ????????? ???
		 
		            //????????? ??????, sizingMethod??? div??? ????????? ???????????? ???????????? ?????? ??????
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
		 
		            var imageType = /image.*/; //????????? ??????????????????.. ????????????.
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
		            img.onclick=()=>fileRemove(idx);   //???????????? ???????????? ???.
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
	 
	 function makeCommentsList(res){
			var htmlStr = "";
			var regdate = res.replyRegdate;
			
			htmlStr += "<div style='display: inline; align-content: stretch'>";
			htmlStr += "<span class='avatar avatar-md' style='display: inline; float: left; position: absolute; margin-top: 6px'>";
			htmlStr += "<img alt='?????? ??????' src='<c:url value='/resources/empImages/"+res.empImg+"'/>'>";
			htmlStr += "</span>";
			htmlStr += "<div class='input-group input-group-sm' style='padding-left: 40px; display: block;'>";
			htmlStr += "<div>";
			htmlStr += "<a style='font-weight: bold'>"+res.empName+"</a>&nbsp&nbsp<span style='font-size:0.8em'>";
			htmlStr += res.brandnewdate+"</span>";
			htmlStr += "</div>";
			htmlStr += "<div>";
			htmlStr += "<span style='font-size: 0.8em'>"+res.replyText+"</span>";
			htmlStr += "</div>";
			htmlStr += "</div>";
			htmlStr += "</div>";
			
			$('#replyList').append(htmlStr);
			$('input[name=replyText]').val('');
			$('#totalReplyCount').html(res.initTotalCount);
			
			
		}
	 
</script>
<section style="padding: 0px">
	<!-- <div style="width:249px;height:64px;margin:0;padding:0;padding:24px 24px 16px;float:right">
			<span class="recent-header">????????? ??????</span>
		</div> -->
	<div
		style="width: auto; height: 64px; margin: 0; padding: 0; padding: 24px 24px 16px; margin-right: 250px; float: left;">
		<h5>
			<p id="result"></p>
			<a>${boardVo.boardName}<!-- parameter: ?????? ??????????  --></a>
		</h5>
	</div>

</section>

<section style="padding: 0px">
	<div
		style="padding: 5px; padding-top: 10px; margin: 20px; border: 1px solid #dfe3e7; border-radius: 3px; background-color: #f9f9f9">
		<ul style="font-size: 0.8em; list-style: none">
			<li><c:if test="${!empty adminList }">
					<span>?????????: <c:forEach var="admin" items="${adminList }">
							${admin } 
						</c:forEach>
					</span>
				</c:if></li>
			<li><span>${boardVo.boardDescription }</span></li>
		</ul>
	</div>
</section>

<form action="<c:url value='/board/writeFeedPosting'/>"
	name="PostingFeedForm" method="post" enctype="multipart/form-data">
	<section style="padding: 0px; max-width: 1200px; min-width: 650px">
		<input type="hidden" name="boardNo" value="${boardVo.boardNo }">
		<div
			style="padding: 10px; padding-top: 10px; margin: 20px; margin-right: 100px; border: 1px solid #dfe3e7; border-radius: 3px; min-width: 50px; display: block">
			<div style="display: block">
				<textarea name="postingContent" class="form-control"
					id="exampleFormControlTextarea1" rows="3"
					style="min-width: 50px; width: 100%; font-size: 0.8em"
					placeholder="????????? ??????, ?????? ?????? ????????? ??????????????? ???????????????."></textarea>
			</div>
			<div id="multiple-container" style="margin-top: 10px">
				<span id='View_area'
					style='postition: relative; color: black; border: 0px solid black;'></span>
			</div>
			<div name="buttons"
				style="flex-flow: row-reverse; min-height: 30px; margin-top: 10px">
				<div style="float: right">
					<input type="button" id="submitTextAreaAndFile"
						class="btn btn-primary btn-sm" style="right: 0px" value="????????? ??????">
				</div>
				<div style="padding-top: 5px">
					<div id="fileBtnArea"
						style="float: right; margin-right: 10px; border-radius: 3px">
						<label for="fileBtn"><span class="fa-fw select-all fas">???</span></label>
						<input id="fileBtn" name="img_upload" type="file"
							style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0; display: block"
							accept="image/*" onchange="previewImage(this, 'View_area')"
							multiple>
					</div>
				</div>
			</div>
		</div>

	</section>
</form>

<div
	style="margin: 0px; padding: 20px; max-width: 1200px; min-width: 650px">
	<div style="padding: 20px; margin: 0px">
		<ul class="postlist" style="list-style: none; padding: 0px;">
			<c:forEach var="vo" items="${postingList }">
				<li id="listing" style="padding: 16px 0px; border-top: 1px solid #dfe3e7;">
					<div class="article_wrap"
						style="display: inline; align-content: stretch">

						<span class="avatar avatar-lg"
							style="display: inline; float: left" align="absmiddle"><img
							alt="?????? ??????"
							src="<c:url value='/resources/empImages/${vo.empImg }'/>"
							align="absmiddle">
						</span>

						<div id="restofVO" style="display: block; margin-left: 60px;">
							<div name="empname">
								<a class="name" style="font-weight: bold; font-size: 0.85em">${vo.empName }
									${vo.posName }</a>
								<div id="likeBtn"
									style="display: inline-block; float: right; padding-right: 60px; margin-top: 20px">
									<input type="hidden" value="${loginEmpNo }" name="empNo">
									<input type="hidden" value="${vo.postingNo }" name="postingNo">
									<a id="like-icon"> <img alt=""
										class='<c:if test="${vo.hasLiked eq '0' }">unlike</c:if><c:if test="${vo.hasLiked eq '1' }">like</c:if>'
										src="
									<c:if test="${vo.hasLiked=='0' }">
									<c:url value='/resources/images/board/unlike.svg'/>				
									</c:if>
									<c:if test="${vo.hasLiked=='1' }">
									<c:url value='/resources/images/board/like.svg'/>
									</c:if>
									"
										style="width: 20px; height: 20px">
									</a>
								</div>
							</div>
							<div name="regdate">
								<span class="date" style="font-size: 0.8em"><fmt:formatDate
										value="${vo.postingRegdate }" pattern="MM-dd hh:mm" /></span>
								<c:if test="${!empty filesList }">
									<c:forEach var="ttt" items="${filesList }">
										<span>${ttt.pfFileName }</span>
									</c:forEach>
								</c:if>
							</div>
							<div name="content"
								style="min-height: 100px; margin-top: 20px; margin-bottom: 20px">
								<div class="contents" name="contents"
									style="padding: 10px 20px 10px 20px">${vo.postingContent }
								</div>
								<c:if test="${!empty allFilesList }">

									<div class="attached-files/imgs">
										<div class="attached_files">

											<c:forEach var="attached_file" items="${allFilesList }">
												<c:if test="${attached_file.postingNo==vo.postingNo }">

													<c:set var="originalfilename"
														value="${attached_file.pfFileName }" />
													<c:set var="lowerfilename"
														value="${fn:toLowerCase(originalfilename) }" />
													<c:forTokens var="ext" items="${lowerfilename }" delims="."
														varStatus="status">
														<c:if test="${status.last }">
															<c:if
																test="${ext ne 'jpg'&&ext ne 'png'&&ext ne 'jpeg'&&ext ne 'jpe'&&ext ne 'jif'&&ext ne 'jfif'
														&&ext ne 'jfi'&&ext ne 'png'&&ext ne 'gif'&&ext ne 'webp'
														&&ext ne 'svg'&&ext ne 'svgz'&&ext ne 'eps'&&ext ne 'ai'&&ext ne 'tiff'&&ext ne 'tif'&&ext ne 'heif'&&ext ne 'heic'&&ext ne 'ind'&&ext ne 'indd'&&ext ne 'indt'
														&&ext ne 'psd'&&ext ne 'raw'&&ext ne 'arw'&&ext ne 'cr'&&ext ne 'rw2'&&ext ne 'nrw'&&ext ne 'k25'}">
																<form action="<c:url value='/board/download'/>">
																	<input type="hidden" value="${attached_file.pfFileName }" name="pfFileName"> 
																	<input type="hidden" value="${attached_file.pfOFileName }" name="pfOFileName">
																	<div>
																		<span class="fa-fw select-all fas" style="font-size: 0.8em">???</span>
																		<input type="submit" id="fileDownload" class="btn btn-outline-primary" value="${attached_file.pfOFileName } (${attached_file.pfFileSize })">
																	</div>
																</form>
															</c:if>
														</c:if>
													</c:forTokens>
												</c:if>
											</c:forEach>

										</div>
										<div class="attached_imgs">

											<c:forEach var="attached_img" items="${allFilesList }">
												<c:if test="${attached_img.postingNo==vo.postingNo }">
													<c:set var="originalfilename"
														value="${attached_img.pfFileName }" />
													<c:set var="lowerfilename"
														value="${fn:toLowerCase(originalfilename) }" />
													<c:forTokens var="ext" items="${lowerfilename }" delims="."
														varStatus="status">
														<c:if test="${status.last }">
															<c:if
																test="${ext eq 'jpg'||ext eq 'png'||ext eq 'jpeg'||ext eq 'jpe'||ext eq 'jif'||ext eq 'jfif'
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
											
										</div>
									</div>
								</c:if>
							</div>
							<div id="divForicons"style="margin-bottom: 5px">
								<div name="comments-icons"
									style="border-bottom: 1px solid #dfe3e7;">
									<a><span class="fa-fw select-all fas">???</span> ?????? <span
										id="totalReplyCount">${vo.replyCount }</span> ???</a>&nbsp&nbsp&nbsp&nbsp<a><span
										class="fa-fw select-all fas">???</span> ????????? ?????? ?????? <span
										id="likes">${vo.postingLikes }</span>???</a>
								</div>
							</div>
							
							<div id="replyList" style="margin-top: 10px; padding-left: 5px">

								<c:if test="${!empty replyList }">
								<c:forEach items='${replyList}' var='thisiscomment'>
									<c:if test="${thisiscomment.postingNo==vo.postingNo }">
										<div style="display: inline; align-content: stretch">
											<span class="avatar avatar-md"
												style="display: inline; float: left; position: absolute; margin-top: 6px">
												<img alt="?????? ??????" src="<c:url value='/resources/empImages/${thisiscomment.empImg }'/>">
											</span>
											<div class="input-group input-group-sm"
												style="padding-left: 40px; display: block;">
												<div>
													<a style="font-weight: bold">${thisiscomment.empName }</a>&nbsp&nbsp<span
														style="font-size: 0.8em"><fmt:formatDate
															value='${thisiscomment.replyRegdate}'
															pattern="yyyy-MM-dd (E) hh:mm" /> </span>
												</div>
												<div>
													<span style="font-size: 0.8em">${thisiscomment.replyText}</span>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
								</c:if>
							</div>
							<form name="replyForm">
								<div style="padding: 20px 5px 20px 5px; align-content: stretch;">
									<span class="avatar avatar-md"
										style="display: inline; float: left; position: absolute;">
										<img alt="?????? ??????"
										src="<c:url value='/resources/empImages/${vo.empImg }'/>">
									</span>
									<div class="input-group input-group-sm"
										style="padding-left: 40px;">
										<input type="text" class="form-control form-control-sm"
											name="replyText">
										<input type="hidden" name="postingNo" value="${vo.postingNo }">
										<input type="hidden" name="empNo" value="${loginEmpNo }">
										<button type="button" class="btn btn-outline-primary btn-sm"
											id="replySubmit">?????? ??????</button>
									</div>
								</div>
							</form>
						</div>

					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<script src="<c:url value='/resources/vendors/toastify/toastify.js'/>"></script>
<script type="text/javascript">
	
</script>