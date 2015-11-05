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

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
		var mancount=$('#mancount');
		var womancount=$('#womancount');
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['남자', mancount],
          ['여자',    womancount]
        ]);

        var options = {
          title: '성별'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
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
	
}
#body #top #top_right{
	float: right;
	width:50%;
	height:100%;
	
	text-align: center;
	
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
	width: 10%;
	text-align: center;
	
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
				<img src="poster/ad${list.adno}.PNG" width=300 height=300>
				<input type="hidden" id="adno" value="${list.adno}"/>
				
				<input type="hidden" id="mancount" value="${mancount }"/>
				<input type="hidden" id="womancount" value="${womancount }"/>
			</div>
			<div id="top_right">
				
                            <!-- Line chart -->
                            <div id="linechart_material"></div>
                  
			</div></div>
		</div>
		<div class=row>
		<div id="bottom">
			광고 현황
			<table>
				
				<tr  id="first_list">
					<th  class="point_table">
					성별
					</th>
					<th class="point_table">
					나이별
					</th>
					<th class="point_table">
					지역별
					</th>
					<th class="point_table">
					연봉별
					</th >
					<th class="point_table" >
					결혼여부
					</th>
					<th class="point_table" >
					직업별
					</th>
					<th class="point_table" >
					취미별
					</th>
				</tr>
				
				<tr>
					<td class="point_table">
						
					</td>
					<td class="point_table">
					    
					</td>
					<td class="point_table">
					    사용
					</td>
					<td class="point_table">
					    
					</td >
					<td class="point_table" >
					    	
					</td>
				</tr>
				
				
			</table>
			<div id="piechart" style="width: 900px; height: 500px;"></div>
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
    var listadno=$('#adno').val();
    $.ajax({
    	type:'POST',
    	url:'pages/adhost/adgetdata.jsp',
    	data:{adno:listadno},
    	dataType:'json',
    	success:function(data){
    		queryObject=eval('('+JSON.stringify(data)+')');
    		queryObjectLen=queryObject.adviewlist.length;
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
      data.addColumn('number', 'count');
      
	  for(var i=0;i<queryObjectLen;i++){
		  var count=queryObject.adviewlist[i].count;
		  data.addRows([
		       [i+1, parseInt(count)]         
		  ]);
	  }
      

      var options = {
        chart: {
          title: '광고 시청 현황',
          
        },
        width: 400,
        height: 350
      };
      var chart = new google.charts.Line(document.getElementById('linechart_material'));
		
      chart.draw(data, options);
    }
  </script>
</body>
</html>