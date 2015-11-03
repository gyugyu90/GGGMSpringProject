package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;

public class NoticeModifyModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		int no = Integer.parseInt(req.getParameter("no"));
		
		NoticeDTO d = NoticeDAO.noticeContentData(no);
		
		req.setAttribute("oldsubject", d.getSubject());
		req.setAttribute("oldcontent", d.getContent());
		req.setAttribute("no", d.getNo());
		
		req.setAttribute("jsp", "../board/notice_modify.jsp");
		return "pages/main/main.jsp";
	}

}
