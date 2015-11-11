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
			speed : 1000, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 700, // �����̵� �ʺ�
			minSlides : 1, // �ּ� ���� ����
			maxSlides : 1, // �ִ� ���� ����
			slideMargin : 30, // �����̵尣�� ����
			auto : true, // �ڵ� ���� ����
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

function ok(adno){
	var form=document.getElementById('#frm_'+adno);
	form.submit();
}
</script>
<style>
#banner_wrap {
	padding-top: 50px;
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
	width:700px;
	height:550px;
}
</style>
</head>

<body>
	<div id="banner_top" align="left">
	<h1 align="left"><img src="img/local.jpg" width="60px" height="60px"> ���� ����</h1>
	</div>
	<div id="banner_wrap">
		<ul id="slide_banner" class="banner_margin">

			<c:forEach var="d" items="${count }" varStatus="status">
					<li>
						<div class="ad_top">
							<a href="ad_index.do?adno=${d.adno}"> <img
								src="poster/ad${d.adno}.PNG" title="" alt="" class="poster" width="700px" height="550px"></a>
							<form id="frm_${d.adno}" action="Ad_index.do" method="get">
								<input type="hidden" name="adno" value="${d.adno}">
							</form>
						</div>
						<div class="ad_bottom" >
							<ul>
								<li>�������� : ${d.adsubject }</li>
								<li>����ð� : ${d.adtime }</li>
								<li>����Ʈ : ${d.ppc }</li>
								<li>�츮 ���� ����</li>
							</ul>
						</div>
					</li>
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