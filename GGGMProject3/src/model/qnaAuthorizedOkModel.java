package model;

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
		 String pwd=req.getParameter("pwd");
		 String no=req.getParameter("no");
		 String strPage=req.getParameter("page");
		 String db_pwd = BoardDAO.qnaAuthorizedData(Integer.parseInt(no));
		 boolean bCheck=false;
			if(pwd.equals(db_pwd))
			{
				bCheck=true;
				BoardDTO d =BoardDAO.qnaContentData(Integer.parseInt(no));
				List<ReplyDTO> list=BoardDAO.replyListData(Integer.parseInt(no));

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
