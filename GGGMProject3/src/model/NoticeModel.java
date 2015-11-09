package model;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.*;
import dao.NoticeDAO;
import dao.NoticeDTO;

public class NoticeModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		Map map=new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		
		List<NoticeDTO> noticelist= NoticeDAO.noticeListData(map);

		for(NoticeDTO d:noticelist){
			d.setDbday(sdf.format(d.getRegdate()));
			d.setReplyCount(NoticeDAO.noticeReplyCount(d.getNo()));
		}
//////////////////////////////		
		
		req.setAttribute("noticelist", noticelist);
		req.setAttribute("today", sdf.format(new Date()));
		int totalpage=NoticeDAO.noticeTotalPage();
		
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("title", "자유 게시판");
		req.setAttribute("jsp", "../board/notification.jsp");
		return "pages/main/main.jsp";
	}
}
