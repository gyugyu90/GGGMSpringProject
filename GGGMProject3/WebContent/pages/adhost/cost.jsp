<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
  <h3>&nbsp;&nbsp;※ 광고 비용 산출</h3>
   
    <table width=800 border=1 align=center>
     <tr align=center>
      <td>No</td>
  	  <td>Ad Subject</td>
  	  <td>Click</td>
  	  <td>Point</td>
  	  <td>Total</td>
     </tr>
     <c:forEach var="i" begin="1" end="30">
     <tr align=center>
  	  <td>${i }</td>
  	  <td>${"" }</td>
  	  <td>${"" }</td>
  	  <td>${"" }</td>
  	  <td>${"" }</td>
     </tr>
     </c:forEach>
     <tr align=center>
     <td></td>
     <td>total</td>
     <td></td>
     <td></td>
     <td></td>
     </tr>
    </table>

  
  
</body>
</html>