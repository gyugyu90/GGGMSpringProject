package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.ReplyDTO;

public class qnaReplyDeleteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String no = req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		
		/*req.setAttribute("no", bno);
		req.setAttribute("page", page);*/
		ReplyDTO d = BoardDAO.replyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			BoardDAO.replyDelete(Integer.parseInt(no));
		}
		else
		{
			BoardDAO.replyMsgUpdate(Integer.parseInt(no));
		}
		BoardDAO.replyDepthDecrement(d.getRoot());
		return "qna_content.do?no="+bno+"&page="+page;
	}

}
