package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;

public class NoticeModifyOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("euc-kr");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		int no = Integer.parseInt(req.getParameter("no"));
		
		System.out.println("model access succeed");
		NoticeDTO d = new NoticeDTO();
		d.setSubject(subject);
		d.setContent(content);
		d.setNo(no);
		
		NoticeDAO.noticeModify(d);
		return "notice.do";
		}
}
