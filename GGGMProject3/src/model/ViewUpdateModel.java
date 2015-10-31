package model;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;

public class ViewUpdateModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PointDTO a=new PointDTO();
		String adid =req.getParameter("adid");
		String adno=req.getParameter("adno");
		String userid=req.getParameter("Userid");
		String adpoint=req.getParameter("adpoint");
		
		a.setAdid(adid);
		a.setAdno(adno);
		a.setId(userid);
		a.setSumpoint(Integer.parseInt(adpoint));
		
		
		PointDAO.ViewListInsert(a);
		
			
		
		req.setAttribute("d", d);
		req.setAttribute("no", strNo);
		req.setAttribute("page", strPage);
		req.setAttribute("title", "�����ϱ�");
		req.setAttribute("jsp", "history.back()");
		return "main/main.jsp";

	}
	
}
