package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaWriteOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String name=req.getParameter("name");
		System.out.println("name:"+name);
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		BoardDTO d = new BoardDTO();
		d.setName(name);
		d.setSubject(subject);
		d.setContent(content);
		d.setPwd(pwd);
		BoardDAO.qnaWrite(d);
		return "qna_list.do";
	}

}
