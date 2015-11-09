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

//video����
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
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 250, // �����̵� �ʺ�
			minSlides : 5, // �ּ� ���� ����
			maxSlides : 5, // �ִ� ���� ����
			slideMargin : 30, // �����̵尣�� ����
			auto : false, // �ڵ� ���� ����
			autoHover : true, // ���콺 ȣ���� ���� ����
			captions : true, // �̹����� title �Ӽ��� ����ȴ�.
			controls : false
		// ���� ���� ��ư ���� ����
		});

		$('#prevBtn').on('click', function() {
			mySlider.goToPrevSlide(); //���� �����̵� ��ʷ� �̵�
			return false; //<a>�� ��ũ ����
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
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 250, // �����̵� �ʺ�
			minSlides : 5, // �ּ� ���� ����
			maxSlides : 5, // �ִ� ���� ����
			slideMargin : 30, // �����̵尣�� ����
			auto : false, // �ڵ� ���� ����
			autoHover : true, // ���콺 ȣ���� ���� ����
			captions : true, // �̹����� title �Ӽ��� ����ȴ�.
			controls : false
		// ���� ���� ��ư ���� ����
		});

		$('#prevBtn1').on('click', function() {
			mySlider.goToPrevSlide(); //���� �����̵� ��ʷ� �̵�
			return false; //<a>�� ��ũ ����
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
			<h3 >�̴��� hot ����</h3>
			</div>
		<div>
		<video id="main_video"
				onended="end()" autoplay loop>
				<source src="ADs/${url}.mp4" type="video/mp4">
			</video><%-- autoplay --%>
		</div>
		<div id="home_subject">
		<h3>�ǽð� top ����</h3>	
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
								<li>�������� : ${d.adno }</li>
								<li>����ð� : ${d.adtime }</li>
								<li>����Ʈ : ${d.pointrange }</li>
							</ul>
						</div>
					</li>
 				</c:if>
			</c:forEach> 

		</ul>
		<p>
			<a href="#" id="prevBtn"> <img src="img/prev.jpg" alt="����">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn"> <img src="img/next.jpg" alt="����">
			</a>
		</p>
		</div>
		<div id="home_subject">
		<h3>�ֽ� ����</h3>	
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
								<li>�������� : ${d.adno }</li>
								<li>����ð� : ${d.adtime }</li>
								<li>����Ʈ : ${d.pointrange }</li>
							</ul>
						</div>
					</li>
 				</c:if>
			</c:forEach> 

		</ul>
		<p>
			<a href="#" id="prevBtn1"> <img src="img/prev.jpg" alt="����">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn1"> <img src="img/next.jpg" alt="����">
			</a>
		</p>
		</div>
	</div>
</body>
</html>