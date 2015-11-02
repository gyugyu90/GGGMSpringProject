package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;
import dao.ReplyDTO;

import java.util.*;

public class qnaContentModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String rPage=req.getParameter("rPage");
		if(rPage==null)
			rPage="1";
		int rcurpage=Integer.parseInt(rPage);
		
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");
		BoardDTO d = BoardDAO.qnaContentData(Integer.parseInt(strNo));
		List<ReplyDTO> temp=
				BoardDAO.replyListData(Integer.parseInt(strNo));
			List<ReplyDTO> list=
					new ArrayList<ReplyDTO>();
			int j=0;
			int pagecnt=(rcurpage*5)-5;
			for(int i=0;i<temp.size();i++)
			{
				if(j<5 && i>=pagecnt)
				{
					ReplyDTO dd=temp.get(i);
					list.add(dd);
					j++;
				}
			}
		int rtotal=BoardDAO.replyTotalPage(Integer.parseInt(strNo));
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		req.setAttribute("d", d);
		req.setAttribute("strNo", strNo);
		req.setAttribute("strPage", strPage);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "../board/qna_content.jsp");
		return "pages/main/main.jsp";
	}

}
