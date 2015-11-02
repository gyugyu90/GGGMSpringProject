package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.ReplyDTO;

public class qnaReplyWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
		String comment=req.getParameter("comment");
		String root=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB연동 
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(comment);
		// DB
		ReplyDTO parent=BoardDAO.replyParentInfo(Integer.parseInt(root));
		BoardDAO.replyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step()+1);
		d.setGroup_tab(parent.getGroup_tab()+1);
		d.setRoot(Integer.parseInt(root));
		BoardDAO.replyReplyWrite(d);
		BoardDAO.replyDepthIncrement(Integer.parseInt(root));
		// Insert완료 
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "qna/qna_reply_write.jsp";
	}

}
