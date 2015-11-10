<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   //request.setAttribute("no", no);
%>

<meta charset="utf-8">
<title>bxSlider</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/jquery.bxslider/jquery.bxslider.min.js"></script>
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
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 250, // �����̵� �ʺ�
			minSlides : 3, // �ּ� ���� ����
			maxSlides : 3, // �ִ� ���� ����
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
	$(function() {
		var mySlider = $('#slide_banner1').bxSlider({
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 250, // �����̵� �ʺ�
			minSlides : 3, // �ּ� ���� ����
			maxSlides : 3, // �ִ� ���� ����
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
	$(function() {
		var mySlider = $('#slide_banner2').bxSlider({
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 250, // �����̵� �ʺ�
			minSlides : 3, // �ּ� ���� ����
			maxSlides : 3, // �ִ� ���� ����
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
	padding-left: -10px;
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

#banner_top {
	padding-left: 100px;
}
.poster{
	width:270px;
	height:205px;
}
</style>
</head>

<body>
	<div id="banner_top" align="left">
	<h1><img src="img/hot.png"> HOT ����</h1>
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
								<li>����Ʈ : ${d.ppc }</li>
							</ul>
						</div>
					</li>
				</c:if>
			</c:forEach>

		</ul>
		<br>
		<ul id="slide_banner1" class="banner_margin">
			<c:forEach var="d" items="${count }">
				<c:if test="${d.adno%3==2 }">
					<li>
						<div class="ad_top">
							<a href="ad_index.do?adno=${d.adno }" target="_blank"> <img
								src="poster/ad${d.adno}.PNG" title="." alt="" class="poster"></a>
						</div>
						<div class="ad_bottom">
							<ul>
								<li>�������� : ${d.adno }</li>
								<li>����ð� : ${d.adtime }</li>
								<li>����Ʈ : ${d.ppc }</li>
							</ul>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<ul id="slide_banner2" class="banner_margin">
			<c:forEach var="d" items="${count }">
				<c:if test="${d.adno%3==1 }">
					<li>
						<div class="ad_top">
							<a href="ad_index.do?adno=${d.adno }" target="_blank"> <img
								src="poster/ad${d.adno}.PNG" title="." alt="" class="poster"></a>
						</div>
						<div class="ad_bottom">
							<ul>
								<li>�������� : ${d.adno }</li>
								<li>����ð� : ${d.adtime }</li>
								<li>����Ʈ : ${d.ppc }</li>
							</ul>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>


		<p>
			<a href="#" id="prevBtn"> <img src="img/prev.png" alt="����">
			</a>
		</p>
		<p>
			<a href="#" id="nextBtn"> <img src="img/next.png" alt="����">
			</a>
		</p>

	</div>
</body>
</html>