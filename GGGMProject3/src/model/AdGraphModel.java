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
		
	/*	int count=AdGraphDAO.AdNoOverlapCount(adno);
		System.out.println(count);
		int nocount=AdGraphDAO.AdOverlapCount(adno);
		System.out.println(nocount);*/
	
		
			List<String> idlist= AdGraphDAO.idOfAdno(adno);
			
		
		
			
			int mancount=AdGraphDAO.manofadno(adno);
			int womancount=AdGraphDAO.womanofadno(adno);
			
			System.out.println(womancount);
			
			
			
			
			int age0 = AdGraphDAO.age0(adno);	
			int age1 = AdGraphDAO.age1(adno);
			int age2 = AdGraphDAO.age2(adno);
			int age3 = AdGraphDAO.age3(adno);
			int age4 = AdGraphDAO.age4(adno);
			int age5 = AdGraphDAO.age5(adno);
			int age6 = AdGraphDAO.age6(adno);
			int age7 = AdGraphDAO.age7(adno);
			int age8 = AdGraphDAO.age8(adno);
			
			req.setAttribute("age0", age0);
			req.setAttribute("age1", age1);
			req.setAttribute("age2", age2);
			req.setAttribute("age3", age3);
			req.setAttribute("age4", age4);
			req.setAttribute("age5", age5);
			req.setAttribute("age6", age6);
			req.setAttribute("age7", age7);
			req.setAttribute("age8", age8);
		
			req.setAttribute("mancount", mancount);
			req.setAttribute("womancount", womancount);
		
			/*req.setAttribute("fnocount", nocount);
			req.setAttribute("fcount", count);*/
			
			req.setAttribute("list", list);
			req.setAttribute("id", id);
			req.setAttribute("jsp", "../adhost/ad_graph.jsp");
			System.out.println("debug5");
			return "pages/main/main.jsp";
		
		
		
		
		
		
		
		
	}

}
