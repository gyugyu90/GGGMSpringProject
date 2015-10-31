package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;

public class PointModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		int point=memberDAO.memberTotalPoint();
		
		
		req.setAttribute("jsp", "/pages/myinfo/point.jsp");
		return "pages/main/main.jsp";
		
	}

}
