package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.FaqDAO;
import dao.FaqDTO;

public class AdminFaqModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String strPage = req.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=5;
		int start=(curpage*rowSize)-(rowSize-1);
		int end = curpage*rowSize;
		Map map = new HashMap();
		map.put("start", start); // #{start}
		map.put("end", end); // #{end}
		int totalpage=FaqDAO.faqRowCount();
		System.out.println(totalpage);
		
		List<FaqDTO> faqlist= FaqDAO.faqListData(map);
		System.out.println(faqlist.size());
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("curpage", curpage);
		req.setAttribute("list", faqlist);
		req.setAttribute("jsp", "../Admin/board/FAQBoard.jsp");
		return "pages/main/main.jsp";
	}

}
