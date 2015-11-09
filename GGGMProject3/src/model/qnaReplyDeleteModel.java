package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.jsoup.Connection.Response;

import dao.BoardDAO;
import dao.ReplyDTO;

public class qnaReplyDeleteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String no = req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		HttpSession session=req.getSession();
		int grade =(int)session.getAttribute("grade");
		/*req.setAttribute("no", bno);
		req.setAttribute("page", page);*/
		ReplyDTO d = BoardDAO.replyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			BoardDAO.replyDelete(Integer.parseInt(no));
			BoardDAO.replyDepthDecrement(d.getRoot());
		}
		else
		{
			if(grade==3 && (d.getDepth()==0))
			{
				BoardDAO.replyDelete(Integer.parseInt(no));
				BoardDAO.replyDepthDecrement(d.getRoot());
			}
			else if(grade==3 && (d.getDepth()!=0))
			{
				BoardDAO.replyMsgUpdate(Integer.parseInt(no));
			}
		}
		return "qna_reply_content.do?no="+bno+"&page="+page;
	}

}
