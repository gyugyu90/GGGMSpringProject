package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminBoardModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setAttribute("jsp", "../Admin/board/board.jsp");
		return "pages/main/main.jsp";
	}

}
