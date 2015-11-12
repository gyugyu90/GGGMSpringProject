package model;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.memberDAO;
import dao.memberDTO;

public class myPageModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		System.out.println(id);
		memberDAO dao=new memberDAO();
		memberDTO d=dao.getMemberInfo(id);
		System.out.println(d.getEmail());
		System.out.println(d.getEmailreceive());
		StringTokenizer s=new StringTokenizer(d.getEmail(),"@");
		d.setEmail(s.nextToken());
		System.out.println(d.getEmail());
		req.setAttribute("d", d);
		if(d.getGrade()==1)
		req.setAttribute("jsp", "../myinfo/myPage_user.jsp");
		else if(d.getGrade()==2)
			req.setAttribute("jsp", "../myinfo/myPage_ad.jsp");
		return "pages/main/main.jsp";
	}

}
