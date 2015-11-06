package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class qnaListModel implements Model {
	
	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String search = req.getParameter("search");
		String strPage = req.getParameter("page");
		String searchCheck=req.getParameter("searchCheck");
		if(strPage==null)
			strPage="1";
		if(search==null)
		    search="";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		Map map = new HashMap();
		map.put("start", start); //#{start}
		map.put("end", end); //#{end}
		map.put("search", search);
		map.put("searchCheck",searchCheck);
		if(search=="")
		{
			List<BoardDTO> list = BoardDAO.qnaListData(map);
			for(BoardDTO d:list)
			{
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			int totalpage=BoardDAO.qnaTotalPage();
			int count = BoardDAO.qnaRowCount();
			    count=count-((curpage*10)-10);
			int block=5;
			int fromPage=((curpage-1)/block*block)+1;
		    int toPage=((curpage-1)/block*block)+block;
		       if(toPage>totalpage)
		        {
		           toPage=totalpage;
		        }
		    req.setAttribute("toPage", toPage);
		    req.setAttribute("fromPage", fromPage);
		    req.setAttribute("block", block);
		    req.setAttribute("count", count);
			req.setAttribute("today", sdf.format(new Date()));
			req.setAttribute("totalpage", totalpage);
			req.setAttribute("list", list);
			req.setAttribute("curpage", curpage);
			req.setAttribute("title", "자유게시판");
			// ${title}
			req.setAttribute("jsp", "../board/qna_list.jsp");
			//${jsp}
			return "pages/main/main.jsp";
		}
		else
		{
		}
		return "pages/main/main.jsp";
		
	}

}
