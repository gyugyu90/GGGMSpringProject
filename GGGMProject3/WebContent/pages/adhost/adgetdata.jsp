<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*, java.util.*, org.json.JSONObject"%>
<%
	Connection conn=null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "scott", "tiger");
		
		ResultSet rs=null;
		List adviewlist=new LinkedList();
		JSONObject responseObj=new JSONObject();
		String sql="SELECT COUNT(*) as count FROM adviewlist WHERE adno=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		String adno=request.getParameter("adno");
		
		ps.setInt(1, Integer.parseInt(adno));
		rs=ps.executeQuery();
		JSONObject adviewObj=new JSONObject();
		
		while(rs.next()){
			int count = rs.getInt("count");
			
			adviewObj.put("count", count);
			
			adviewlist.add(adviewObj);
		}
		
		responseObj.put("adviewlist", adviewlist);
		out.println(responseObj.toString());
		System.out.println("adgetdata 전송완료");
		/* // 하루에 몇명 카운트/ 하루에 어떤 사람이 많이봤나.
		while(rs.next()){
			String when=rs.getDate("when").toString();
			int point=rs.getInt("point");
			String sex=rs.getString("sex");
			String birth=rs.getString("birth");
			String addr1=rs.getString("addr1");
			int salary = rs.getInt("salary");
			String ismarried = rs.getString("ismarried");
			String job = rs.getString("job");
			String interest = rs.getString("interest");
			adviewObj=new JSONObject();
			adviewObj.put("when", when);
			adviewObj.put("point", point);
			adviewObj.put("sex", sex);
			adviewObj.put("birth", birth);
			adviewObj.put("salary", salary);
			adviewObj.put("ismarried", ismarried);
			adviewObj.put("job", job);
			adviewObj.put("interest", interest);
			adviewlist.add(adviewObj);
		}
		responseObj.put("adviewlist", adviewlist);
		out.println(responseObj.toString()); */
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