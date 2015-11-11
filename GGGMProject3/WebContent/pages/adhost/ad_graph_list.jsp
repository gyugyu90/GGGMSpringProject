<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<title>ad_list</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<script>

var winObject = null;
function popupWindow(){
var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=200,width=200,left=0,top=0';
winObject = window.open("ad_index.jsp", "ad_index", settings);
}
function submitToWindow(){
winObject.document.all.text2.value = document.all.text1.value;
}
	$(function() {
		var mySlider = $('#slide_banner').bxSlider({
			mode : 'horizontal',// 가로 방향 수평 슬라이드
			speed : 500, // 이동 속도를 설정
			pager : false, // 현재 위치 페이징 표시 여부 설정
			moveSlides : 1, // 슬라이드 이동시 개수
			slideWidth : 700, // 슬라이드 너비
			minSlides : 1, // 최소 노출 개수
			maxSlides : 1, // 최대 노출 개수
			slideMargin : 30, // 슬라이드간의 간격
			auto : false, // 자동 실행 여부
			autoHover : true, // 마우스 호버시 정지 여부
			captions : true, // 이미지의 title 속성이 노출된다.
			controls : false
		// 이전 다음 버튼 노출 여부
		});

	
		
		$('#prevBtn').on('click', function() {
			mySlider.goToPrevSlide(); //이전 슬라이드 배너로 이동
			return false; //<a>에 링크 차단
		});
		
		$('#nextBtn').on('click', function() {
			mySlider.goToNextSlide();
			return false;
		});
	
/* 		$('a').click(function(){
			var adno=$(this).val();
		});
		$('#frm_'+adno).submit(); */
	});
	
function ok(adno){
	var form=document.getElementById('#frm_'+adno);
	form.submit();
}
</script>
<style>
#banner_wrap {
	padding-top: 0px;
	position: relative;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	vertical-align: middle;
	margin-top: 55px;
}

#prevBtn {
	position: absolute;
	left: 0;
	top: 45%;
}

#nextBtn {
	position: absolute;
	right: 0;
	top: 45%;
}

#banner_wrap #slide_banner .ad_top {
	width: 100%;
	height: 70%;
	padding: 0;
	margin: 0;
}

#banner_wrap #slide_banner .ad_bottom {
	width: 100%;
	height: 30%;
	padding: 0;
	margin: 0;
}

li {
	list-style: none;
	font-size: 10pt;
	padding: 0;
	margin: 0 auto;
	vertical-align: middle;
	text-align: left;
}

#banner_wrap .banner_margin {
	
}
</style>
</head>

<body>
<h2 style="margin:0px 200px"><img src="<%=request.getContextPath() %>/img/adicon.png" style="width:38px">&nbsp;&nbsp;우리 회사 광고</h2>
	<div id="banner_wrap">
		<ul id="slide_banner" class="banner_margin">

			<c:forEach var="d" items="${list }" varStatus="status">
					<li>
						<div class="ad_top">
							<a href="adgraph.do?adno=${d.adno}"> <img
								src="poster/ad${d.adno}.PNG" width="700" height="550"></a>
						</div>
					</li>
				
			</c:forEach>
		</ul>
		<p>
			<a href="#" id="prevBtn"> <img src="img/prev.png" alt="이전">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn"> <img src="img/next.png" alt="다음">
			</a>
		</p>
	</div>
</body>
</html>