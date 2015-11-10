package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.BoardDTO;

public class AdminQnAModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String search = req.getParameter("search");
		System.out.println("search"+search);
		String strPage = req.getParameter("page");
		String searchCheck=req.getParameter("searchCheck");
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		int totalpage=0;
		int count=0;
		int block=0;
		int fromPage=0;
		int toPage=0;

		if(strPage==null)
			strPage="1";
		if(search==null)
			search="";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		System.out.println("search:"+search);
		Map map = new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		map.put("search", search);
		map.put("searchCheck",searchCheck);
		if(search=="")
		{
			list = BoardDAO.qnaListData(map);
			for(BoardDTO d:list)
			{
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage=BoardDAO.qnaTotalPage();
			
		}
		else
		{

			list = BoardDAO.qnaSearchListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaSearchTotalPage(map);
			
		}
		
		
		
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("qna", list);
		req.setAttribute("curpage", curpage);
		
		req.setAttribute("jsp", "../Admin/board/QnABoard.jsp");
		return "pages/main/main.jsp";
	}

}
