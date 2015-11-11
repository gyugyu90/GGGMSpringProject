<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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

        var data = google.visualization.arrayToDataTable([
          ['클릭수', 'ToDay'],
          ['여자',     <%=request.getAttribute("womancount")%>],
          ['남자',      <%=request.getAttribute("mancount")%>]
          
        ]);

        var options = {
          title: '성별 분류',
          'sliceVisibilityThreshold':0 ,
          'width' : 350,
          'height' : 350,
          fontSize:15
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
   
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['클릭수', 'ToDay'],
          ['10대',      <%=request.getAttribute("age1")%>+0],
          ['20대',      <%=request.getAttribute("age2")%>+0],
          ['30대',      <%=request.getAttribute("age3")%>+0],
          ['40대',      <%=request.getAttribute("age4")%>+0],
          ['50대',      <%=request.getAttribute("age5")%>+0],
          ['60대',      <%=request.getAttribute("age6")%>+0],
          ['70대',      <%=request.getAttribute("age7")%>+0],
          ['80~',      <%=request.getAttribute("age8")%>]
          
        ]);

        var options = {
          title: '나이별 분류',
          'sliceVisibilityThreshold':0 ,
          'width' : 350,
          'height' : 350,
          fontSize:15
        };
      
        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
    </script>
<style type="text/css">
#white {
 background-color: white;
}
#body {
   background-color: white;
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
   
   
   
   
   
}
#body #top #top_left #img{
   float : left;
   margin-left: 16%;
   padding-left: 16%;
}
#body #top #top_right{
   float: right;
   width:50%;
   height:100%;
   
   
   
}
#body #top #top_right #linechart_material{
   float : right;
   margin-right: 15%;
   padding-right: 15%;
   
}
#body #bottom{

	width:100%;
	height: 30%;
	
	font-family: 맑은 고딕;
	
	
	

   width:100%;
   height: 30%;
   
   

}
#body #bottom #piechart{

	width: 50%;
	height: 100%;
	float: left;
	
	padding-top: 30px;
	

   width: 400px;
   height: 300px;
   float: left;
   position:absolute;
   padding-top: 30px;
   margin-left: 13%;

}
#body #bottom #piechart1{

	width: 50%;
	height: 100%;
	float: right;
	
	padding-top: 30px;
	

   
   width: 400px;
   height: 300px;
   float: right;
   
   padding-top: 30px;
   margin-right: 10%;

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

<body id="white">
   
   <div id="body">
      <div class=row>
      <h2 style="margin:0px 160px">광고 실적 분석</h2>
      <br>
      <div id="top">
         <div id="top_left">
            
            <img id="img" src="poster/ad${list.adno}.PNG" width=350 height=230>
            <input type="hidden" id="adno" value="${list.adno}"/>
            <input type="hidden" id="mancount" value="mancount" value="${mancount }"/>
            <input type="hidden" id="womancount" name="womancount"value="${womancount }">
            <table style="width:270px;margin-left:164px;">
            	<tr>
            		<td height=45px>제목</td><td>${list.adsubject}</td>
            	</tr>
            	<tr>
            		<td height=45px>재생시간</td><td>${list.adtime }</td>
            	</tr>
            	<tr>
            		<td height=45px>시청 포인트</td><td>${list.ppc }</td>
            	</tr>
            </table>
         </div>
         <div id="top_right">
            
                            <!-- Line chart -->
                            <div id="linechart_material"></div>
                  

			</div></div>
		</div>
		<div class=row>
		<hr width=800px color=gray>
		<div id="bottom">

				<!-- <table>
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
			</table> -->
				<div id="piechart" class="col-md-6" style="padding:0px;"></div>
			<div id="piechart1" class="col-md-6" style="padding:0px;"></div>
		</div>
		</div>
	</div>
	<!-- jQuery 2.0.2 -->

         </div></div>
      </div>
      <div class=row>
      <div id="bottom">
         
         <!-- <table>
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
         </table> -->
         <div id="piechart" class="pie" style="background-color: white;"></div>
         <div id="piechart1" class="pie1" style="background-color: white;"></div>
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

    function drawChart() {;
      
      var data = new google.visualization.DataTable();
      data.addColumn('date', '날짜');
      data.addColumn('number', '클릭수');
      

	  for(var i=0;i<queryObjectLen;i++){
		  var year=queryObject.adviewlist[i].year;
		  var month=queryObject.adviewlist[i].month;
		  var day=queryObject.adviewlist[i].day;
		  var dayCount=queryObject.adviewlist[i].dayCount;
		  data.addRows([
		                
		       [new Date(year, month, day), parseInt(dayCount)]         
		  ]);
	  }
     for(var i=0;i<queryObjectLen;i++){
        
        var viewtime=queryObject.adviewlist[i].viewtime;
        var dayCount=queryObject.adviewlist[i].dayCount;
        data.addRows([
                      
             [new Date(viewtime), parseInt(dayCount)]         
        ]);
     }
      

      var options = {
        chart: {
          title: '광고 시청 현황',
          
        },
        width: 350,
        height: 350
      };
      var chart = new google.charts.Line(document.getElementById('linechart_material'));
      
      chart.draw(data, options);
    }
  </script>
</body>
</html>