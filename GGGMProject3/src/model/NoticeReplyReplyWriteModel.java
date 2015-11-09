package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDAO;
import dao.ReplyDTO;

public class NoticeReplyReplyWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		String rmsg=req.getParameter("rrmsg");
		String root=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB���� 
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(rmsg);
		// DB
		ReplyDTO parent=NoticeDAO.noticeReplyParentInfo(Integer.parseInt(root));
		NoticeDAO.noticeReplyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step()+1);
		d.setGroup_tab(parent.getGroup_tab()+1);
		d.setRoot(Integer.parseInt(root));
		NoticeDAO.noticeReplyReplyWrite(d);
		NoticeDAO.noticeReplyDepthIncrement(Integer.parseInt(root));
		// Insert�Ϸ� 
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/notice_reply_reply_write.jsp";
	}

}



