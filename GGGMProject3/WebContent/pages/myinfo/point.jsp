<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>광고구마</title>
		<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="<%=request.getContextPath() %>/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<%=request.getContextPath() %>/css/AdminLTE.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	
</script>
<style type="text/css">
#body {
	width: 100%;
	height: 100%;
}
#body #top{
	width:100%;
	height: 70%;
}
#body #top #top_left{
	float: left;
	width:50%;
	height:100%;
	font-family: 맑은 고딕;
	font-size: 15pt;
	
	text-align: center;
	padding-top: 10%;
	
}
#body #top #top_right{
	float: right;
	width:50%;
	height:100%;
	padding-top: 20px;
	padding-right: 20px
}
#body #bottom{
	width:100%;
	height: 30%;
	float: left;
	font-family: 맑은 고딕;
	font-size: 15pt;
	padding-left: 15px;
	
}
#body #bottom .point_table{
	width: 20%;
	
}
li{ list-style-type : none;
	padding: 5px;
	
 }
 table{
 width:100%;
 }
#first_list{
	color: white;
	background-color: blue
}
#arrow{
	padding-left: 125px;
}
</style>
</head>

<body>
	
	<div id="body">
		<div class=row>
		<div id="top">
			<div id="top_left">
			
				<ul style="padding-left:10px;">
				<li>
				보유 포인트 : ${point}
				<input type="text" size=20 readonly="readonly">
				</li>
				<li>
					<i class="fa fa-chevron-down"></i>
				</li>
				<li>
				받을 포인트 : 
				<input type="text" size=20 >
				</li>
				<li>
				<input type="radio" name="rb" value="백화점A">백화점A
				<input type="radio" name="rb" value="백화점B">백화점B
				<input type="radio" name="rb" value="문화상품권">문화상품권
				</li>
				</ul>
			</div>
			<div id="top_right">
				
                            <!-- Line chart -->
                            <div id="linechart_material"></div>
                  
			</div></div>
		</div>
		<div class=row>
		<div id="bottom">
			포인트 통장
			<table>
				
				<tr  id="first_list">
					<th  class="point_table">
						일자
					</th>
					<th class="point_table">
					입금포인트
					</th>
					<th class="point_table">
					출금포인트
					</th>
					<th class="point_table">
					입/출금내용
					</th >
					<th class="point_table" >
					잔고
					</th>
				</tr>
				<c:forEach var="ad" items="${myadviewlist}">
				<tr>
					<td class="point_table">
						${ad.when }
					</td>
					<td class="point_table">
					    ${ad.point }
					</td>
					<td class="point_table">
					    사용
					</td>
					<td class="point_table">
					    ${ad.description}
					</td >
					<td class="point_table" >
					    ${ad.balance}	
					</td>
				</tr>
				</c:forEach>
				
			</table>
		</div>
		</div>
	</div>
	<!-- jQuery 2.0.2 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js" type="text/javascript"></script>
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
      data.addColumn('number', 'Day');
      data.addColumn('number', 'point');
      
	  for(var i=0;i<queryObjectLen;i++){
		  var point=queryObject.myadviewlist[i].point;
		  data.addRows([
		       [i+1, parseInt(point)]         
		  ]);
	  }
      

      var options = {
        chart: {
          title: '일일 광고 시청 현황',
          subtitle: '포인트 적립 내역 (원)'
        },
        width: 600,
        height: 450
      };

      var chart = new google.charts.Line(document.getElementById('linechart_material'));

      chart.draw(data, options);
    }
  </script>
</body>
</html>