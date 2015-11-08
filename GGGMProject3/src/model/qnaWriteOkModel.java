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
		String subject2=req.getParameter("subject2");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		BoardDTO d = new BoardDTO();
		d.setName(name);
		d.setSubject(subject);
		d.setSubject2(subject2);
		d.setContent(content);
		d.setPwd(pwd);
		BoardDAO.qnaWrite(d);
		return "qna_list.do";
	}

}
