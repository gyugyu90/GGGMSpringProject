package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
public class ReplyDeleteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		
		//req.setAttribute("no", bno);
		//req.setAttribute("page", page);
		ReplyDTO d=ReplyBoardDAO.replyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			ReplyBoardDAO.replyDelete(Integer.parseInt(no));
		}
		else
		{
			ReplyBoardDAO.replyMsgUpdate(Integer.parseInt(no));
		}
		ReplyBoardDAO.replyDepthDecrement(d.getRoot());
		return "board_content.do?no="+bno+"&page="+page;
	}

}





