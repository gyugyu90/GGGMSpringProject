package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdGraphDAO;
import dao.AdvertiseDTO;

public class Ad_List_GraphModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String adid=(String)session.getAttribute("id");
		
		List<AdvertiseDTO> list=AdGraphDAO.ListOfAdno(adid);
		
		req.setAttribute("list", list);
		req.setAttribute("jsp", "../adhost/ad_graph_list.jsp");
		return "pages/main/main.jsp";
		
	}

}
