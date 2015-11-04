package model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

public class ViewUpdateModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		AdGraphDTO a=new AdGraphDTO();
		String adid =req.getParameter("adid");
		int adno=Integer.parseInt(req.getParameter("adno"));
		String userid=req.getParameter("Userid");
		String adpoint=req.getParameter("adpoint");
		
		a.setAdid(adid);
		a.setAdno(adno);
		a.setId(userid);
		a.setPoint(Integer.parseInt(adpoint));
		
		
		AdGraphDAO.ViewListInsert(a);
		
			
		


		req.setAttribute("title", "수정하기");
		req.setAttribute("jsp", "history.back()");
		return "main/main.jsp";

	}
	
}
