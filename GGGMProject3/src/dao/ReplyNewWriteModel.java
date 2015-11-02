package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyBoardDAO;
import dao.ReplyDTO;
import model.Model;

public class ReplyNewWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		String msg=req.getParameter("rmsg");
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
		d.setMsg(msg);
		ReplyBoardDAO.replyNewWrite(d);
		//Insert완료
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/adview/reply_new_insert.jsp";
	}

}
