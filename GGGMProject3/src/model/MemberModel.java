package model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;

public class MemberModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
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
		List<memberDTO> list=
				memberDAO.memberListData(map);	
		int totalpage=memberDAO.memberTotalPage();
		
		req.setAttribute("totalpage", totalpage);
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../Admin/member/member.jsp");
		return "pages/main/main.jsp";
	}

}
