package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaModifyOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String name=req.getParameter("name");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		BoardDTO d=new BoardDTO();
		d.setNo(Integer.parseInt(no));
		d.setName(name);
		d.setSubject(subject);
		d.setContent(content);
		d.setPwd(pwd);
		// DB¿¬µ¿ 
		
		BoardDAO.qnaUpdate(d);
		req.setAttribute("no", d.getNo());
		req.setAttribute("page", page);
		return "qna/qna_modify_ok.jsp";
	}

}
