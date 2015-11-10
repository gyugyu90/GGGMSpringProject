package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FaqDAO;
import dao.FaqDTO;

public class AdminFAQInfoModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String page=req.getParameter("page");
		String no=req.getParameter("no");
		FaqDAO dao=new FaqDAO();
		FaqDTO dto=dao.faqData(Integer.parseInt(no));
		req.setAttribute("page", page);
		req.setAttribute("d", dto);		
		req.setAttribute("jsp", "../Admin/board/AdFaqInfo.jsp");
		return "pages/main/main.jsp";
	}

}
