<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, java.util.*, org.json.JSONObject"%>
<%
	Connection conn=null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "scott", "tiger");
		
		ResultSet rs=null;
		List myadviewlist=new LinkedList();
		JSONObject responseObj=new JSONObject();
		String sql="SELECT viewtime, point FROM adviewlist WHERE id=?";//
		PreparedStatement ps=conn.prepareStatement(sql);
		String id=(String)session.getAttribute("id");
		ps.setString(1, id);
		rs=ps.executeQuery();
		JSONObject adviewObj=null;
		
		while(rs.next()){
			String viewtime=rs.getDate("viewtime").toString();
			int point=rs.getInt("point");
			adviewObj=new JSONObject();
			adviewObj.put("viewtime", viewtime);
			adviewObj.put("point", point);
			myadviewlist.add(adviewObj);
		}
		responseObj.put("myadviewlist", myadviewlist);
		out.println(responseObj.toString());
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		if(conn!=null){
			try{
				conn.close();
			}catch(Exception ex){}
		}
	}
%>