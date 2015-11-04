package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyBoardDAO;
import dao.ReplyBoardDTO;
import dao.ReplyDTO;

import java.util.*;
public class BoardContentModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String rPage=req.getParameter("rPage");
		if(rPage==null)
			rPage="1";
		int rcurpage=Integer.parseInt(rPage);
		
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		ReplyBoardDTO d=ReplyBoardDAO.boardContentData(Integer.parseInt(strNo));
		List<ReplyDTO> temp=
			ReplyBoardDAO.replyListData(Integer.parseInt(strNo));
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
		int rtotal=ReplyBoardDAO.replyTotalPage(Integer.parseInt(strNo));
		
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rlist", list);
		req.setAttribute("d", d);
		req.setAttribute("curpage", strPage);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "pages/adview/ad_index.jsp");
		return "main/main.jsp";
	}

}





