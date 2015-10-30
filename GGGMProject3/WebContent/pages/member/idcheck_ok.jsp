<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String usableId=request.getParameter("usableId");
//session.setAttribute("usableId", usableId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function myFunction(param){
      window.parent.join_form.id.value=param;
      window.parent.Shadowbox.close();
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="myFunction('<%=usableId%>')">

</body>
</html>