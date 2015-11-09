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

public class qnaListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		req.setCharacterEncoding("utf-8");
		int totalpage = 0;
		int count = 0;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
=======
		req.setCharacterEncoding("UTF-8");
>>>>>>> refs/remotes/origin/master
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String search = req.getParameter("search");
		System.out.println("search"+search);
		String strPage = req.getParameter("page");
<<<<<<< HEAD
		String searchCheck = req.getParameter("searchCheck");
		if (strPage == null)
			strPage = "1";
		if (search == null)
			search = "";
		int curpage = Integer.parseInt(strPage);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
=======
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
>>>>>>> refs/remotes/origin/master
		Map map = new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		map.put("search", search);
<<<<<<< HEAD
		map.put("searchCheck", searchCheck);

		if (search == "") {
			list = BoardDAO.qnaListData(map);
			for (BoardDTO d : list) {
=======
		map.put("searchCheck",searchCheck);
		if(search=="")
		{
			list = BoardDAO.qnaListData(map);
			for(BoardDTO d:list)
			{
>>>>>>> refs/remotes/origin/master
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
<<<<<<< HEAD
			totalpage = BoardDAO.qnaTotalPage();
			count = BoardDAO.qnaRowCount();
		} else {
			list = BoardDAO.qnaNameSearchListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaTotalPage(search);
			count = BoardDAO.qnaRowCount(search);
=======
			totalpage=BoardDAO.qnaTotalPage();
			count = BoardDAO.qnaRowCount();
>>>>>>> refs/remotes/origin/master
		}
<<<<<<< HEAD
		System.out.println("total  =" + totalpage + "\ncount = " + count);
		count = count - ((curpage * 10) - 10);
		int block = 5;
		int fromPage = ((curpage - 1) / block * block) + 1;
		int toPage = ((curpage - 1) / block * block) + block;
		if (toPage > totalpage) {
			toPage = totalpage;
=======
		else
		{

			list = BoardDAO.qnaSearchListData(map);
			for (BoardDTO d : list) {
				d.setDbday(sdf.format(d.getRegdate()));
				d.setReplyCount(BoardDAO.qnaReplyCount(d.getNo()));
			}
			totalpage = BoardDAO.qnaSearchTotalPage(map);
			count = BoardDAO.qnaSearchRowCount(map);

>>>>>>> refs/remotes/origin/master
		}
<<<<<<< HEAD
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
		// ${jsp}
=======
		count = count-((curpage*10)-10);
		block=5;
		fromPage=((curpage-1)/block*block)+1;
		toPage=((curpage-1)/block*block)+block;
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
>>>>>>> refs/remotes/origin/master
		return "pages/main/main.jsp";

<<<<<<< HEAD
=======

>>>>>>> refs/remotes/origin/master
	}

}
