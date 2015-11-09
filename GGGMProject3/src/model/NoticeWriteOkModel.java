package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;

public class NoticeWriteOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("euc-kr");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		
		NoticeDTO d = new NoticeDTO();
		d.setSubject(subject);
		d.setContent(content);
		
		NoticeDAO.noticeWrite(d);
		return "notice.do";
		}
}
