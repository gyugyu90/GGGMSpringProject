package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import dao.ReplyDTO;

public class qnaReplyWriteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub		
		req.setCharacterEncoding("EUC-KR");
		String msg=req.getParameter("msg");
		System.out.println("msg:"+msg);
		String root=req.getParameter("no");
		String bno=req.getParameter("bno");
		System.out.println("bno:"+bno);
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
		BoardDAO.replyNewWrite(d);
		//Insert완료
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "pages/board/qna_reply_write.jsp";
	}

}



