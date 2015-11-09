package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import java.util.*;

public class FaqModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<FaqDTO> faqlist= FaqDAO.faqAllData();
		req.setAttribute("faqlist", faqlist);
		req.setAttribute("jsp", "../board/faq.jsp");
		
		
		return "/pages/main/main.jsp";
//		return "/pages/board/faq.jsp";
	}

}
