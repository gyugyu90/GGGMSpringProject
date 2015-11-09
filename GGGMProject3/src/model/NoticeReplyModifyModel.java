package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import dao.ReplyDTO;

public class NoticeReplyModifyModel implements Model {
	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String rmsg=req.getParameter("umsg");
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setNo(Integer.parseInt(no));
		d.setMsg(rmsg);
		// DB
		NoticeDAO.noticeReplyUpdate(d);
		// Insert완료 
		return "notice_content.do?no="+bno+"&page="+page;
	}

}
