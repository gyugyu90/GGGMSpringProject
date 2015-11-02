package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyBoardDAO;
import dao.ReplyDTO;
import model.Model;

public class ReplyReplyUpdateModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String rmsg=req.getParameter("rmsg");
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setNo(Integer.parseInt(no));
		d.setMsg(rmsg);
		// DB
		ReplyBoardDAO.replyUpdate(d);
		// Insert완료 
		return "board_content.do?no="+bno+"&page="+page;
	}

}
