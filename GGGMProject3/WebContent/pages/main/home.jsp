<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*, dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/home.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/jquery.bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript">

//video관련
var myVideo=$("#main_video"); 
var playbutton=$("#play");
function playPause() { 
    if ($("#main_video").get(0).paused){
    	$("#main_video").get(0).play();
    	$("#play").get(0).textContent="||";
    }
    else{
    	$("#main_video").get(0).pause();
    	$("#play").get(0).textContent=">";
    } 
</script>
<script>
	$(function() {
		var mySlider = $('#slide_banner').bxSlider({
			mode : 'horizontal',// 가로 방향 수평 슬라이드
			speed : 500, // 이동 속도를 설정
			pager : false, // 현재 위치 페이징 표시 여부 설정
			moveSlides : 1, // 슬라이드 이동시 개수
			slideWidth : 250, // 슬라이드 너비
			minSlides : 5, // 최소 노출 개수
			maxSlides : 5, // 최대 노출 개수
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
	});
</script>
<script>
	$(function() {
		var mySlider = $('#slide_banner1').bxSlider({
			mode : 'horizontal',// 가로 방향 수평 슬라이드
			speed : 500, // 이동 속도를 설정
			pager : false, // 현재 위치 페이징 표시 여부 설정
			moveSlides : 1, // 슬라이드 이동시 개수
			slideWidth : 250, // 슬라이드 너비
			minSlides : 5, // 최소 노출 개수
			maxSlides : 5, // 최대 노출 개수
			slideMargin : 30, // 슬라이드간의 간격
			auto : false, // 자동 실행 여부
			autoHover : true, // 마우스 호버시 정지 여부
			captions : true, // 이미지의 title 속성이 노출된다.
			controls : false
		// 이전 다음 버튼 노출 여부
		});

		$('#prevBtn1').on('click', function() {
			mySlider.goToPrevSlide(); //이전 슬라이드 배너로 이동
			return false; //<a>에 링크 차단
		});

		$('#nextBtn1').on('click', function() {
			mySlider.goToNextSlide();
			return false;
		});
	});
</script>
<style type="text/css">

</style>
</head>
<body id="body">
	<div id="body">
		<div id="body_content">
			<div id="home_subject">
			<h3 >이달의 hot 광고</h3>
			</div>
		<div>
		<video id="main_video"
				onended="end()" autoplay loop>
				<source src="ADs/${url}.mp4" type="video/mp4">
			</video><%-- autoplay --%>
		</div>
		<div id="home_subject">
		<h3>실시간 top 광고</h3>	
		</div>
			<div id="banner_wrap">
		<ul id="slide_banner" class="banner_margin">

		 	<c:forEach var="d" items="${count }" varStatus="status">
				<c:if test="${d.adno%3==0 }"> 
					<li>

						<div class="ad_top">
							<a href="ad_index.do?adno=${d.adno}"> <img
								src="poster/ad${d.adno}.PNG" title="" alt="" class="poster"></a>
							<form id="frm_${d.adno}" action="Ad_index.do" method="get">
								<input type="hidden" name="adno" value="${d.adno}">
							</form>
						</div>
						<div class="ad_bottom" >
							<ul>
								<li>영상제목 : ${d.adno }</li>
								<li>영상시간 : ${d.adtime }</li>
								<li>포인트 : ${d.pointrange }</li>
							</ul>
						</div>
					</li>
 				</c:if>
			</c:forEach> 

		</ul>
		<p>
			<a href="#" id="prevBtn"> <img src="img/prev.jpg" alt="이전">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn"> <img src="img/next.jpg" alt="다음">
			</a>
		</p>
		</div>
		<div id="home_subject">
		<h3>최신 광고</h3>	
		</div>
		<div id="banner_wrap">
		<ul id="slide_banner1" class="banner_margin">

		 	<c:forEach var="d" items="${count }" varStatus="status">
				<c:if test="${d.adno%3==0 }"> 
					<li>

						<div class="ad_top">
							<a href="ad_index.do?adno=${d.adno}"> <img
								src="poster/ad${d.adno}.PNG" title="" alt="" class="poster"></a>
							<form id="frm_${d.adno}" action="Ad_index.do" method="get">
								<input type="hidden" name="adno" value="${d.adno}">
							</form>
						</div>
						<div class="ad_bottom" >
							<ul>
								<li>영상제목 : ${d.adno }</li>
								<li>영상시간 : ${d.adtime }</li>
								<li>포인트 : ${d.pointrange }</li>
							</ul>
						</div>
					</li>
 				</c:if>
			</c:forEach> 

		</ul>
		<p>
			<a href="#" id="prevBtn1"> <img src="img/prev.jpg" alt="이전">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn1"> <img src="img/next.jpg" alt="다음">
			</a>
		</p>
		</div>
	</div>
</body>
</html>