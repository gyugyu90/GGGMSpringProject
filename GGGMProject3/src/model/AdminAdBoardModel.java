package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import dao.*;
public class AdminAdBoardModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		AdrequestDAO dao=new AdrequestDAO();
		List<AdrequestDTO> list=dao.adRequestList();
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../Admin/board/ADBoard.jsp");
		return "pages/main/main.jsp";
	}

}
