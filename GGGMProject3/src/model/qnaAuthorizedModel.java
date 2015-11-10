package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;
import dao.ReplyDTO;

public class qnaAuthorizedModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
			String rPage=req.getParameter("rPage");
			if(rPage==null)
			{
				rPage="1";
			}
			int rcurpage=Integer.parseInt(rPage);
			String strNo=req.getParameter("no");
			String strPage=req.getParameter("page");
			String db_pwd = BoardDAO.qnaAuthorizedData(Integer.parseInt(strNo));
			int curpage=Integer.parseInt(strPage);
			BoardDTO d = new BoardDTO();
			if(db_pwd==null)
			{
				d= BoardDAO.qnaContentData(Integer.parseInt(strNo));
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
				 req.setAttribute("strNo",strNo);
				 req.setAttribute("strPage", strPage);
				 req.setAttribute("d", d);
				 req.setAttribute("curpage",curpage);
				 req.setAttribute("db_pwd", db_pwd);
				 req.setAttribute("jsp", "../board/qna_content.jsp");
			}
			else
			{
			    d=BoardDAO.qnaContentData2(Integer.parseInt(strNo));
			    req.setAttribute("strNo",strNo);
			    req.setAttribute("strPage", strPage);
			    req.setAttribute("d", d);
			    req.setAttribute("curpage",curpage);
			    req.setAttribute("title", "±Û¾²±â");
				req.setAttribute("jsp", "../board/qna_authorized.jsp");
			}
		 
		    return "pages/main/main.jsp";
		
		
		
	}

}
