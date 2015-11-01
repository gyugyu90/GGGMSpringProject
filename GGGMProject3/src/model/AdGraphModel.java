package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;

public class AdGraphModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		
		
		
		req.setAttribute("jsp", "/pages/adhost/ad_graph.jsp");
		return "pages/main/main.jsp";
		
	}

}
