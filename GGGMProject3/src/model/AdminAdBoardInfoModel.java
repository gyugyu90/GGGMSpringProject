package model;

import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;

public class AdminAdBoardInfoModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String adid=req.getParameter("adid");
		AdrequestDAO dao=new AdrequestDAO();
		AdrequestDTO d=dao.adReqInfo(adid);
		StringTokenizer st=new StringTokenizer(d.getWeight(), "|");
		String[] weight=new String[7];
		int k=0;
		while(st.hasMoreTokens()){
			weight[k]=st.nextToken();			
			k++;
		}
		System.out.println(d.getData1());
		System.out.println(d.getData2());
		st=new StringTokenizer(d.getData1(), "|");
		String[] str=new String[7];
		k=0;
		System.out.println("1");
		while(st.hasMoreTokens()){
			str[k]=st.nextToken();
			k++;
		}
		String sex=str[0];
		String min_age=str[1];
		String addr=str[2];
		String marry=str[3];
		int jtotal=Integer.parseInt(str[4]);
		String min_sal=str[5];
		int itotal=Integer.parseInt(str[6]);
		
        
	
			
		
		       
		 
		
		req.setAttribute("d", d);
		req.setAttribute("weight", weight);
		req.setAttribute("jsp", "../Admin/board/AdminAdBoardInfo.jsp");
		return "pages/main/main.jsp";
	}

}
