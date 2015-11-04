package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaModifyModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		BoardDTO d=BoardDAO.qnaUpdateData(Integer.parseInt(strNo));
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "수정하기");
		req.setAttribute("jsp", "../board/qna_modify.jsp");
		return "pages/main/main.jsp";
	}

}
