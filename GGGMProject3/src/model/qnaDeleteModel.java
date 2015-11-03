package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaDeleteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String strPage=req.getParameter("page");
		String strNo=req.getParameter("no");
		BoardDAO.qnaDelete(Integer.parseInt(strNo));
		req.setAttribute("strPage", strPage);
		return "pages/board/qna_delete_ok.jsp";
	}

}
