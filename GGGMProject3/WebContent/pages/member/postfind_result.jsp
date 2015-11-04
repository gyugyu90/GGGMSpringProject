<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
    request.setCharacterEncoding("EUC-KR");
    String dong=request.getParameter("dong");
    int count=dao.postFindCount(dong);
    List<ZipcodeDTO> list=null;
    if(count!=0)
    	list=dao.postFindData(dong);
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
td,th{
    font-family: 맑은 고딕;
    font-size: 9pt;
    color:white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function ok(zip,sido,gugun,dong,bunji)
{
	window.parent.join_form.post.value=zip;
	window.parent.join_form.addr1.value=sido+' '+gugun+' '+' '+dong+' '+bunji;
	window.parent.Shadowbox.close();
}
</script>
</head>
<body>
   <center>
<c:choose>
<c:when test="">
     <table border=0 width=400>
       <tr>
        <td align=center>검색한 결과가 없습니다</td>
       </tr>
     </table>
</c:when>
<c:otherwise>
<table border=0 width=400>
              <tr bgcolor=#ededed>
               <th width=20%>우편번호</th>
               <th width=80%>주소</th>
              </tr>
              <c:forEach var="dto" items="${list}">
              	 <tr>
                     <td width=20% align=center>${dto.zipcode}</td>
                     <td width=80% align=left><a href="javascript:ok('${dto.zipcode}', '${dto.sido}', '${dto.gugun}', '${dto.dong}', '${dto.bunji}')">${dto.sido } ${dto.gugun } ${dto.dong } ${dto.bunji }</a></td>
                 </tr>
              </c:forEach>
            </table>
</c:otherwise>
</c:choose>
   </center>
</body>
</html>


