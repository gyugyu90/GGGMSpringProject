package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;

public class NoticeWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

		req.setAttribute("jsp", "../board/notice_write.jsp");
		return "pages/main/main.jsp";
	}
}
