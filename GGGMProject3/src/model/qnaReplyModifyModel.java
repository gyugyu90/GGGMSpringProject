package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.ReplyDTO;

public class qnaReplyModifyModel implements Model {

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
		BoardDAO.replyUpdate(d);
		// Insert완료 
		return "qna_reply_content.do?no="+bno+"&page="+page;
	}

}
