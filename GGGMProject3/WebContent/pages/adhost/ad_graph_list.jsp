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
			mode : 'horizontal',// ���� ���� ���� �����̵�
			speed : 500, // �̵� �ӵ��� ����
			pager : false, // ���� ��ġ ����¡ ǥ�� ���� ����
			moveSlides : 1, // �����̵� �̵��� ����
			slideWidth : 700, // �����̵� �ʺ�
			minSlides : 1, // �ּ� ���� ����
			maxSlides : 1, // �ִ� ���� ����
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
<h2 style="margin:0px 200px"><img src="<%=request.getContextPath() %>/img/adicon.png" style="width:38px">&nbsp;&nbsp;�츮 ȸ�� ����</h2>
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