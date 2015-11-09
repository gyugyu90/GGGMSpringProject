<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, java.util.*, org.json.JSONObject"%>
<%
	Connection conn=null;
	try{
		System.out.println("전송완료");
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "scott", "tiger");
		
		ResultSet rs=null;
		List adviewlist=new LinkedList();
		JSONObject responseObj=new JSONObject();
		String sql="SELECT count(*) FROM memberdata m1,memberadditional m2 WHERE m1.id=m2.id AND sex='남자' AND m1.id IN(SELECT id FROM adviewlist WHERE adno=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		String adno=request.getParameter("adno");
		System.out.println("countgetdata adno전송완료");
		ps.setInt(1, Integer.parseInt(adno));
		rs=ps.executeQuery();
		JSONObject adviewObj=new JSONObject();
			
		while(rs.next()){
			int count = rs.getInt("count");
			
			adviewObj.put("count", count);
			
			adviewlist.add(adviewObj);
		}
		System.out.println("countgetdata sql전송전");
		sql="SELECT count(*) FROM memberdata m1,memberadditional m2 WHERE m1.id=m2.id AND sex='여자' AND m1.id IN(SELECT id FROM adviewlist WHERE adno=?";
		ps=conn.prepareStatement(sql);
		String adno1=request.getParameter("adno");
		ps.setInt(1, Integer.parseInt(adno1));
		rs=ps.executeQuery();
		System.out.println("countgetdata sql전송완료");
		while(rs.next()){
			int count = rs.getInt("count");
			
			adviewObj.put("count", count);
			
			adviewlist.add(adviewObj);
		}
		
		responseObj.put("adviewlist", adviewlist);
		out.println(responseObj.toString());
		System.out.println("countgetdata 전송완료");
	
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