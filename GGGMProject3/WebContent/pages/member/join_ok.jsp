<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function ok(){      
      window.parent.Shadowbox.close();
}

</script>
<style type="text/css">
#wrapper{
	border: 5px solid ;
	width: 600px;
	background-color: #ff8080;
	margin: 0px auto;
	border-radius:10px;
	padding: 15px;
}
#ok{
width: 100px; 
height: 50px; 
margin-left: 250px; 
margin-top: 10px; 
border-radius:10px;
}
</style>
</head>
<body>
   <div id="wrapper">    
   <img alt="" src="img/join_ok.jpg" width="600" height="670">
   <input type="button" id="ok" onclick="ok()" value="확인">
  </div>
</body>
</html>