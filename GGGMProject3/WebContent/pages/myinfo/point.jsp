<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>광고구마</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="<%=request.getContextPath() %>/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="<%=request.getContextPath() %>/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=request.getContextPath() %>/css/AdminLTE.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
	
</script>
<style type="text/css">
#body {
	width: 100%;
	height: 100%;
}

#body #top {
	width: 100%;
	height: 70%;
}

#body #top #top_left {
	float: left;
	width: 50%;
	height: 100%;
	font-family: 맑은 고딕;
	font-size: 15pt;
	text-align: center;
	padding-top: 10%;
}

#body #top #top_right {
	float: right;
	width: 50%;
	height: 100%;
	padding-top: 20px;
	padding-right: 20px
}

#body #bottom {
	width: 100%;
	height: 30%;
	float: left;
	font-family: 맑은 고딕;
	font-size: 15pt;
	padding-left: 94px;
	padding-right: 13px;
}

#body #bottom .point_table {
	width: 20%;
}

li {
	list-style-type: none;
	padding: 5px;
}

table {
	width: 100%;
}

#first_list {
	color: white;
	background-color: RGB(152,109,68);
}

#arrow {
	padding-left: 125px;
}
</style>
</head>

<body>

	<div id="body">
		<div class=row>
			<div id="top">
				<div id="top_left">
				<form method="post" action="exchange.do" id="exchange_form">
					<ul style="padding-left: 10px;margin: 0px 60px;width: 400px;">
						<li>보유 포인트 : <input type="text" id="curpoint" size=20 readonly="readonly"
							value="${point}">
						</li>
						<li><i class="fa fa-chevron-down"></i></li>
						
						<li>받을 포인트 : <input type="text" name="exchange" id="exchange" size=20 readonly="readonly">
						</li>
						
						<li>
					</ul>
					<ul style="list-style:none;margin:0px 60px">
						<li style="float:left; margin:0px 15px" id="exA">백화점A</li>
						<li style="float:left; margin:0px 15px" id="exB">백화점B</li>
						<li style="float:left; margin:0px 15px" id="exC">문화상품권</li>
					</ul>
						<img src="img/giftcard1.jpg" id="imgA" width=280 height=160>
						<img src="img/giftcard2.jpg" id="imgB" width=280 height=160 style="display: none;"> 
						<img src="img/giftcard3.jpg" id="imgC" width=280 height=160 style="display: none;">
						<br>
						<input type="text" id="exText" size=3>매&nbsp;
						<input type="button" name="hj" id="exBtn" value="환전하기">
				</form>
				</div>
				<div id="top_right">

					<!-- Line chart -->
					<div id="linechart_material"></div>

				</div>
			</div>
		</div>
		<div class=row>
			<div id="bottom">
				포인트 통장
				<table>

					<tr id="first_list">
						<th class="point_table">일자</th>
						<th class="point_table">입금포인트</th>
						<th class="point_table">출금포인트</th>
						<th class="point_table">입/출금내용</th>
						<th class="point_table">잔고</th>
					</tr>
					<c:forEach var="ad" items="${myadviewlist}">
						<tr>
							<td class="point_table">${ad.sdfviewtime }</td>
							<td class="point_table">${ad.point>0?ad.point:""}</td>
							<td class="point_table">${ad.point<0?ad.point:""}</td>
							<td class="point_table">${ad.description}</td>
							<td class="point_table">${ad.balance}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" style="text-align: center;"><a
							href="myadviewlist.do?page=${curpage>1?curpage-1:curpage }"><img
								src="img/prev_icon.gif"></a>&nbsp; <a
							href="myadviewlist.do?page=${curpage<totalpage?curpage+1:curpage }"><img
								src="img/next_icon.gif"></a>&nbsp;&nbsp; ${curpage } page / ${totalpage<1?1:totalpage } pages</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- jQuery 2.0.2 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
    //from googlechart.blogspot.kr
    var queryObject="";
    var queryObjectLen="";
    $.ajax({
    	type:'POST',
    	url:'pages/myinfo/getdata.jsp',
    	dataType:'json',
    	success:function(data){
    		queryObject=eval('('+JSON.stringify(data)+')');
    		queryObjectLen=queryObject.myadviewlist.length;
    	},
    	error:function(xhr,type){
    		alert('server error occured!')
    	}
    });
    
    //google chart api
    google.load('visualization', '1.1', {packages: ['line']});
    google.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Day');
      data.addColumn('number', 'point');
      
	  for(var i=0;i<queryObjectLen;i++){
		  var year=queryObject.myadviewlist[i].year;
		  var month=queryObject.myadviewlist[i].month;
		  var day=queryObject.myadviewlist[i].day;
		  var point=queryObject.myadviewlist[i].point;
		  data.addRows([
		       [new Date(year, month, day), parseInt(point)]         
		  ]);
	  }
      

      var options = {
        chart: {
          title: '일일 광고 시청 현황',
          subtitle: '포인트 적립 내역 (원)'
        },
        colors: ['RGB(78,49,21)'],
        width: 600,
        height: 450
      };

      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, options);
    }
    
    $(document).ready(function(){
    	var cur=$('#curpoint').val();
    	$('#exText').keyup(function(){
    		var ex=$('#exText').val();
    		$('#curpoint').val(cur-ex*5000);
    		$('#exchange').val(ex*5000);
    	});
    	
    	$('#exA').click(function(){
    		$('#imgA').show();
    		$('#imgB').hide();
    		$('#imgC').hide();
    	});
    	$('#exB').click(function(){
    		$('#imgA').hide();
    		$('#imgB').show();
    		$('#imgC').hide();
    	});
    	$('#exC').click(function(){
    		$('#imgA').hide();
    		$('#imgB').hide();
    		$('#imgC').show();
    	});
    	$('#exBtn').click(function(){
    		alert('해당 쿠폰이 전송되었습니다.');
    		$('#exchange_form').submit();
    	});
    	
    });
  </script>
</body>
</html>