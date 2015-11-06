package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.jsoup.Connection.Response;

import dao.NoticeDAO;
import dao.ReplyDTO;

public class NoticeReplyDeleteModel implements Model {

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
		ReplyDTO d = NoticeDAO.noticeReplyDataInfo(Integer.parseInt(no));
		if(d.getDepth()==0)
		{
			NoticeDAO.noticeReplyDelete(Integer.parseInt(no));
		}
		else
		{
			if(grade==3 && (d.getDepth()==0))
			{
				NoticeDAO.noticeReplyDelete(Integer.parseInt(no));
			}
			else if(grade==3 && (d.getDepth()!=0))
			{
				NoticeDAO.noticeReplyMsgUpdate(Integer.parseInt(no));
			}
		}
		NoticeDAO.noticeReplyDepthDecrement(d.getRoot());
		return "notice_content.do?no="+bno+"&page="+page;
	}

}
