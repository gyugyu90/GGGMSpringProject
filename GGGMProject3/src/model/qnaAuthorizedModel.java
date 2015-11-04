package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaAuthorizedModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
			String strNo=req.getParameter("no");
			String strPage=req.getParameter("page");
			int curpage=Integer.parseInt(strPage);
		    BoardDTO d=BoardDAO.qnaContentData2(Integer.parseInt(strNo));
		    req.setAttribute("strNo",strNo);
		    req.setAttribute("strPage", strPage);
		    req.setAttribute("d", d);
		    req.setAttribute("curpage",curpage);
		    req.setAttribute("title", "±Û¾²±â");
			req.setAttribute("jsp", "../board/qna_authorized.jsp");
		    return "pages/main/main.jsp";
		
		
		
	}

}
