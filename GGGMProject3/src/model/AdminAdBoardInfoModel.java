package model;

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
		req.setAttribute("d", d);
		req.setAttribute("jsp", "../Admin/board/AdminAdBoardInfo.jsp");
		return "pages/main/main.jsp";
	}

}
