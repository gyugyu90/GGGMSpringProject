package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dao.memberDTO;

public class MemberInfoModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id=req.getParameter("memberid");
		String grade=req.getParameter("grade");
		System.out.println(grade);
		memberDAO dao=new memberDAO();
		if(grade!=null){
			memberDTO dto=new memberDTO();
			dto.setId(id);
			dto.setGrade(Integer.parseInt(grade));			
			dao.memberGradeUpdate(dto);
		}
		
		
		memberDTO d=dao.getMemberInfo(id);
		req.setAttribute("d", d);
		req.setAttribute("jsp", "../Admin/member/memberInfo.jsp");
		return "pages/main/main.jsp";
	}

}
