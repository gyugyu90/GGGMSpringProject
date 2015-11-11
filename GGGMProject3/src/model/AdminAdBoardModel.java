package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import dao.*;
public class AdminAdBoardModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		AdrequestDAO dao=new AdrequestDAO();
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		int grade=(int)session.getAttribute("grade");
		List<AdrequestDTO> list=null;
		if(grade==2){//광고주
			list=dao.adhostRequestList(id);
		}else{//관리자
			list=dao.adRequestList();
		}
		
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../Admin/board/ADBoard.jsp");
		return "pages/main/main.jsp";
	}

}
