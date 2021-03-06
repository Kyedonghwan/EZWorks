<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 필요한 CSS, JS 로드 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<% String ctxPath = request.getContextPath(); %>

<script type="text/javascript" src="<%= ctxPath%>/resources/js/Hangul.js"></script>
<script type="text/javascript">

$(function() { //화면 다 뜨면 시작
	//DB쿼리 조작 없이 초성 검색을 하기 위해서는 우선 DB에 있는 항목들을 다 가지고 와야한다.
	//즉 너무 많은 수가 있으면 클라이언트 측이 느려질 수 있다는 점.
	//하지만 DB쿼리를 조작해서 서버에서 초성검색을 하는 방식에 비해 서버에는 무리가 없다.
	// ajax로 미리 검색어 목록을 다 가지고 온다.
	$.ajax({
		type : 'get',
		url : "/json",
		dataType : "json",
		//request.term = $("#autocomplete").val()
		//data: {"param":"param"},
		success : function(data) {
			//현재 data 상태
			//data = ["김치 볶음밥","신라면","진라면","라볶이","팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"];
			
			//이부분이 초성 검색이 가능하게 만들어 주는 부분
			let source = $.map(data, function(item) { //json[i] 번째 에 있는게 item 임.
				chosung = "";
				//Hangul.d(item, true) 을 하게 되면 item이 분해가 되어서 
				//["ㄱ", "ㅣ", "ㅁ"],["ㅊ", "ㅣ"],[" "],["ㅂ", "ㅗ", "ㄲ"],["ㅇ", "ㅡ", "ㅁ"],["ㅂ", "ㅏ", "ㅂ"]
				//으로 나오는데 이중 0번째 인덱스만 가지고 오면 초성이다.
				
				full = Hangul.disassemble(item).join("").replace(/ /gi, "") ;	//공백제거된 ㄱㅣㅁㅊㅣㅂㅗㄲㅇㅡㅁㅂㅏㅂ
				
				Hangul.d(item, true).forEach(function(strItem, index) {
					
					if(strItem[0] != " "){	//띄어 쓰기가 아니면
						chosung += strItem[0];//초성 추가
						
					}
				});
				
				
				return {
					label : chosung + "|" + (item).replace(/ /gi, "") +"|" + full, //실제 검색어랑 비교 대상 ㄱㅊㅂㅇㅂ|김치볶음밥|ㄱㅣㅁㅊㅣㅂㅗㄲㅇㅡㅁㅂㅏㅂ 이 저장된다.
					value : item, //김치 볶음밥
					chosung : chosung,	//ㄱㅊㅂㅇㅂ,
					full : full
				}
			});
			
			
			$("#searchInput").autocomplete({
				source : source,	// source 는 자동 완성 대상
				select : function(event, ui) {	//아이템 선택시
					console.log(ui.item.label + " 선택 완료");	
					
				},
				focus : function(event, ui) {	//포커스 가면
					return false;//한글 에러 잡기용도로 사용됨
				},
//					search : function( value, event ) {
//// 						value.delegateTarget.value
//// 						input = value.delegateTarget.value;
					
//						//$( "#searchInput" ).autocomplete( "search", Hangul.disassemble(input).join("").replace(/ /gi, "") );
//// 		 				return Hangul.disassemble(input).join("").replace(/ /gi, "");
//					}
				
			}).autocomplete( "instance" )._renderItem = function( ul, item ) {	
			//.autocomplete( "instance" )._renderItem 설절 부분이 핵심
		      return $( "<li>" )	//기본 tag가 li로 되어 있음 
		        .append( "<div>" + item.value + "</div>" )	//여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
		        .appendTo( ul );	//웹 상으로 보이는 건 정상적인 "김치 볶음밥" 인데 내부에서는 ㄱㅊㅂㅇㅂ,김치 볶음밥 에서 검색을 함.
		    };
		},
		
	});


	//여기가 한글 초중종성 검색 방법
	$("#searchInput").on("keyup",function(){	//검색창에 뭔가가 입력될 때마다
		input = $("#searchInput").val();	//입력된 값 저장
		$( "#searchInput" ).autocomplete( "search", Hangul.disassemble(input).join("").replace(/ /gi, "") );	//자모 분리후 띄어쓰기 삭제
	})
});
</script>

<body>

<!-- body 부분 -->
<input id="searchInput">
</body>
</html>