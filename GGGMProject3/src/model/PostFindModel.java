package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SignupDAO;
import dao.ZipcodeDTO;

public class PostFindModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("EUC-KR");
	    String dong=req.getParameter("dong");
	    
	    int count=SignupDAO.postFindCount(dong);
	    
	    List<ZipcodeDTO> list=SignupDAO.postFindData(dong);
	    req.setAttribute("count", count);
	    req.setAttribute("list", list);
	    System.out.println("size:"+list.size());
		return "pages/member/postfind_result.jsp";
	}

}