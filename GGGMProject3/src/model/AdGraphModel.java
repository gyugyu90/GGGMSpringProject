package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.runtime.ListAdapter;
import dao.*;

public class AdGraphModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String adid=id;
		System.out.println("adgraphmodel¡¢±Ÿ");
		
		int adno=Integer.parseInt(req.getParameter("adno"));
		
		AdvertiseDTO list = AdGraphDAO.AllOfAdno(adno);
		
		int count=AdGraphDAO.AdNoOverlapCount(adno);
		int nocount=AdGraphDAO.AdOverlapCount(adno);
		
		List<String> idlist= AdGraphDAO.idOfAdno(adno);
		
		
		int mancount=AdGraphDAO.manofadno(adno);
		System.out.println(mancount);
		int womancount=AdGraphDAO.womanofadno(adno);
		System.out.println(womancount);
		req.setAttribute("mancount", mancount);
		req.setAttribute("womancount", womancount);
		req.setAttribute("fnocount", nocount);
		req.setAttribute("fcount", count);
		req.setAttribute("list", list);
		req.setAttribute("id", id);
		req.setAttribute("jsp", "../adhost/ad_graph.jsp");
		System.out.println("debug5");
		return "pages/main/main.jsp";
	}

}
