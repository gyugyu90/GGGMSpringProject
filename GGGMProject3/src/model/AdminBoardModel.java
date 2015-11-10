package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdrequestDAO;
import dao.AdrequestDTO;
import dao.FaqDAO;
import dao.FaqDTO;

public class AdminBoardModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		Map map = new HashMap();
		map.put("start", 1); // #{start}
		map.put("end", 5); // #{end}
		List<FaqDTO> faqlist= FaqDAO.faqListData(map);
		
		AdrequestDAO dao=new AdrequestDAO();
		List<AdrequestDTO> adlist=dao.adRequestList();
		
		req.setAttribute("ad", adlist);		
		req.setAttribute("faq", faqlist);
		req.setAttribute("jsp", "../Admin/board/board.jsp");
		return "pages/main/main.jsp";
	}

}
