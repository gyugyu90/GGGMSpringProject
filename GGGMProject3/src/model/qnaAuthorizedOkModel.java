package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.BoardDAO;
import dao.BoardDTO;
import dao.ReplyDTO;
public class qnaAuthorizedOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String rPage=req.getParameter("rPage");
		if(rPage==null)
		{
			rPage="1";
		}
		int rcurpage=Integer.parseInt(rPage);
		 String pwd=req.getParameter("pwd");
		 String no=req.getParameter("no");
		 String strPage=req.getParameter("page");
		 String db_pwd = BoardDAO.qnaAuthorizedData(Integer.parseInt(no));
		 boolean bCheck=false;
			if(pwd.equals(db_pwd))
			{
				bCheck=true;
				BoardDTO d =BoardDAO.qnaContentData(Integer.parseInt(no));
				List<ReplyDTO> temp=
						BoardDAO.replyListData(Integer.parseInt(no));
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
				int rtotal=BoardDAO.replyTotalPage(Integer.parseInt(no));
				
				req.setAttribute("rcurpage",rcurpage);
				req.setAttribute("rtotal",rtotal);
				req.setAttribute("rlist", list);
				req.setAttribute("d", d);
				req.setAttribute("no", no);
				req.setAttribute("strPage", strPage);
				req.setAttribute("title", "내용보기");
				req.setAttribute("jsp", "../board/qna_content.jsp");
				
			}
			else
			{
				bCheck=false;
				req.setAttribute("title", "글쓰기");
				return "qna_authorized.do?no="+no+"&page="+strPage;
			}
			return "pages/main/main.jsp";
		


	}

}
