package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyBoardDAO;
import dao.ReplyDTO;
import model.Model;

public class ReplyReplyWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		String rmsg=req.getParameter("rmsg");
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
		d.setMsg(rmsg);
		// DB
		ReplyDTO parent=
		  ReplyBoardDAO.replyParentInfo(Integer.parseInt(root));
		ReplyBoardDAO.replyStepIncrement(parent);
		d.setGroup_id(parent.getGroup_id());
		d.setGroup_step(parent.getGroup_step()+1);
		d.setGroup_tab(parent.getGroup_tab()+1);
		d.setRoot(Integer.parseInt(root));
		ReplyBoardDAO.replyReplyWrite(d);
		ReplyBoardDAO.replyDepthIncrement(Integer.parseInt(root));
		// Insert완료 
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_new_insert.jsp";
	}

}



