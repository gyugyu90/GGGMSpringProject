package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyBoardDAO;
import dao.ReplyDTO;

public class Ad_IndexModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int strNo=Integer.parseInt(req.getParameter("adno"));
		List<ReplyDTO> list = ReplyBoardDAO.replyListData(strNo);
		System.out.println("list size:"+list.size());
		req.setAttribute("list", list);
		req.setAttribute("curpage", strNo);
		req.setAttribute("jsp", "../adview/ad_index.jsp?adno="+strNo);
		return "pages/main/main.jsp";
	}

}
