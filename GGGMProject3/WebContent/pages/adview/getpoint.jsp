<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
   try{
      Class.forName("oracle.jdbc.driver.OracleDriver");
      String url="jdbc:oracle:thin:@localhost:1521:ORCL";
      Connection conn=DriverManager.getConnection(url, "scott", "tiger");
      
      //자기 포인트 올리기
      String sql="UPDATE memberData SET sumpoint=sumpoint+? WHERE id=?";
      PreparedStatement ps=conn.prepareStatement(sql);
      ps.setInt(1, 1);
      
      //myadviewlist에 자기 본 정보 insert
      //adviewlist에 자기 본 정보 insert
      //js..... button 옆에 체크 아이콘 넣기
      
      
      ResultSet rs=ps.executeQuery();
      
      
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <center>
      <table border="0" width="350">
         <tr bgcolor="#ccffcc">
            <th>사번</th>
            <th>이름</th>
            <th>부서</th>
            <th>근무지</th>
            <th>입사일</th>
         </tr>
         <% while(rs.next()){ %>
         <tr align="center">
            <td><%=rs.getInt(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getDate(5).toString() %></td>
         </tr>
         <% 
            }
            rs.close();
            ps.close();
            conn.close();
         %>
      </table>
   </center>
</body>
</html>
<%
   }catch(Exception ex){
      System.out.println(ex.getMessage());
   }
%>